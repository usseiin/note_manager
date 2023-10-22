import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shared_user_data_model.dart';
export 'shared_user_data_model.dart';

class SharedUserDataWidget extends StatefulWidget {
  const SharedUserDataWidget({
    Key? key,
    required this.username,
    required this.allowEdit,
    required this.userData,
    required this.noteDoc,
    required this.userRef,
  }) : super(key: key);

  final String? username;
  final bool? allowEdit;
  final SharedUserStruct? userData;
  final NotesRecord? noteDoc;
  final DocumentReference? userRef;

  @override
  _SharedUserDataWidgetState createState() => _SharedUserDataWidgetState();
}

class _SharedUserDataWidgetState extends State<SharedUserDataWidget> {
  late SharedUserDataModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SharedUserDataModel());

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

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(-1.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 6.0, 6.0, 6.0),
                child: Text(
                  widget.username!,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Grant access',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  child: Switch.adaptive(
                    value: _model.switchValue ??= widget.allowEdit!,
                    onChanged: (newValue) async {
                      setState(() => _model.switchValue = newValue!);
                      if (newValue!) {
                        await widget.noteDoc!.reference.update({
                          ...mapToFirestore(
                            {
                              'sharedUsers': FieldValue.arrayRemove([
                                getSharedUserFirestoreData(
                                  updateSharedUserStruct(
                                    widget.noteDoc?.sharedUsers
                                        ?.where(
                                            (e) => e.userRef == widget.userRef)
                                        .toList()
                                        ?.first,
                                    clearUnsetFields: false,
                                  ),
                                  true,
                                )
                              ]),
                            },
                          ),
                        });

                        await widget.noteDoc!.reference.update({
                          ...mapToFirestore(
                            {
                              'sharedUsers': FieldValue.arrayUnion([
                                getSharedUserFirestoreData(
                                  createSharedUserStruct(
                                    userRef: widget.userRef,
                                    allowEdit: _model.switchValue,
                                    clearUnsetFields: false,
                                  ),
                                  true,
                                )
                              ]),
                            },
                          ),
                        });
                      }
                    },
                    activeColor: FlutterFlowTheme.of(context).primary,
                    activeTrackColor: FlutterFlowTheme.of(context).accent1,
                    inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                    inactiveThumbColor:
                        FlutterFlowTheme.of(context).secondaryText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
