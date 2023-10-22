import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotesImages1Record extends FirestoreRecord {
  NotesImages1Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image_path" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  void _initializeFields() {
    _imagePath = snapshotData['image_path'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('NotesImages1');

  static Stream<NotesImages1Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotesImages1Record.fromSnapshot(s));

  static Future<NotesImages1Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotesImages1Record.fromSnapshot(s));

  static NotesImages1Record fromSnapshot(DocumentSnapshot snapshot) =>
      NotesImages1Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotesImages1Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotesImages1Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotesImages1Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotesImages1Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotesImages1RecordData({
  String? imagePath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image_path': imagePath,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotesImages1RecordDocumentEquality
    implements Equality<NotesImages1Record> {
  const NotesImages1RecordDocumentEquality();

  @override
  bool equals(NotesImages1Record? e1, NotesImages1Record? e2) {
    return e1?.imagePath == e2?.imagePath;
  }

  @override
  int hash(NotesImages1Record? e) => const ListEquality().hash([e?.imagePath]);

  @override
  bool isValidKey(Object? o) => o is NotesImages1Record;
}
