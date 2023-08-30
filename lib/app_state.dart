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
  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  User? _user;
  User? get user => _user;

  StreamSubscription<QuerySnapshot>? _entrySubscription;
  List<Entry> _entries = [];
  List<Entry> get entries => _entries;

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
        _loggedIn = true;
        _entrySubscription = FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid.toString())
            .collection('entries')
            .snapshots()
            .listen((snapshot) {
          _entries = [];
          for (final document in snapshot.docs) {
            _entries.add(
              Entry(
                date: document.data()['date'] as String,
                country: document.data()['country'] as String,
                producer: document.data()['producer'] as String,
                roastLevel: document.data()['roastLevel'] as String,
                mesh: document.data()['mesh'] as String,
                processing: document.data()['processing'] as String,
                variety: document.data()['variety'] as String,
                extracting: document.data()['extracting'] as String,
                comment: document.data()['comment'] as String,
              ),
            );
          }
        });
      } else {
        _loggedIn = false;
        _entries = [];
        _entrySubscription?.cancel();
      }
      notifyListeners();
    });
  }

  Future<DocumentReference> addEntry() {
    if (!_loggedIn) {
      throw Exception('Must be logged in');
    }

    return FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid.toString())
        .collection('entries')
        .add(<String, dynamic>{
      'date':
          '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}',
      'country': 'コスタリカ',
      'producer': 'ラスマルガリタス',
      'roastLevel': '中煎り',
      'mesh': '細挽き',
      'processing': '',
      'variety': 'ミレニオ',
      'extracting': 'ドリップ（V60）',
      'comment': 'メモ欄',
    });
  }
}
