import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShareNotesRecord extends FirestoreRecord {
  ShareNotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notesId" field.
  String? _notesId;
  String get notesId => _notesId ?? '';
  bool hasNotesId() => _notesId != null;

  // "userEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "notesType" field.
  String? _notesType;
  String get notesType => _notesType ?? '';
  bool hasNotesType() => _notesType != null;

  void _initializeFields() {
    _notesId = snapshotData['notesId'] as String?;
    _userEmail = snapshotData['userEmail'] as String?;
    _notesType = snapshotData['notesType'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shareNotes');

  static Stream<ShareNotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShareNotesRecord.fromSnapshot(s));

  static Future<ShareNotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShareNotesRecord.fromSnapshot(s));

  static ShareNotesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ShareNotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShareNotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShareNotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShareNotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShareNotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShareNotesRecordData({
  String? notesId,
  String? userEmail,
  String? notesType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notesId': notesId,
      'userEmail': userEmail,
      'notesType': notesType,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShareNotesRecordDocumentEquality implements Equality<ShareNotesRecord> {
  const ShareNotesRecordDocumentEquality();

  @override
  bool equals(ShareNotesRecord? e1, ShareNotesRecord? e2) {
    return e1?.notesId == e2?.notesId &&
        e1?.userEmail == e2?.userEmail &&
        e1?.notesType == e2?.notesType;
  }

  @override
  int hash(ShareNotesRecord? e) =>
      const ListEquality().hash([e?.notesId, e?.userEmail, e?.notesType]);

  @override
  bool isValidKey(Object? o) => o is ShareNotesRecord;
}
