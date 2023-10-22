import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotesRecord extends FirestoreRecord {
  NotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "creation_date" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  bool hasCreationDate() => _creationDate != null;

  // "createdUser" field.
  String? _createdUser;
  String get createdUser => _createdUser ?? '';
  bool hasCreatedUser() => _createdUser != null;

  // "sharedUsers" field.
  List<SharedUserStruct>? _sharedUsers;
  List<SharedUserStruct> get sharedUsers => _sharedUsers ?? const [];
  bool hasSharedUsers() => _sharedUsers != null;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _creationDate = snapshotData['creation_date'] as DateTime?;
    _createdUser = snapshotData['createdUser'] as String?;
    _sharedUsers = getStructList(
      snapshotData['sharedUsers'],
      SharedUserStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notes');

  static Stream<NotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotesRecord.fromSnapshot(s));

  static Future<NotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotesRecord.fromSnapshot(s));

  static NotesRecord fromSnapshot(DocumentSnapshot snapshot) => NotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotesRecordData({
  String? content,
  DateTime? creationDate,
  String? createdUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'creation_date': creationDate,
      'createdUser': createdUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotesRecordDocumentEquality implements Equality<NotesRecord> {
  const NotesRecordDocumentEquality();

  @override
  bool equals(NotesRecord? e1, NotesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.content == e2?.content &&
        e1?.creationDate == e2?.creationDate &&
        e1?.createdUser == e2?.createdUser &&
        listEquality.equals(e1?.sharedUsers, e2?.sharedUsers);
  }

  @override
  int hash(NotesRecord? e) => const ListEquality()
      .hash([e?.content, e?.creationDate, e?.createdUser, e?.sharedUsers]);

  @override
  bool isValidKey(Object? o) => o is NotesRecord;
}
