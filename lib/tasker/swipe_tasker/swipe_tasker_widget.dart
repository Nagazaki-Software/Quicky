import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/card_swipead_widget.dart';
import '/components/endereco_widget.dart';
import '/components/filterdistancetask_widget.dart';
import '/components/filterpricetask_widget.dart';
import '/components/nav_bar_copy_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/notasksavaliate_widget.dart';
import '/components/verifiyaccounturgent_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'swipe_tasker_model.dart';
export 'swipe_tasker_model.dart';

class SwipeTaskerWidget extends StatefulWidget {
  const SwipeTaskerWidget({super.key});

  static String routeName = 'swipeTasker';
  static String routePath = '/FinalRequestTaskCopy';

  @override
  State<SwipeTaskerWidget> createState() => _SwipeTaskerWidgetState();
}

class _SwipeTaskerWidgetState extends State<SwipeTaskerWidget>
    with TickerProviderStateMixin {
  late SwipeTaskerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeTaskerModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'swipeTasker'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SWIPE_TASKER_swipeTasker_ON_INIT_STATE');
      if (currentUserDocument?.location == null) {
        logFirebaseEvent('swipeTasker_request_permissions');
        await requestPermission(locationPermission);
        logFirebaseEvent('swipeTasker_request_permissions');
        await requestPermission(notificationsPermission);
        logFirebaseEvent('swipeTasker_bottom_sheet');
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: EnderecoWidget(),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor:
              valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee'
                  ? FlutterFlowTheme.of(context).primaryBackground
                  : FlutterFlowTheme.of(context).secondaryBackground,
          body: Stack(
            children: [
              if (valueOrDefault(currentUserDocument?.taskOrTaskee, '') ==
                  'Tasker')
                Stack(
                  children: [
                    if (valueOrDefault<bool>(
                        currentUserDocument?.verifyaccount, false))
                      StreamBuilder<List<ComunitysRecord>>(
                        stream: queryComunitysRecord(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitPulse(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<ComunitysRecord> containerComunitysRecordList =
                              snapshot.data!;

                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 110.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  StreamBuilder<List<TasksRecord>>(
                                    stream: queryTasksRecord(
                                      queryBuilder: (tasksRecord) => tasksRecord
                                          .where(
                                            'status',
                                            isEqualTo: 'approved',
                                          )
                                          .where(
                                            'aceito',
                                            isEqualTo: false,
                                          )
                                          .orderBy('Data'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: SpinKitPulse(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<TasksRecord>
                                          containerTasksRecordList =
                                          snapshot.data!;

                                      return Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.8,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.75,
                                              child: custom_widgets
                                                  .FlutterTaskSwiper(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.75,
                                                tasks: functions.buscarRegiao(
                                                    containerTasksRecordList
                                                        .toList(),
                                                    currentUserDocument!
                                                        .location!,
                                                    30.0,
                                                    containerComunitysRecordList
                                                        .map((e) =>
                                                            e.locationComunity)
                                                        .withoutNulls
                                                        .toList()),
                                                onSelectableButton:
                                                    (buttonPressioned,
                                                        taskRef) async {
                                                  logFirebaseEvent(
                                                      'SWIPE_TASKER_Container_s4rrq7i4_CALLBACK');
                                                  if (buttonPressioned ==
                                                      'confirm') {
                                                    logFirebaseEvent(
                                                        'FlutterTaskSwiper_backend_call');

                                                    var chatRecordReference =
                                                        ChatRecord.collection
                                                            .doc();
                                                    await chatRecordReference
                                                        .set(
                                                            createChatRecordData(
                                                      user2Document:
                                                          currentUserReference,
                                                      referenceTask: taskRef,
                                                      ultimaMsg:
                                                          getCurrentTimestamp,
                                                    ));
                                                    _model.chat = ChatRecord
                                                        .getDocumentFromData(
                                                            createChatRecordData(
                                                              user2Document:
                                                                  currentUserReference,
                                                              referenceTask:
                                                                  taskRef,
                                                              ultimaMsg:
                                                                  getCurrentTimestamp,
                                                            ),
                                                            chatRecordReference);
                                                    logFirebaseEvent(
                                                        'FlutterTaskSwiper_backend_call');

                                                    await ChatHistoryRecord
                                                            .createDoc(_model
                                                                .chat!
                                                                .reference)
                                                        .set(
                                                            createChatHistoryRecordData(
                                                      msg:
                                                          '${currentUserDisplayName} accept task.',
                                                      horario:
                                                          getCurrentTimestamp,
                                                      msgdosystema: true,
                                                    ));
                                                  } else if (buttonPressioned ==
                                                      'reject') {
                                                    logFirebaseEvent(
                                                        'FlutterTaskSwiper_backend_call');

                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'tasksemtempodeespera':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            getTempodeesperatasksFirestoreData(
                                                              updateTempodeesperatasksStruct(
                                                                TempodeesperatasksStruct(
                                                                  proximohorario:
                                                                      functions
                                                                          .retornedaquia6horas(
                                                                              getCurrentTimestamp),
                                                                  tasks:
                                                                      taskRef,
                                                                ),
                                                                clearUnsetFields:
                                                                    false,
                                                              ),
                                                              true,
                                                            )
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                  }

                                                  safeSetState(() {});
                                                },
                                                notasksdisponiveis: () =>
                                                    NotasksavaliateWidget(),
                                                visualSwipe:
                                                    (DocumentReference task) =>
                                                        CardSwipeadWidget(
                                                  tasks: task,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ].divide(SizedBox(height: 20.0)),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation1']!);
                        },
                      ),
                    if (!valueOrDefault<bool>(
                        currentUserDocument?.verifyaccount, false))
                      StreamBuilder<List<ComunitysRecord>>(
                        stream: queryComunitysRecord(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitPulse(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<ComunitysRecord> containerComunitysRecordList =
                              snapshot.data!;

                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                wrapWithModel(
                                  model: _model.verifiyaccounturgentModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: VerifiyaccounturgentWidget(),
                                ),
                              ].divide(SizedBox(height: 20.0)),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation2']!);
                        },
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 120.0,
                        decoration: BoxDecoration(),
                        child: Stack(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Icon(
                                        Icons.sort_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        size: 24.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: 104.0,
                                    height: 28.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5.0),
                                        bottomRight: Radius.circular(5.0),
                                        topLeft: Radius.circular(5.0),
                                        topRight: Radius.circular(5.0),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'All',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w300,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SWIPE_TASKER_Container_fxy8g1e3_ON_TAP');
                                      logFirebaseEvent(
                                          'Container_bottom_sheet');
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
                                              child: FilterdistancetaskWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      width: 104.0,
                                      height: 28.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5.0),
                                          bottomRight: Radius.circular(5.0),
                                          topLeft: Radius.circular(5.0),
                                          topRight: Radius.circular(5.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Distance',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SWIPE_TASKER_Container_l8jbspbk_ON_TAP');
                                      logFirebaseEvent(
                                          'Container_bottom_sheet');
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
                                              child: FilterpricetaskWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      width: 104.0,
                                      height: 28.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5.0),
                                          bottomRight: Radius.circular(5.0),
                                          topLeft: Radius.circular(5.0),
                                          topRight: Radius.circular(5.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Price',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.1,
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: wrapWithModel(
                                model: _model.navBarCopyModel,
                                updateCallback: () => safeSetState(() {}),
                                child: NavBarCopyWidget(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              if (valueOrDefault(currentUserDocument?.taskOrTaskee, '') ==
                  'Taskee')
                Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'Create New Task',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      fontSize: 36.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      lineHeight: 1.0,
                                    ),
                              ),
                            ),
                            if (!valueOrDefault<bool>(
                                currentUserDocument?.verifyaccount, false))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'SWIPE_TASKER_PAGE_Row_cx7ywwlr_ON_TAP');
                                  logFirebaseEvent('Row_navigate_to');

                                  context.pushNamed(
                                      PhoneNumberCopy2Widget.routeName);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'Active your account to continue',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w300,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                              lineHeight: 1.0,
                                            ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right_sharp,
                                      color: FlutterFlowTheme.of(context).error,
                                      size: 24.0,
                                    ),
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                              ),
                          ].divide(SizedBox(height: 14.0)),
                        ),
                      ].divide(SizedBox(height: 20.0)),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 300.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: Image.asset(
                              'assets/images/Artboard_21_(1).png',
                            ).image,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 1.0),
                          child: Stack(
                            children: [
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.verifyaccount, false))
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 22.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'SWIPE_TASKER_PAGE_Row_xfxnfrke_ON_TAP');
                                        logFirebaseEvent('Row_navigate_to');

                                        context.pushNamed(
                                            SelectTaskWidget.routeName);
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'START HERE',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Icon(
                                            Icons.chevron_right_rounded,
                                            color: Colors.white,
                                            size: 35.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              wrapWithModel(
                                model: _model.navBarModel,
                                updateCallback: () => safeSetState(() {}),
                                child: NavBarWidget(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
