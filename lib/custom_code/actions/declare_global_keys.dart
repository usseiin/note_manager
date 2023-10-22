// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/quill_editor.dart';

// Declare GlobalKeys
final GlobalKey<QuillEditorState> editorKeyA = GlobalKey<QuillEditorState>();
final GlobalKey<QuillEditorState> editorKeyB = GlobalKey<QuillEditorState>();
final GlobalKey<QuillEditorState> editorKeyC = GlobalKey<QuillEditorState>();

// Create a Map to store these keys
final Map<String, GlobalKey<QuillEditorState>> editorKeys = {
  'editorA': editorKeyA,
  'editorB': editorKeyB,
  'editorC': editorKeyC,
};

Future declareGlobalKeys() async {
  // Add your function code here!
}
