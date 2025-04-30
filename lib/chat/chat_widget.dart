import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/ainda_nao_existe_task_widget.dart';
import '/components/componente_rate_tasker_widget.dart';
import '/components/imagem_current_task_chat_widget.dart';
import '/components/minichat_rate_task_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_model.dart';
export 'chat_model.dart';

/// pagina inicial com swipeableStack e navbar
class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  static String routeName = 'chat';
  static String routePath = '/chat';

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> with TickerProviderStateMixin {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.linear,
            delay: 40.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 10.0),
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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFCCC4BC),
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.3,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              1.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Current Tasks',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                              ),
                              if (_model.recentTasks)
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.keyboard_arrow_up,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    if (_model.recentTasks) {
                                      _model.recentTasks = false;
                                      safeSetState(() {});
                                    } else {
                                      _model.recentTasks = true;
                                      safeSetState(() {});
                                    }
                                  },
                                ),
                              if (!_model.recentTasks)
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    if (_model.recentTasks) {
                                      _model.recentTasks = false;
                                      safeSetState(() {});
                                    } else {
                                      _model.recentTasks = true;
                                      safeSetState(() {});
                                    }
                                  },
                                ),
                            ],
                          ),
                        ),
                        if (_model.recentTasks)
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder<List<ChatRecord>>(
                                stream: queryChatRecord(
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<ChatRecord> rowChatRecordList =
                                      snapshot.data!;
                                  final rowChatRecord =
                                      rowChatRecordList.isNotEmpty
                                          ? rowChatRecordList.first
                                          : null;

                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: StreamBuilder<List<ChatRecord>>(
                                          stream: queryChatRecord(
                                            queryBuilder: (chatRecord) =>
                                                chatRecord.where(Filter.or(
                                              Filter(
                                                'userDocument',
                                                isEqualTo: currentUserReference,
                                              ),
                                              Filter(
                                                'user2Document',
                                                isEqualTo: currentUserReference,
                                              ),
                                            )),
                                            limit: 4,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitFadingCube(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ChatRecord>
                                                pageViewChatRecordList =
                                                snapshot.data!;

                                            return Container(
                                              width: double.infinity,
                                              height: 430.0,
                                              child: PageView.builder(
                                                controller: _model
                                                        .pageViewController ??=
                                                    PageController(
                                                        initialPage: max(
                                                            0,
                                                            min(
                                                                0,
                                                                pageViewChatRecordList
                                                                        .length -
                                                                    1))),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    pageViewChatRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, pageViewIndex) {
                                                  final pageViewChatRecord =
                                                      pageViewChatRecordList[
                                                          pageViewIndex];
                                                  return StreamBuilder<
                                                      TasksRecord>(
                                                    stream:
                                                        TasksRecord.getDocument(
                                                            pageViewChatRecord
                                                                .referenceTask!),
                                                    builder:
                                                        (context, snapshot) {
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

                                                      final columnTasksRecord =
                                                          snapshot.data!;

                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFFF0ECEC),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.3,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFFBFBFB),
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 1.0,
                                                                                color: Color(0x0C000000),
                                                                                offset: Offset(
                                                                                  0.0,
                                                                                  1.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(12.0),
                                                                              topRight: Radius.circular(12.0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      height: double.infinity,
                                                                                      child: Stack(
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, -1.0),
                                                                                            child: ImagemCurrentTaskChatWidget(
                                                                                              key: Key('Key7td_${pageViewIndex}_of_${pageViewChatRecordList.length}'),
                                                                                              parameter1: columnTasksRecord.foto,
                                                                                              parameter2: 1,
                                                                                              parameter3: columnTasksRecord.foto,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 8.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              12.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        0.0,
                                                                                        4.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(8.0),
                                                                                    bottomRight: Radius.circular(8.0),
                                                                                    topLeft: Radius.circular(0.0),
                                                                                    topRight: Radius.circular(0.0),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Text(
                                                                                              columnTasksRecord.titulo,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.readexPro(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 22.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(1.0, -1.0),
                                                                                          child: Container(
                                                                                            width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                            height: 30.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: columnTasksRecord.acceptRenegociate ? Color(0xFF036704) : Color(0xFF1271A8),
                                                                                              boxShadow: [
                                                                                                BoxShadow(
                                                                                                  blurRadius: 4.0,
                                                                                                  color: Color(0x33000000),
                                                                                                  offset: Offset(
                                                                                                    0.0,
                                                                                                    2.0,
                                                                                                  ),
                                                                                                )
                                                                                              ],
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Text(
                                                                                                '${columnTasksRecord.acceptRenegociate ? 'Reward' : 'Counter offer'} \$${valueOrDefault<String>(
                                                                                                  functions.formatStringInter(columnTasksRecord.valor).toString(),
                                                                                                  '0',
                                                                                                )}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.readexPro(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (pageViewChatRecord.taskRenegociate)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 35.0,
                                                                                        height: 35.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 4.0,
                                                                                              color: Color(0x33000000),
                                                                                              offset: Offset(
                                                                                                0.0,
                                                                                                2.0,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.all(6.0),
                                                                                          child: ClipRRect(
                                                                                            borderRadius: BorderRadius.only(
                                                                                              bottomLeft: Radius.circular(0.0),
                                                                                              bottomRight: Radius.circular(0.0),
                                                                                              topLeft: Radius.circular(0.0),
                                                                                              topRight: Radius.circular(0.0),
                                                                                            ),
                                                                                            child: Image.asset(
                                                                                              'assets/images/icons8-excluir-96.png',
                                                                                              width: 200.0,
                                                                                              height: 200.0,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: 35.0,
                                                                                        height: 35.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 4.0,
                                                                                              color: Color(0x33000000),
                                                                                              offset: Offset(
                                                                                                0.0,
                                                                                                2.0,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.all(6.0),
                                                                                          child: ClipRRect(
                                                                                            borderRadius: BorderRadius.only(
                                                                                              bottomLeft: Radius.circular(0.0),
                                                                                              bottomRight: Radius.circular(0.0),
                                                                                              topLeft: Radius.circular(0.0),
                                                                                              topRight: Radius.circular(0.0),
                                                                                            ),
                                                                                            child: Image.asset(
                                                                                              'assets/images/icons8-banknotes-100.png',
                                                                                              width: 200.0,
                                                                                              height: 200.0,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          await columnTasksRecord.reference.update(createTasksRecordData(
                                                                                            aceito: true,
                                                                                          ));
                                                                                        },
                                                                                        child: Container(
                                                                                          width: 35.0,
                                                                                          height: 35.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            boxShadow: [
                                                                                              BoxShadow(
                                                                                                blurRadius: 4.0,
                                                                                                color: Color(0x33000000),
                                                                                                offset: Offset(
                                                                                                  0.0,
                                                                                                  2.0,
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsets.all(6.0),
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.only(
                                                                                                bottomLeft: Radius.circular(0.0),
                                                                                                bottomRight: Radius.circular(0.0),
                                                                                                topLeft: Radius.circular(0.0),
                                                                                                topRight: Radius.circular(0.0),
                                                                                              ),
                                                                                              child: Image.asset(
                                                                                                'assets/images/icons8-selecionado-96.png',
                                                                                                width: 200.0,
                                                                                                height: 200.0,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 26.0)),
                                                                                  ),
                                                                                ),
                                                                              ComponenteRateTaskerWidget(
                                                                                key: Key('Keygad_${pageViewIndex}_of_${pageViewChatRecordList.length}'),
                                                                                taskReference: columnTasksRecord.reference,
                                                                                userReference: columnTasksRecord.userReference!,
                                                                              ),
                                                                            ].divide(SizedBox(height: 12.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              FutureBuilder<
                                                                  UsersRecord>(
                                                                future: UsersRecord
                                                                    .getDocumentOnce(
                                                                        columnTasksRecord
                                                                            .userReference!),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitFadingCube(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }

                                                                  final stackUsersRecord =
                                                                      snapshot
                                                                          .data!;

                                                                  return Stack(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          shape:
                                                                              BoxShape.circle,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              200.0,
                                                                          height:
                                                                              200.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            stackUsersRecord.photoUrl,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'All Tasks',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                ),
                                if (!_model.allTasks)
                                  FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      if (_model.allTasks) {
                                        _model.allTasks = false;
                                        safeSetState(() {});
                                      } else {
                                        _model.allTasks = true;
                                        safeSetState(() {});
                                      }
                                    },
                                  ),
                                if (_model.allTasks)
                                  FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.keyboard_arrow_up,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      if (_model.allTasks) {
                                        _model.allTasks = false;
                                        safeSetState(() {});
                                      } else {
                                        _model.allTasks = true;
                                        safeSetState(() {});
                                      }
                                    },
                                  ),
                              ],
                            ),
                            if (_model.allTasks)
                              ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Stack(
                                    children: [
                                      StreamBuilder<List<ChatRecord>>(
                                        stream: FFAppState().queryChats(
                                          requestFn: () => queryChatRecord(
                                            queryBuilder: (chatRecord) =>
                                                chatRecord.where(Filter.or(
                                              Filter(
                                                'userDocument',
                                                isEqualTo: currentUserReference,
                                              ),
                                              Filter(
                                                'user2Document',
                                                isEqualTo: currentUserReference,
                                              ),
                                            )),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<ChatRecord>
                                              gridViewChatRecordList =
                                              snapshot.data!;

                                          return GridView.builder(
                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 10.0,
                                              mainAxisSpacing: 10.0,
                                              childAspectRatio: 0.87,
                                            ),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                gridViewChatRecordList.length,
                                            itemBuilder:
                                                (context, gridViewIndex) {
                                              final gridViewChatRecord =
                                                  gridViewChatRecordList[
                                                      gridViewIndex];
                                              return Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation'] !=
                                                            null) {
                                                          safeSetState(() =>
                                                              hasContainerTriggered =
                                                                  true);
                                                          SchedulerBinding
                                                              .instance
                                                              .addPostFrameCallback((_) async =>
                                                                  await animationsMap[
                                                                          'containerOnActionTriggerAnimation']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0));
                                                        }

                                                        context.pushNamed(
                                                          ConversaWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'chatReference':
                                                                serializeParam(
                                                              gridViewChatRecord
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xC1F6F6F6),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        12.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        2.0),
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                gridViewChatRecord
                                                                    .imgDaTask,
                                                                width: 200.0,
                                                                height: 100.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF6F6F6),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          3.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                          Offset(
                                                                        0.0,
                                                                        2.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  gridViewChatRecord
                                                                      .nomeDoGrupo,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .readexPro(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            11.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            FutureBuilder<
                                                                UsersRecord>(
                                                              future: UsersRecord
                                                                  .getDocumentOnce(
                                                                      gridViewChatRecord
                                                                          .user2Document!),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          SpinKitFadingCube(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            50.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }

                                                                final stackUsersRecord =
                                                                    snapshot
                                                                        .data!;

                                                                return Stack(
                                                                  children: [
                                                                    MinichatRateTaskWidget(
                                                                      key: Key(
                                                                          'Key82m_${gridViewIndex}_of_${gridViewChatRecordList.length}'),
                                                                      parameter1:
                                                                          stackUsersRecord
                                                                              .avaliacoes,
                                                                      parameter2:
                                                                          stackUsersRecord
                                                                              .reference,
                                                                      parameter3:
                                                                          gridViewChatRecord
                                                                              .referenceTask,
                                                                      parameter4: stackUsersRecord
                                                                          .avaliacoes
                                                                          .elementAtOrNull(
                                                                              1)
                                                                          ?.fotodouser,
                                                                      parameter5: stackUsersRecord
                                                                          .avaliacoes
                                                                          .elementAtOrNull(
                                                                              2)
                                                                          ?.fotodouser,
                                                                      parameter6: stackUsersRecord
                                                                          .avaliacoes
                                                                          .elementAtOrNull(
                                                                              3)
                                                                          ?.fotodouser,
                                                                      parameter7: stackUsersRecord
                                                                          .avaliacoes
                                                                          .elementAtOrNull(
                                                                              0)
                                                                          ?.fotodouser,
                                                                      parameter8:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        stackUsersRecord
                                                                            .avaliacoes
                                                                            .length
                                                                            .toString(),
                                                                        '0',
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 0.0)),
                                                        ),
                                                      ),
                                                    ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'containerOnActionTriggerAnimation']!,
                                                        hasBeenTriggered:
                                                            hasContainerTriggered),
                                                  ),
                                                  FutureBuilder<UsersRecord>(
                                                    future: UsersRecord
                                                        .getDocumentOnce(
                                                            gridViewChatRecord
                                                                .userDocument!),
                                                    builder:
                                                        (context, snapshot) {
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

                                                      final containerUsersRecord =
                                                          snapshot.data!;

                                                      return Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  1.0),
                                                          child: Container(
                                                            width: 200.0,
                                                            height: 200.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              containerUsersRecord
                                                                  .photoUrl,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Completed Tasks',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                ),
                                if (_model.completedTask)
                                  FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.keyboard_arrow_up,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      if (_model.completedTask) {
                                        _model.completedTask = false;
                                        safeSetState(() {});
                                      } else {
                                        _model.completedTask = true;
                                        safeSetState(() {});
                                      }
                                    },
                                  ),
                                if (!_model.completedTask)
                                  FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      if (_model.completedTask) {
                                        _model.completedTask = false;
                                        safeSetState(() {});
                                      } else {
                                        _model.completedTask = true;
                                        safeSetState(() {});
                                      }
                                    },
                                  ),
                              ],
                            ),
                            if (_model.completedTask)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: StreamBuilder<List<ChatRecord>>(
                                  stream: queryChatRecord(
                                    queryBuilder: (chatRecord) =>
                                        chatRecord.where(Filter.or(
                                      Filter(
                                        'userDocument',
                                        isEqualTo: currentUserReference,
                                      ),
                                      Filter(
                                        'user2Document',
                                        isEqualTo: currentUserReference,
                                      ),
                                    )),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitFadingCube(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ChatRecord> columnChatRecordList =
                                        snapshot.data!;
                                    if (columnChatRecordList.isEmpty) {
                                      return AindaNaoExisteTaskWidget();
                                    }

                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(
                                          columnChatRecordList.length,
                                          (columnIndex) {
                                        final columnChatRecord =
                                            columnChatRecordList[columnIndex];
                                        return Container(
                                          width: double.infinity,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x75FBF9F7),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 12.0, 12.0, 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 48.0,
                                                      height: 48.0,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        columnChatRecord
                                                            .imgDaTask,
                                                        width: 48.0,
                                                        height: 48.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            columnChatRecord
                                                                .nomeDoGrupo,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .readexPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Text(
                                                            columnChatRecord
                                                                .ultMsg,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .readexPro(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 12.0)),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      dateTimeFormat(
                                                          "jm",
                                                          columnChatRecord
                                                              .ultimaMsg!),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 4.0)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).divide(SizedBox(height: 8.0)),
                                    ).animateOnPageLoad(animationsMap[
                                        'columnOnPageLoadAnimation']!);
                                  },
                                ),
                              ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
