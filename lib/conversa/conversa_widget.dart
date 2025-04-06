import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/chat_componente_widget.dart';
import '/components/renegociar_proposta_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'conversa_model.dart';
export 'conversa_model.dart';

/// aba de conversa do chat igual do tinder
class ConversaWidget extends StatefulWidget {
  const ConversaWidget({
    super.key,
    required this.chatReference,
  });

  final DocumentReference? chatReference;

  static String routeName = 'conversa';
  static String routePath = '/conversa';

  @override
  State<ConversaWidget> createState() => _ConversaWidgetState();
}

class _ConversaWidgetState extends State<ConversaWidget> {
  late ConversaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConversaModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ChatRecord>(
      stream: ChatRecord.getDocument(widget!.chatReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFadingCube(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }

        final conversaChatRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).info,
                automaticallyImplyLeading: false,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                InformacoesDaConversaWidget.routeName,
                                queryParameters: {
                                  'chatReference': serializeParam(
                                    conversaChatRecord.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 260),
                                  ),
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowIconButton(
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.arrow_back,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          context.safePop();
                                        },
                                      ),
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          shape: BoxShape.circle,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          child: Image.network(
                                            conversaChatRecord.imgDoUser,
                                            width: 50.0,
                                            height: 50.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                conversaChatRecord.nomeDoGrupo,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: FutureBuilder<TasksRecord>(
                                                future:
                                                    TasksRecord.getDocumentOnce(
                                                        conversaChatRecord
                                                            .referenceTask!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            SpinKitFadingCube(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }

                                                  final textTasksRecord =
                                                      snapshot.data!;

                                                  return Text(
                                                    '\$${textTasksRecord.valor} - ${textTasksRecord.categoria}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.more_vert,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                elevation: 2.0,
              ),
            ),
            body: StreamBuilder<TasksRecord>(
              stream:
                  TasksRecord.getDocument(conversaChatRecord.referenceTask!),
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

                final columnTasksRecord = snapshot.data!;

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: StreamBuilder<List<ChatHistoryRecord>>(
                            stream: _model.queryConversa(
                              uniqueQueryKey: conversaChatRecord.reference.id,
                              requestFn: () => queryChatHistoryRecord(
                                parent: widget!.chatReference,
                                queryBuilder: (chatHistoryRecord) =>
                                    chatHistoryRecord.orderBy('horario'),
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitFadingCube(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<ChatHistoryRecord>
                                  columnChatHistoryRecordList = snapshot.data!;

                              return SingleChildScrollView(
                                controller: _model.columnController,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(
                                      columnChatHistoryRecordList.length,
                                      (columnIndex) {
                                    final columnChatHistoryRecord =
                                        columnChatHistoryRecordList[
                                            columnIndex];
                                    return Container(
                                      width: double.infinity,
                                      child: Stack(
                                        children: [
                                          Container(
                                            child: ChatComponenteWidget(
                                              key: Key(
                                                  'Keysy4_${columnIndex}_of_${columnChatHistoryRecordList.length}'),
                                              chatHistory:
                                                  columnChatHistoryRecord
                                                      .reference,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).divide(SizedBox(height: 16.0)),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 16.0, 8.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      onFieldSubmitted: (_) async {
                                        await ChatHistoryRecord.createDoc(
                                                widget!.chatReference!)
                                            .set(createChatHistoryRecordData(
                                          documentUser: currentUserReference,
                                          msg: _model.textController.text,
                                          horario: getCurrentTimestamp,
                                          msgdosystema: false,
                                        ));

                                        await widget!.chatReference!
                                            .update(createChatRecordData(
                                          ultimaMsg: getCurrentTimestamp,
                                          ultMsg: _model.textController.text,
                                        ));
                                        safeSetState(() {
                                          _model.textController?.clear();
                                        });
                                        await Future.delayed(
                                            const Duration(milliseconds: 600));
                                        await _model.columnController
                                            ?.animateTo(
                                          _model.columnController!.position
                                              .maxScrollExtent,
                                          duration: Duration(milliseconds: 100),
                                          curve: Curves.ease,
                                        );
                                      },
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        hintText: 'Digite uma mensagem...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.all(12.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      minLines: 1,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 45.0,
                                height: 45.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: RenegociarPropostaWidget(
                                              task: columnTasksRecord.reference,
                                              chatReference:
                                                  widget!.chatReference!,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Icon(
                                    Icons.attach_money_rounded,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
