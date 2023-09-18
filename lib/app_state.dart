import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/foundation.dart';

import 'entry.dart';
import 'firebase_options.dart';

class AppState extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  StreamSubscription<QuerySnapshot>? _entrySubscription;
  Map<String, Entry> _entries = {};
  Map<String, Entry> get entries => _entries;

  AppState() {
    init();
  }

  init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _user = user;
        _entrySubscription = FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid.toString())
            .collection('entries')
            .orderBy('date', descending: true)
            .snapshots()
            .listen((snapshot) {
          _entries = {};
          for (final document in snapshot.docs) {
            _entries[document.id] = Entry(
              date: document.data()['date'].toDate() as DateTime,
              countryName: document.data()['countryName'] as String,
              countryCode: document.data()['countryCode'] as String,
              producer: document.data()['producer'] as String,
              roastLevel: document.data()['roastLevel'] as String,
              mesh: document.data()['mesh'] as String,
              processing: document.data()['processing'] as String,
              variety: document.data()['variety'] as String,
              extracting: document.data()['extracting'] as String,
              comment: document.data()['comment'] as String,
            );
          }
          notifyListeners();
        });
      } else {
        _user = null;
        _entries = {};
        _entrySubscription?.cancel();
      }
      notifyListeners();
    });
  }

  Future<String> addEntry() async {
    if (_user == null) {
      throw Exception('Must be logged in');
    }

    final entries = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid.toString())
        .collection('entries');

    // ドキュメント id を自動生成
    final String docId = entries.doc().id;

    entries.doc(docId).set(<String, dynamic>{
      'date': Timestamp.fromDate(DateTime.now()),
      'countryName': '未選択',
      'countryCode': 'XX',
      'producer': '',
      'roastLevel': '',
      'mesh': '',
      'processing': '',
      'variety': '',
      'extracting': '',
      'comment': '',
    });

    return docId;
  }

  Future<void> deleteEntry(String docId) async {
    if (_user == null) {
      throw Exception('Must be logged in');
    }

    final entries = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid.toString())
        .collection('entries');

    entries.doc(docId).delete();
  }

  Future<void> updateEntry(String docId, Entry entry) async {
    if (_user == null) {
      throw Exception('Must be logged in');
    }

    final entries = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid.toString())
        .collection('entries');

    entries.doc(docId).update(<String, dynamic>{
      'date': Timestamp.fromDate(entry.date),
      'countryName': entry.countryName,
      'countryCode': entry.countryCode,
      'producer': entry.producer,
      'roastLevel': entry.roastLevel,
      'mesh': entry.mesh,
      'processing': entry.processing,
      'variety': entry.variety,
      'extracting': entry.extracting,
      'comment': entry.comment,
    });
  }

  Future<void> signout() async {
    FirebaseAuth.instance.signOut();
  }
}
