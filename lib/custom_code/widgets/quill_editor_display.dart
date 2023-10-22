// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:quill_html_editor/quill_html_editor.dart';
import '/custom_code/actions/declare_global_keys.dart';

class QuillEditorDisplay extends StatefulWidget {
  factory QuillEditorDisplay({
    double? width,
    double? height,
    required String textFromDatabase,
    required String editorKeyValue,
  }) {
    return QuillEditorDisplay._internal(
        key: editorKeys[editorKeyValue],
        width: width,
        height: height,
        editorKeyValue: editorKeyValue,
        textFromDatabase: textFromDatabase);
  }

  QuillEditorDisplay._internal({
    Key? key,
    this.width,
    this.height,
    required this.editorKeyValue,
    required this.textFromDatabase,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String editorKeyValue;
  final String textFromDatabase;

  @override
  QuillEditorDisplayState createState() => QuillEditorDisplayState();
}

class QuillEditorDisplayState extends State<QuillEditorDisplay> {
  QuillEditorController? controller;
  bool _hasFocus = false;

  @override
  void initState() {
    controller = QuillEditorController();
    controller?.onTextChanged((text) {
      debugPrint('listening to $text');
    });
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose(); // Release any resources
    super.dispose();
  }

  final _backgroundColor = Colors.white70;
  final _editorTextStyle = const TextStyle(
      color: Colors.black, fontWeight: FontWeight.normal, fontFamily: 'Roboto');
  final _hintTextStyle = const TextStyle(
      fontSize: 18, color: Colors.black12, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Expanded(
              child: QuillHtmlEditor(
                text: "<h1>Hello</h1>Quill html editor example for FF  😊",
                hintText: 'Hint text goes here',
                controller: controller!,
                isEnabled: false,
                minHeight: widget.height ?? 100,
                textStyle: _editorTextStyle,
                hintTextStyle: _hintTextStyle,
                hintTextAlign: TextAlign.start,
                padding: const EdgeInsets.only(left: 10, top: 10),
                hintTextPadding: const EdgeInsets.only(left: 20),
                backgroundColor: _backgroundColor,
                onFocusChanged: (focus) {
                  debugPrint('has focus $focus');
                  setState(() {
                    _hasFocus = focus;
                  });
                },
                onTextChanged: (text) {},
                onEditorCreated: () {
                  debugPrint('Editor has been loaded');
                  // controller?.setText('Testing text on load');
                  controller?.setText(widget.textFromDatabase);
                },
                onEditorResized: (height) =>
                    debugPrint('Editor resized $height'),
                onSelectionChanged: (sel) =>
                    debugPrint('index ${sel.index}, range ${sel.length}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
