import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'html_editor_model.dart';
export 'html_editor_model.dart';

class HtmlEditorWidget extends StatefulWidget {
  const HtmlEditorWidget({
    Key? key,
    required this.noteRef,
    required this.htmlText,
    required this.noteDoc,
  }) : super(key: key);

  final DocumentReference? noteRef;
  final String? htmlText;
  final NotesRecord? noteDoc;

  @override
  _HtmlEditorWidgetState createState() => _HtmlEditorWidgetState();
}

class _HtmlEditorWidgetState extends State<HtmlEditorWidget> {
  late HtmlEditorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HtmlEditorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              _model.editorBText = await actions.getTextHtmlEditorEnhanced(
                'editorB',
              );

              await widget.noteRef!.update(createNotesRecordData(
                content: _model.editorBText,
              ));

              context.goNamed(
                'HomePage',
                queryParameters: {
                  'noteDoc': serializeParam(
                    widget.noteDoc,
                    ParamType.Document,
                  ),
                  'noteRef': serializeParam(
                    widget.noteRef,
                    ParamType.DocumentReference,
                  ),
                  'createdUser': serializeParam(
                    widget.noteDoc?.createdUser,
                    ParamType.String,
                  ),
                  'note': serializeParam(
                    _model.editorBText,
                    ParamType.String,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'noteDoc': widget.noteDoc,
                },
              );

              setState(() {});
            },
          ),
          title: Text(
            'HTML Editor',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Urbanist',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.85,
                  child: custom_widgets.HtmlEditorEnhanced(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.85,
                    editorKeyValue: 'editorB',
                    defaultText: valueOrDefault<String>(
                      widget.htmlText,
                      'your text',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
