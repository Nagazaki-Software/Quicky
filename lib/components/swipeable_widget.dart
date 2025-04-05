import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/count_payment_copy_widget.dart';
import '/components/image_inicio_page_view_widget.dart';
import '/components/naoexistetaskaqui_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'swipeable_model.dart';
export 'swipeable_model.dart';

class SwipeableWidget extends StatefulWidget {
  const SwipeableWidget({
    super.key,
    String? categoria,
  }) : this.categoria = categoria ?? 'Custom';

  final String categoria;

  @override
  State<SwipeableWidget> createState() => _SwipeableWidgetState();
}

class _SwipeableWidgetState extends State<SwipeableWidget>
    with TickerProviderStateMixin {
  late SwipeableModel _model;

  var hasContainerTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeableModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            color: FlutterFlowTheme.of(context).warning,
            begin: 1.0,
            end: 0.52,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.85,
        height: MediaQuery.sizeOf(context).height * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              child: Stack(
                alignment: AlignmentDirectional(0.0, 0.0),
                children: [
                  StreamBuilder<List<TasksRecord>>(
                    stream: queryTasksRecord(
                      queryBuilder: (tasksRecord) => tasksRecord.where(
                        'Categoria',
                        isEqualTo: FFAppState().filtercategory != ''
                            ? FFAppState().filtercategory
                            : '',
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
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<TasksRecord> containerTasksRecordList =
                          snapshot.data!;

                      return Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.sizeOf(context).height * 0.3,
                          maxHeight: MediaQuery.sizeOf(context).height * 0.56,
                        ),
                        decoration: BoxDecoration(),
                        child: AuthUserStreamWidget(
                          builder: (context) => Builder(
                            builder: (context) {
                              final containerVar = functions
                                  .buscarRegiao(
                                      containerTasksRecordList.toList(),
                                      currentUserDocument!.location!,
                                      50.0,
                                      FFAppState().priceFilter.toDouble())
                                  .toList();
                              if (containerVar.isEmpty) {
                                return Center(
                                  child: NaoexistetaskaquiWidget(),
                                );
                              }

                              return FlutterFlowSwipeableStack(
                                onSwipeFn: (index) {},
                                onLeftSwipe: (index) {},
                                onRightSwipe: (index) async {
                                  final containerVarItem = containerVar[index];

                                  var chatRecordReference =
                                      ChatRecord.collection.doc();
                                  await chatRecordReference
                                      .set(createChatRecordData(
                                    userDocument: currentUserReference,
                                    imgDoUser:
                                        containerVarItem.foto.firstOrNull,
                                    userName: currentUserDisplayName,
                                    nomeDoGrupo:
                                        'Task ${containerVarItem.titulo}',
                                    imgDaTask:
                                        containerVarItem.foto.firstOrNull,
                                    user2Document:
                                        containerVarItem.userReference,
                                    ultimaMsg: getCurrentTimestamp,
                                    ultMsg:
                                        '${currentUserDisplayName} accept this task.',
                                    referenceTask: containerVarItem.reference,
                                  ));
                                  _model.chatCreated =
                                      ChatRecord.getDocumentFromData(
                                          createChatRecordData(
                                            userDocument: currentUserReference,
                                            imgDoUser: containerVarItem
                                                .foto.firstOrNull,
                                            userName: currentUserDisplayName,
                                            nomeDoGrupo:
                                                'Task ${containerVarItem.titulo}',
                                            imgDaTask: containerVarItem
                                                .foto.firstOrNull,
                                            user2Document:
                                                containerVarItem.userReference,
                                            ultimaMsg: getCurrentTimestamp,
                                            ultMsg:
                                                '${currentUserDisplayName} accept this task.',
                                            referenceTask:
                                                containerVarItem.reference,
                                          ),
                                          chatRecordReference);

                                  await ChatHistoryRecord.createDoc(
                                          _model.chatCreated!.reference)
                                      .set(createChatHistoryRecordData(
                                    msgdosystema: true,
                                    msg:
                                        '${currentUserDisplayName} accept this task.',
                                    horario: getCurrentTimestamp,
                                    documentUser: currentUserReference,
                                  ));
                                  FFAppState().taskReference =
                                      containerVarItem.reference;
                                  FFAppState().update(() {});

                                  safeSetState(() {});
                                },
                                onUpSwipe: (index) async {
                                  final containerVarItem = containerVar[index];
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: CountPaymentCopyWidget(
                                          task: containerVarItem.reference,
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                onDownSwipe: (index) {},
                                itemBuilder: (context, containerVarIndex) {
                                  final containerVarItem =
                                      containerVar[containerVarIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: ImageInicioPageViewWidget(
                                          key: Key(
                                              'Key3qa_${containerVarIndex}_of_${containerVar.length}'),
                                          parameter3:
                                              containerVarItem.reference,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                itemCount: containerVar.length,
                                controller: _model.swipeableStackController,
                                loop: false,
                                cardDisplayCount: valueOrDefault<int>(
                                  containerTasksRecordList.length,
                                  100,
                                ),
                                scale: 1.0,
                                cardPadding: EdgeInsets.all(20.0),
                                backCardOffset: const Offset(0.0, 0.0),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.09,
                      decoration: BoxDecoration(),
                      child: Stack(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                      spreadRadius: 4.0,
                                    )
                                  ],
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).primary,
                                      Color(0xEE61390C),
                                      FlutterFlowTheme.of(context).primary
                                    ],
                                    stops: [0.0, 0.5, 1.0],
                                    begin: AlignmentDirectional(0.64, 1.0),
                                    end: AlignmentDirectional(-0.64, -1.0),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(24.0),
                                    bottomRight: Radius.circular(24.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.0, 0.0, 25.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.swipeableStackController
                                                .swipeLeft();
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 1.0,
                                            shape: const CircleBorder(),
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 5.0,
                                                    color: Color(0x70432913),
                                                    offset: Offset(
                                                      2.0,
                                                      2.0,
                                                    ),
                                                    spreadRadius: 1.0,
                                                  )
                                                ],
                                                gradient: LinearGradient(
                                                  colors: [
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                    Color(0xE761390C),
                                                    FlutterFlowTheme.of(context)
                                                        .primary
                                                  ],
                                                  stops: [0.0, 0.5, 1.0],
                                                  begin: AlignmentDirectional(
                                                      0.0, -1.0),
                                                  end: AlignmentDirectional(
                                                      0, 1.0),
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsets.all(14.0),
                                                  child: Container(
                                                    width: 200.0,
                                                    height: 200.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/icons8-excluir-96.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.swipeableStackController
                                                .swipeTop();
                                          },
                                          onLongPress: () async {
                                            _model.swipeableStackController
                                                .swipeTop();
                                          },
                                          child: Container(
                                            width: 70.0,
                                            height: 70.0,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x70432913),
                                                  offset: Offset(
                                                    2.0,
                                                    2.0,
                                                  ),
                                                  spreadRadius: 2.0,
                                                )
                                              ],
                                              gradient: LinearGradient(
                                                colors: [
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                  Color(0xEC61390C),
                                                  FlutterFlowTheme.of(context)
                                                      .primary
                                                ],
                                                stops: [0.0, 0.5, 1.0],
                                                begin: AlignmentDirectional(
                                                    0.0, -1.0),
                                                end: AlignmentDirectional(
                                                    0, 1.0),
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/icons8-banknotes-100.png',
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.swipeableStackController
                                                .swipeRight();
                                          },
                                          onLongPress: () async {
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation'] !=
                                                null) {
                                              safeSetState(() =>
                                                  hasContainerTriggered = true);
                                              SchedulerBinding.instance
                                                  .addPostFrameCallback((_) async =>
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation']!
                                                          .controller
                                                          .forward(from: 0.0));
                                            }
                                            _model.swipeableStackController
                                                .swipeRight();
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 5.0,
                                                  color: Color(0x70432913),
                                                  offset: Offset(
                                                    2.0,
                                                    2.0,
                                                  ),
                                                  spreadRadius: 1.0,
                                                )
                                              ],
                                              gradient: LinearGradient(
                                                colors: [
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                  Color(0xE861390C),
                                                  FlutterFlowTheme.of(context)
                                                      .primary
                                                ],
                                                stops: [0.0, 0.5, 1.0],
                                                begin: AlignmentDirectional(
                                                    0.0, -1.0),
                                                end: AlignmentDirectional(
                                                    0, 1.0),
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsets.all(14.0),
                                                child: Container(
                                                  width: 200.0,
                                                  height: 200.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/icons8-selecionado-96.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ).animateOnActionTrigger(
                                            animationsMap[
                                                'containerOnActionTriggerAnimation']!,
                                            hasBeenTriggered:
                                                hasContainerTriggered),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
