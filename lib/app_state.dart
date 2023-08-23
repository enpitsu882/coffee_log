import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'entry.dart';

class AppState {
  late final StreamController<List<Entry>> _entriesStreamController;

  AppState() {
    _entriesStreamController = StreamController.broadcast(
      onListen: () {
        _entriesStreamController.add([
          Entry(
            date: DateTime.now(),
            country: 'country',
            producer: 'producer',
            roastLevel: 'roastLevel',
            mesh: 'mesh',
            processing: 'processing',
            variety: 'variety',
            extracting: 'extracting',
            comment: 'comment',
          ),
        ]);
      },
    );
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

      _entriesStreamController.add(entries);
    });
  }
}
