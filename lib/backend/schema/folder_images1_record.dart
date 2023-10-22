import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FolderImages1Record extends FirestoreRecord {
  FolderImages1Record._(
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
      FirebaseFirestore.instance.collection('FolderImages1');

  static Stream<FolderImages1Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FolderImages1Record.fromSnapshot(s));

  static Future<FolderImages1Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FolderImages1Record.fromSnapshot(s));

  static FolderImages1Record fromSnapshot(DocumentSnapshot snapshot) =>
      FolderImages1Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FolderImages1Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FolderImages1Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FolderImages1Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FolderImages1Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFolderImages1RecordData({
  String? imagePath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image_path': imagePath,
    }.withoutNulls,
  );

  return firestoreData;
}

class FolderImages1RecordDocumentEquality
    implements Equality<FolderImages1Record> {
  const FolderImages1RecordDocumentEquality();

  @override
  bool equals(FolderImages1Record? e1, FolderImages1Record? e2) {
    return e1?.imagePath == e2?.imagePath;
  }

  @override
  int hash(FolderImages1Record? e) => const ListEquality().hash([e?.imagePath]);

  @override
  bool isValidKey(Object? o) => o is FolderImages1Record;
}
