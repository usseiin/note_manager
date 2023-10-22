// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotesTypeStruct extends FFFirebaseStruct {
  NotesTypeStruct({
    String? notesType,
    String? shareUserEmail,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _notesType = notesType,
        _shareUserEmail = shareUserEmail,
        super(firestoreUtilData);

  // "notesType" field.
  String? _notesType;
  String get notesType => _notesType ?? '';
  set notesType(String? val) => _notesType = val;
  bool hasNotesType() => _notesType != null;

  // "shareUserEmail" field.
  String? _shareUserEmail;
  String get shareUserEmail => _shareUserEmail ?? '';
  set shareUserEmail(String? val) => _shareUserEmail = val;
  bool hasShareUserEmail() => _shareUserEmail != null;

  static NotesTypeStruct fromMap(Map<String, dynamic> data) => NotesTypeStruct(
        notesType: data['notesType'] as String?,
        shareUserEmail: data['shareUserEmail'] as String?,
      );

  static NotesTypeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? NotesTypeStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'notesType': _notesType,
        'shareUserEmail': _shareUserEmail,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'notesType': serializeParam(
          _notesType,
          ParamType.String,
        ),
        'shareUserEmail': serializeParam(
          _shareUserEmail,
          ParamType.String,
        ),
      }.withoutNulls;

  static NotesTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      NotesTypeStruct(
        notesType: deserializeParam(
          data['notesType'],
          ParamType.String,
          false,
        ),
        shareUserEmail: deserializeParam(
          data['shareUserEmail'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NotesTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotesTypeStruct &&
        notesType == other.notesType &&
        shareUserEmail == other.shareUserEmail;
  }

  @override
  int get hashCode => const ListEquality().hash([notesType, shareUserEmail]);
}

NotesTypeStruct createNotesTypeStruct({
  String? notesType,
  String? shareUserEmail,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotesTypeStruct(
      notesType: notesType,
      shareUserEmail: shareUserEmail,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotesTypeStruct? updateNotesTypeStruct(
  NotesTypeStruct? notesTypeStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notesTypeStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotesTypeStructData(
  Map<String, dynamic> firestoreData,
  NotesTypeStruct? notesTypeStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notesTypeStruct == null) {
    return;
  }
  if (notesTypeStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && notesTypeStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notesTypeStructData =
      getNotesTypeFirestoreData(notesTypeStruct, forFieldValue);
  final nestedData =
      notesTypeStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = notesTypeStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotesTypeFirestoreData(
  NotesTypeStruct? notesTypeStruct, [
  bool forFieldValue = false,
]) {
  if (notesTypeStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notesTypeStruct.toMap());

  // Add any Firestore field values
  notesTypeStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotesTypeListFirestoreData(
  List<NotesTypeStruct>? notesTypeStructs,
) =>
    notesTypeStructs?.map((e) => getNotesTypeFirestoreData(e, true)).toList() ??
    [];
