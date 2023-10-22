import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  DocumentReference? noteReff;

  String? note;

  String? createdUser = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getTextQuillEditor] action in Button widget.
  String? editorAText;
  // Stores action output result for [Custom Action - getTextQuillEditor] action in Button widget.
  String? qwetext;
  // Stores action output result for [Custom Action - getTextQuillEditor] action in Button widget.
  String? qwetext1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotesRecord? fbNoteRef;
  // Stores action output result for [Custom Action - getTextQuillEditor] action in Button widget.
  String? qwetextCopyCopy;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotesRecord? noteDocu;
  String currentPageLink = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
