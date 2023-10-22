// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SharedUserStruct extends FFFirebaseStruct {
  SharedUserStruct({
    DocumentReference? userRef,
    bool? allowEdit,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userRef = userRef,
        _allowEdit = allowEdit,
        super(firestoreUtilData);

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? val) => _userRef = val;
  bool hasUserRef() => _userRef != null;

  // "allowEdit" field.
  bool? _allowEdit;
  bool get allowEdit => _allowEdit ?? false;
  set allowEdit(bool? val) => _allowEdit = val;
  bool hasAllowEdit() => _allowEdit != null;

  static SharedUserStruct fromMap(Map<String, dynamic> data) =>
      SharedUserStruct(
        userRef: data['user_ref'] as DocumentReference?,
        allowEdit: data['allowEdit'] as bool?,
      );

  static SharedUserStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SharedUserStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'user_ref': _userRef,
        'allowEdit': _allowEdit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_ref': serializeParam(
          _userRef,
          ParamType.DocumentReference,
        ),
        'allowEdit': serializeParam(
          _allowEdit,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SharedUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      SharedUserStruct(
        userRef: deserializeParam(
          data['user_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        allowEdit: deserializeParam(
          data['allowEdit'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'SharedUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SharedUserStruct &&
        userRef == other.userRef &&
        allowEdit == other.allowEdit;
  }

  @override
  int get hashCode => const ListEquality().hash([userRef, allowEdit]);
}

SharedUserStruct createSharedUserStruct({
  DocumentReference? userRef,
  bool? allowEdit,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SharedUserStruct(
      userRef: userRef,
      allowEdit: allowEdit,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SharedUserStruct? updateSharedUserStruct(
  SharedUserStruct? sharedUser, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sharedUser
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSharedUserStructData(
  Map<String, dynamic> firestoreData,
  SharedUserStruct? sharedUser,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sharedUser == null) {
    return;
  }
  if (sharedUser.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && sharedUser.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sharedUserData = getSharedUserFirestoreData(sharedUser, forFieldValue);
  final nestedData = sharedUserData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = sharedUser.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSharedUserFirestoreData(
  SharedUserStruct? sharedUser, [
  bool forFieldValue = false,
]) {
  if (sharedUser == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sharedUser.toMap());

  // Add any Firestore field values
  sharedUser.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSharedUserListFirestoreData(
  List<SharedUserStruct>? sharedUsers,
) =>
    sharedUsers?.map((e) => getSharedUserFirestoreData(e, true)).toList() ?? [];
