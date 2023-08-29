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

  StreamSubscription<QuerySnapshot>? _entrySubscription;
  List<Entry> _entries = [];
  List<Entry> get entries => _entries;

  AppState();

  init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);

    if (kDebugMode) {
      try {
        FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8000);
        await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
      } catch (e) {
        print(e);
      }
    }

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loggedIn = true;
        _entrySubscription = FirebaseFirestore.instance
            .collection('entry')
            .orderBy('timestamp', descending: true)
            .snapshots()
            .listen((snapshot) {
          _entries = [];
          for (final document in snapshot.docs) {
            _entries.add(
              Entry(
                date: document.data()['date'] as DateTime,
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

  void writeEntryToFirebase(Entry entry) {
    FirebaseFirestore.instance.collection('Entries').add({
      'date': entry.date,
      'country': entry.country,
      'producer': entry.producer,
      'roastLevel': entry.roastLevel,
      'mesh': entry.mesh,
      'processing': entry.processing,
      'variety': entry.variety,
      'extracting': entry.extracting,
      'comment': entry.comment,
    });
  }

  Future<void> _listenForEntries() async {
    FirebaseFirestore.instance
        .collection('Entries')
        .snapshots()
        .listen((event) {
      final entries = event.docs.map((doc) {
        final data = doc.data();
        return Entry(
          date: data['date'] as DateTime,
          country: data['country'] as String,
          producer: data['producer'] as String,
          roastLevel: data['roastLevel'] as String,
          mesh: data['mesh'] as String,
          processing: data['processing'] as String,
          variety: data['variety'] as String,
          extracting: data['extracting'] as String,
          comment: data['comment'] as String,
        );
      }).toList();

      // _entriesStreamController.add(entries);
    });
  }
}
