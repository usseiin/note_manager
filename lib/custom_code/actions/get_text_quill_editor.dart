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

import 'package:quill_html_editor/quill_html_editor.dart';
import '/custom_code/actions/declare_global_keys.dart';
import '/custom_code/widgets/quill_editor.dart';

Future<String?> getTextQuillEditor(String editorKeyValue) async {
  GlobalKey<QuillEditorState>? thisWidgetKey = editorKeys[editorKeyValue];

  if (thisWidgetKey?.currentState != null) {
    final String? htmlText =
        await thisWidgetKey!.currentState!.controller!.getText();
    return htmlText;
  } else {
    // FF community please handle the error how you see fit; this is just an example
    throw Exception(
        "The GlobalKey for editorKeyValue: $editorKeyValue is not available");
  }
}
