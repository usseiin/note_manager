import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'share_for_web_model.dart';
export 'share_for_web_model.dart';

class ShareForWebWidget extends StatefulWidget {
  const ShareForWebWidget({
    Key? key,
    String? parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
  })  : this.parameter1 = parameter1 ?? '',
        super(key: key);

  final String parameter1;
  final NotesRecord? parameter2;
  final String? parameter3;
  final String? parameter4;
  final String? parameter5;

  @override
  _ShareForWebWidgetState createState() => _ShareForWebWidgetState();
}

class _ShareForWebWidgetState extends State<ShareForWebWidget> {
  late ShareForWebModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShareForWebModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: (widget.parameter1 == currentUserReference?.id) ||
          (widget.parameter2 == null),
      child: Builder(
        builder: (context) => Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              _model.noteShare = await actions.getTextQuillEditor(
                'editorA',
              );
              await Share.share(
                'https://noteskeeper.page.link?link=https://notes-keeper-unvf78.flutterflow.app/homePage?noteDoc=${widget.parameter3}&note=${functions.percentEncode(_model.noteShare!)}&noteRef=${widget.parameter5}&createdUser=${widget.parameter1}&apn=com.gelbard.noteskeeper&ibi=com.gelbard.noteskeeper&st=https://notes-keeper-unvf78.flutterflow.app&sd=${functions.percentEncode('check out my note')}&si=https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/notes-keeper-unvf78/assets/u6aw4lx8j1do/appIcon.png',
                sharePositionOrigin: getWidgetBoundingBox(context),
              );

              setState(() {});
            },
            child: Icon(
              Icons.ios_share_outlined,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
