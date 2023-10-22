import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key? key,
    this.noteDoc,
    this.note,
    this.noteRef,
    this.createdUser,
  }) : super(key: key);

  final NotesRecord? noteDoc;
  final String? note;
  final DocumentReference? noteRef;
  final String? createdUser;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.noteReff = widget.noteRef;
        _model.note = widget.note;
        _model.createdUser = widget.createdUser;
      });
    });

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
              Icons.notes,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('myNote');
            },
          ),
          title: Text(
            'Quill Editor1',
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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (_model.noteReff != null) {
                          if (_model.createdUser != currentUserReference?.id) {
                            if (widget.noteDoc!.sharedUsers
                                    .where((e) =>
                                        e.userRef == currentUserReference)
                                    .toList()
                                    .length >=
                                1) {
                              if (widget.noteDoc?.sharedUsers
                                      ?.where((e) =>
                                          e.userRef == currentUserReference)
                                      .toList()
                                      ?.first
                                      ?.allowEdit ==
                                  true) {
                                _model.editorAText =
                                    await actions.getTextQuillEditor(
                                  'editorA',
                                );

                                await widget.noteRef!
                                    .update(createNotesRecordData(
                                  content: _model.editorAText,
                                ));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'You are not allow to edit, contact the note onwer',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }
                            } else {
                              await widget.noteDoc!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'sharedUsers': FieldValue.arrayUnion([
                                      getSharedUserFirestoreData(
                                        updateSharedUserStruct(
                                          SharedUserStruct(
                                            userRef: currentUserReference,
                                            allowEdit: false,
                                          ),
                                          clearUnsetFields: false,
                                        ),
                                        true,
                                      )
                                    ]),
                                  },
                                ),
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'note saved',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            }
                          } else {
                            _model.qwetext = await actions.getTextQuillEditor(
                              'editorA',
                            );

                            await widget.noteDoc!.reference
                                .update(createNotesRecordData(
                              content: _model.qwetext,
                            ));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'note update successfully',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          }
                        } else {
                          _model.qwetext1 = await actions.getTextQuillEditor(
                            'editorA',
                          );

                          var notesRecordReference =
                              NotesRecord.collection.doc();
                          await notesRecordReference.set(createNotesRecordData(
                            content: _model.qwetext1,
                            creationDate: getCurrentTimestamp,
                            createdUser: currentUserReference?.id,
                          ));
                          _model.fbNoteRef = NotesRecord.getDocumentFromData(
                              createNotesRecordData(
                                content: _model.qwetext1,
                                creationDate: getCurrentTimestamp,
                                createdUser: currentUserReference?.id,
                              ),
                              notesRecordReference);
                          setState(() {
                            _model.note = _model.fbNoteRef?.content;
                            _model.noteReff = _model.fbNoteRef?.reference;
                            _model.createdUser = widget.createdUser;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'note save successfully',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        }

                        setState(() {});
                      },
                      text: 'Save Text',
                      options: FFButtonOptions(
                        width: 100.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  if ((widget.noteDoc?.createdUser ==
                          currentUserReference?.id) ||
                      ((widget.noteDoc != null
                              ? widget.noteDoc!.hasSharedUsers()
                              : false)
                          ? (widget.noteDoc!.sharedUsers
                                      .where((e) =>
                                          e.userRef?.id ==
                                          currentUserReference?.id)
                                      .toList()
                                      .length >=
                                  1
                              ? widget.noteDoc!.sharedUsers
                                  .where((e) =>
                                      e.userRef?.id == currentUserReference?.id)
                                  .toList()
                                  .first
                                  .allowEdit
                              : false)
                          : false) ||
                      (widget.noteDoc == null))
                    FFButtonWidget(
                      onPressed: () async {
                        _model.qwetextCopyCopy =
                            await actions.getTextQuillEditor(
                          'editorA',
                        );
                        if (widget.noteRef != null) {
                          context.goNamed(
                            'HtmlEditor',
                            queryParameters: {
                              'noteRef': serializeParam(
                                widget.noteDoc?.reference,
                                ParamType.DocumentReference,
                              ),
                              'htmlText': serializeParam(
                                _model.qwetextCopyCopy,
                                ParamType.String,
                              ),
                              'noteDoc': serializeParam(
                                widget.noteDoc,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'noteDoc': widget.noteDoc,
                            },
                          );
                        } else {
                          var notesRecordReference =
                              NotesRecord.collection.doc();
                          await notesRecordReference.set(createNotesRecordData(
                            content: _model.qwetextCopyCopy,
                            creationDate: getCurrentTimestamp,
                            createdUser: currentUserReference?.id,
                          ));
                          _model.noteDocu = NotesRecord.getDocumentFromData(
                              createNotesRecordData(
                                content: _model.qwetextCopyCopy,
                                creationDate: getCurrentTimestamp,
                                createdUser: currentUserReference?.id,
                              ),
                              notesRecordReference);
                          setState(() {
                            _model.note = _model.noteDocu?.content;
                            _model.noteReff = _model.noteDocu?.reference;
                            _model.createdUser =
                                _model.noteDocu?.creationDate?.toString();
                          });

                          context.goNamed(
                            'HtmlEditor',
                            queryParameters: {
                              'noteRef': serializeParam(
                                _model.noteReff,
                                ParamType.DocumentReference,
                              ),
                              'htmlText': serializeParam(
                                _model.qwetextCopyCopy,
                                ParamType.String,
                              ),
                              'noteDoc': serializeParam(
                                widget.noteDoc,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'noteDoc': widget.noteDoc,
                            },
                          );
                        }

                        setState(() {});
                      },
                      text: 'HTML-EDT',
                      options: FFButtonOptions(
                        width: 100.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  if ((_model.createdUser == currentUserReference?.id) &&
                      (widget.noteDoc!.sharedUsers.length >= 1))
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'TeamPage',
                          queryParameters: {
                            'noteDoc': serializeParam(
                              widget.noteDoc,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'noteDoc': widget.noteDoc,
                          },
                        );
                      },
                      text: 'Team',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  if ((_model.createdUser == currentUserReference?.id) ||
                      (widget.noteDoc == null))
                    Builder(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.currentPageLink =
                              await generateCurrentPageLink(
                            context,
                            title: 'NoteManager',
                            imageUrl:
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/notes-keeper-unvf78/assets/u6aw4lx8j1do/appIcon.png',
                            description: 'check out my note',
                            isShortLink: false,
                          );

                          await Share.share(
                            _model.currentPageLink,
                            sharePositionOrigin: getWidgetBoundingBox(context),
                          );
                        },
                        child: FaIcon(
                          FontAwesomeIcons.shareAltSquare,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 30.0,
                        ),
                      ),
                    ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.00, -1.00),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.8,
                    child: custom_widgets.QuillEditor(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.8,
                      textFromDatabase: valueOrDefault<String>(
                        widget.noteDoc?.content,
                        'your note',
                      ),
                      editorKeyValue: 'editorA',
                      allowEdit: (currentUserReference?.id ==
                              widget.noteDoc?.createdUser) ||
                          !(widget.noteDoc != null) ||
                          (widget.noteDoc!.hasSharedUsers()
                              ? (widget.noteDoc!.sharedUsers
                                          .where((e) =>
                                              e.userRef == currentUserReference)
                                          .toList()
                                          .length >=
                                      1
                                  ? (widget.noteDoc?.sharedUsers
                                          ?.where((e) =>
                                              e.userRef == currentUserReference)
                                          .toList()
                                          ?.first
                                          ?.allowEdit ==
                                      true)
                                  : false)
                              : false),
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
