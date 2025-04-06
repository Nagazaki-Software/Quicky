import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/your_message_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'message_model.dart';
export 'message_model.dart';

class MessageWidget extends StatefulWidget {
  const MessageWidget({
    super.key,
    required this.mensage,
    required this.outrousers,
  });

  final DocumentReference? mensage;
  final DocumentReference? outrousers;

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  late MessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.queryChat = await queryChatRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChatHistoryRecord>>(
      stream: queryChatHistoryRecord(
        parent: _model.queryChat?.reference,
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitFadingCube(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }
        List<ChatHistoryRecord> columnChatHistoryRecordList = snapshot.data!;
        final columnChatHistoryRecord = columnChatHistoryRecordList.isNotEmpty
            ? columnChatHistoryRecordList.first
            : null;

        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (columnChatHistoryRecord!.documentUser!.id ==
                currentUserReference!.id)
              wrapWithModel(
                model: _model.yourMessageModel,
                updateCallback: () => safeSetState(() {}),
                child: YourMessageWidget(
                  message: widget!.mensage!,
                  chat: columnChatHistoryRecord!.parentReference,
                ),
              ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (columnChatHistoryRecord!.documentUser!.id ==
                    widget!.outrousers!.id)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      child: Container(
                        width: 280.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        child: Builder(
                          builder: (context) {
                            if (columnChatHistoryRecord!.documentUser!.id ==
                                widget!.outrousers!.id) {
                              return Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    columnChatHistoryRecord?.msg,
                                    'ero',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Error',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
