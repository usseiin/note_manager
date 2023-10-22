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

class QuillEditor extends StatefulWidget {
  factory QuillEditor({
    double? width,
    double? height,
    required String textFromDatabase,
    required String editorKeyValue,
    required bool allowEdit,
  }) {
    return QuillEditor._internal(
      key: editorKeys[editorKeyValue],
      width: width,
      height: height,
      editorKeyValue: editorKeyValue,
      textFromDatabase: textFromDatabase,
      allowEdit: allowEdit,
    );
  }

  QuillEditor._internal({
    Key? key,
    this.width,
    this.height,
    required this.editorKeyValue,
    required this.textFromDatabase,
    required this.allowEdit,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String editorKeyValue;
  final String textFromDatabase;
  final bool allowEdit;

  @override
  QuillEditorState createState() => QuillEditorState();
}

class QuillEditorState extends State<QuillEditor> {
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

  // final customToolBarList = [
  //   ToolBarStyle.bold,
  //   ToolBarStyle.italic,
  //   ToolBarStyle.align,
  //   ToolBarStyle.color,
  //   ToolBarStyle.background,
  //   ToolBarStyle.listBullet,
  //   ToolBarStyle.listOrdered,
  //   ToolBarStyle.clean,
  //   ToolBarStyle.image,
  //   ToolBarStyle.size,
  //   ToolBarStyle.clearHistory,
  //   ToolBarStyle.blockQuote,

  //   //ToolBarStyle.addTable,
  //   //ToolBarStyle.editTable,
  //   //ToolBarStyle.video,
  //   //ToolBarStyle.headerOne,
  //   //ToolBarStyle.headerTwo,
  //   //ToolBarStyle.directionLtr,
  //   //ToolBarStyle.directionRtl,
  // ];

  final _toolbarColor = Colors.grey.shade200;
  final _backgroundColor = Colors.white70;
  final _toolbarIconColor = Colors.black87;
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
            if (widget.allowEdit)
              ToolBar.scroll(
                toolBarConfig: [
                  ToolBarStyle.bold,
                  ToolBarStyle.italic,
                  ToolBarStyle.align,
                  ToolBarStyle.color,
                  ToolBarStyle.background,
                  ToolBarStyle.listBullet,
                  ToolBarStyle.listOrdered,
                  ToolBarStyle.clean,
                  ToolBarStyle.image,
                  ToolBarStyle.size,
                  ToolBarStyle.clearHistory,
                  ToolBarStyle.blockQuote,
                  ToolBarStyle.redo,
                ],
                toolBarColor: _toolbarColor,
                padding: const EdgeInsets.all(8),
                iconSize: 25,
                iconColor: _toolbarIconColor,
                activeIconColor: Colors.greenAccent.shade400,
                controller: controller!,
                // ncrossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
              ),
            Expanded(
              child: QuillHtmlEditor(
                text: "<h1>Hello</h1>Quill html editor example for FF  😊",
                hintText: 'Hint text goes here',
                controller: controller!,
                isEnabled: widget.allowEdit,
                minHeight: widget.height ?? 200.0,
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
                onTextChanged: (text) => debugPrint('widget text change $text'),
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
