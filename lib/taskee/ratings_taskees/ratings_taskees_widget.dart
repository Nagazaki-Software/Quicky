import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar_widget.dart';
import '/components/nousersranking_copy_widget.dart';
import '/components/text_field_raties_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ratings_taskees_model.dart';
export 'ratings_taskees_model.dart';

class RatingsTaskeesWidget extends StatefulWidget {
  const RatingsTaskeesWidget({super.key});

  static String routeName = 'RatingsTaskees';
  static String routePath = '/ratingsTaskees';

  @override
  State<RatingsTaskeesWidget> createState() => _RatingsTaskeesWidgetState();
}

class _RatingsTaskeesWidgetState extends State<RatingsTaskeesWidget>
    with TickerProviderStateMixin {
  late RatingsTaskeesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingsTaskeesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'RatingsTaskees'});
    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
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
      'textOnPageLoadAnimation': AnimationInfo(
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
      'columnOnPageLoadAnimation': AnimationInfo(
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
    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: valueOrDefault<Color>(
            valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee'
                ? FlutterFlowTheme.of(context).primaryBackground
                : FlutterFlowTheme.of(context).primaryBackground,
            FlutterFlowTheme.of(context).primaryBackground,
          ),
          body: Stack(
            children: [
              if (valueOrDefault(currentUserDocument?.taskOrTaskee, '') ==
                  'Taskee')
                Stack(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (FFAppState().selectedRakingPages ==
                            'About the task')
                          Expanded(
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              child: Stack(
                                children: [
                                  StreamBuilder<List<TasksRecord>>(
                                    stream: queryTasksRecord(
                                      queryBuilder: (tasksRecord) => tasksRecord
                                          .where(
                                            'userReference',
                                            isEqualTo: currentUserReference,
                                          )
                                          .where(
                                            'status',
                                            isEqualTo: 'completed',
                                          )
                                          .where(
                                            'avaliado',
                                            isEqualTo: false,
                                          ),
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
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            final tasksindexs = functions
                                                .tasksRatingForIndexs(
                                                    containerTasksRecordList
                                                        .toList(),
                                                    _model.indexs!)
                                                .toList();
                                            if (tasksindexs.isEmpty) {
                                              return NousersrankingCopyWidget();
                                            }

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  tasksindexs.length,
                                                  (tasksindexsIndex) {
                                                final tasksindexsItem =
                                                    tasksindexs[
                                                        tasksindexsIndex];
                                                return Expanded(
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    40.0,
                                                                    0.0,
                                                                    0.0),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              SingleChildScrollView(
                                                                primary: false,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          14.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                'About the task',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontStyle: FontStyle.italic,
                                                                                      ),
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                tasksindexsItem.categoria,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                              Container(
                                                                                width: 160.0,
                                                                                height: 3.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                          ),
                                                                        ].divide(SizedBox(height: 16.0)),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (tasksindexsItem
                                                                      .fotosFinaisTask
                                                                      .isNotEmpty)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          18.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final fotosFinais = tasksindexsItem
                                                                              .fotosFinaisTask
                                                                              .toList();

                                                                          return SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: List.generate(fotosFinais.length, (fotosFinaisIndex) {
                                                                                final fotosFinaisItem = fotosFinais[fotosFinaisIndex];
                                                                                return Container(
                                                                                  width: 100.0,
                                                                                  height: 90.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Colors.white,
                                                                                    image: DecorationImage(
                                                                                      fit: BoxFit.cover,
                                                                                      image: Image.network(
                                                                                        fotosFinaisItem,
                                                                                      ).image,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(12.0),
                                                                                      bottomRight: Radius.circular(12.0),
                                                                                      topLeft: Radius.circular(12.0),
                                                                                      topRight: Radius.circular(12.0),
                                                                                    ),
                                                                                    border: Border.all(
                                                                                      color: Color(0xFFECECEC),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }).divide(SizedBox(width: 10.0)),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        14.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          14.0,
                                                                          0.0,
                                                                          14.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                45.0,
                                                                            height:
                                                                                38.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(12.0),
                                                                                bottomRight: Radius.circular(12.0),
                                                                                topLeft: Radius.circular(12.0),
                                                                                topRight: Radius.circular(12.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                width: 3.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                '1',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontStyle: FontStyle.italic,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 22.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              'How satisfied are you with how this task turned out?',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FontWeight.w800,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w800,
                                                                                    fontStyle: FontStyle.italic,
                                                                                    lineHeight: 1.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 6.0)),
                                                                      ),
                                                                    ),
                                                                    if (_model
                                                                            .feedback1 ==
                                                                        null)
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children:
                                                                            [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/vermelho_.branco.png',
                                                                              width: 20.0,
                                                                              height: 20.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                child: Text(
                                                                                  'Needs Improvement',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.poppins(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 8.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 115.0,
                                                                                height: 16.0,
                                                                                decoration: BoxDecoration(
                                                                                  gradient: LinearGradient(
                                                                                    colors: [
                                                                                      FlutterFlowTheme.of(context).error,
                                                                                      Color(0xFFFF2B37)
                                                                                    ],
                                                                                    stops: [
                                                                                      0.0,
                                                                                      1.0
                                                                                    ],
                                                                                    begin: AlignmentDirectional(0.17, -1.0),
                                                                                    end: AlignmentDirectional(-0.17, 1.0),
                                                                                  ),
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(10.0),
                                                                                    bottomRight: Radius.circular(10.0),
                                                                                    topLeft: Radius.circular(10.0),
                                                                                    topRight: Radius.circular(10.0),
                                                                                  ),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RATINGS_TASKEES_Column_1ahggiqo_ON_TAP');
                                                                                        if (_model.feedback1 == 0) {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = null;
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = 0;
                                                                                          safeSetState(() {});
                                                                                        }
                                                                                      },
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            '0',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RATINGS_TASKEES_Column_elpsdcz4_ON_TAP');
                                                                                        if (_model.feedback1 == 1) {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = null;
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = 1;
                                                                                          safeSetState(() {});
                                                                                        }
                                                                                      },
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            '1',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RATINGS_TASKEES_Column_1fnaoi03_ON_TAP');
                                                                                        if (_model.feedback1 == 2) {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = null;
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = 2;
                                                                                          safeSetState(() {});
                                                                                        }
                                                                                      },
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            '2',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RATINGS_TASKEES_Column_lhilx92e_ON_TAP');
                                                                                        if (_model.feedback1 == 3) {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = null;
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = 3;
                                                                                          safeSetState(() {});
                                                                                        }
                                                                                      },
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            '3',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RATINGS_TASKEES_Column_wd1crcly_ON_TAP');
                                                                                        if (_model.feedback1 == 4) {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = null;
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = 4;
                                                                                          safeSetState(() {});
                                                                                        }
                                                                                      },
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            '4',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RATINGS_TASKEES_Column_vleh60wz_ON_TAP');
                                                                                        if (_model.feedback1 == 5) {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = null;
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = 5;
                                                                                          safeSetState(() {});
                                                                                        }
                                                                                      },
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            '5',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RATINGS_TASKEES_Column_26vkll6z_ON_TAP');
                                                                                        if (_model.feedback1 == 6) {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = null;
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = 6;
                                                                                          safeSetState(() {});
                                                                                        }
                                                                                      },
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            '6',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 10.0)),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/Amarelo_.branco.png',
                                                                              width: 20.0,
                                                                              height: 20.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                child: Text(
                                                                                  'Good',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.poppins(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 8.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 50.0,
                                                                                height: 16.0,
                                                                                decoration: BoxDecoration(
                                                                                  gradient: LinearGradient(
                                                                                    colors: [
                                                                                      Color(0xFFF9CB82),
                                                                                      Color(0xFFFFAE2F)
                                                                                    ],
                                                                                    stops: [
                                                                                      0.0,
                                                                                      1.0
                                                                                    ],
                                                                                    begin: AlignmentDirectional(0.17, -1.0),
                                                                                    end: AlignmentDirectional(-0.17, 1.0),
                                                                                  ),
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(10.0),
                                                                                    bottomRight: Radius.circular(10.0),
                                                                                    topLeft: Radius.circular(10.0),
                                                                                    topRight: Radius.circular(10.0),
                                                                                  ),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RATINGS_TASKEES_Column_7l1uxc0o_ON_TAP');
                                                                                        if (_model.feedback1 == 7) {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = null;
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = 7;
                                                                                          safeSetState(() {});
                                                                                        }
                                                                                      },
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            '7',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RATINGS_TASKEES_Column_wjqn8cle_ON_TAP');
                                                                                        if (_model.feedback1 == 8) {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = null;
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = 8;
                                                                                          safeSetState(() {});
                                                                                        }
                                                                                      },
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            '8',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 10.0)),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/verde_.branco.png',
                                                                              width: 20.0,
                                                                              height: 20.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                child: Text(
                                                                                  'Exelent',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.poppins(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 8.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 40.0,
                                                                                height: 16.0,
                                                                                decoration: BoxDecoration(
                                                                                  gradient: LinearGradient(
                                                                                    colors: [
                                                                                      Color(0xFF67BC46),
                                                                                      Color(0xFF21B069)
                                                                                    ],
                                                                                    stops: [
                                                                                      0.0,
                                                                                      1.0
                                                                                    ],
                                                                                    begin: AlignmentDirectional(0.17, -1.0),
                                                                                    end: AlignmentDirectional(-0.17, 1.0),
                                                                                  ),
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(10.0),
                                                                                    bottomRight: Radius.circular(10.0),
                                                                                    topLeft: Radius.circular(10.0),
                                                                                    topRight: Radius.circular(10.0),
                                                                                  ),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RATINGS_TASKEES_Column_c8dgtvqm_ON_TAP');
                                                                                        if (_model.feedback1 == 9) {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = null;
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = 9;
                                                                                          safeSetState(() {});
                                                                                        }
                                                                                      },
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            '9',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RATINGS_TASKEES_Column_fj4z12yk_ON_TAP');
                                                                                        if (_model.feedback1 == 10) {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = null;
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          logFirebaseEvent('Column_update_page_state');
                                                                                          _model.feedback1 = 10;
                                                                                          safeSetState(() {});
                                                                                        }
                                                                                      },
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            '10',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 10.0)),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ].divide(SizedBox(width: 8.0)),
                                                                      ),
                                                                    if (_model
                                                                            .feedback1 !=
                                                                        null)
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children:
                                                                            [
                                                                          if (_model.feedback1! <=
                                                                              6)
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.asset(
                                                                                'assets/images/vermelho_.branco.png',
                                                                                width: 20.0,
                                                                                height: 20.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          if ((_model.feedback1 == 7) ||
                                                                              (_model.feedback1 == 8))
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.asset(
                                                                                'assets/images/Amarelo_.branco.png',
                                                                                width: 20.0,
                                                                                height: 20.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          if (_model.feedback1! >=
                                                                              9)
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.asset(
                                                                                'assets/images/verde_.branco.png',
                                                                                width: 20.0,
                                                                                height: 20.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          if (_model.feedback1! >=
                                                                              9)
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                if (_model.feedback1! >= 9)
                                                                                  Container(
                                                                                    width: 40.0,
                                                                                    height: 16.0,
                                                                                    decoration: BoxDecoration(
                                                                                      gradient: LinearGradient(
                                                                                        colors: [
                                                                                          Color(0xFF67BC46),
                                                                                          Color(0xFF21B069)
                                                                                        ],
                                                                                        stops: [0.0, 1.0],
                                                                                        begin: AlignmentDirectional(0.17, -1.0),
                                                                                        end: AlignmentDirectional(-0.17, 1.0),
                                                                                      ),
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(10.0),
                                                                                        bottomRight: Radius.circular(10.0),
                                                                                        topLeft: Radius.circular(10.0),
                                                                                        topRight: Radius.circular(10.0),
                                                                                      ),
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                _model.feedback1.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.poppins(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: Colors.white,
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 10.0)),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          if (_model.feedback1! <=
                                                                              6)
                                                                            Container(
                                                                              width: 40.0,
                                                                              height: 16.0,
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    FlutterFlowTheme.of(context).error,
                                                                                    Color(0xFFFF2B37)
                                                                                  ],
                                                                                  stops: [
                                                                                    0.0,
                                                                                    1.0
                                                                                  ],
                                                                                  begin: AlignmentDirectional(0.17, -1.0),
                                                                                  end: AlignmentDirectional(-0.17, 1.0),
                                                                                ),
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(10.0),
                                                                                  bottomRight: Radius.circular(10.0),
                                                                                  topLeft: Radius.circular(10.0),
                                                                                  topRight: Radius.circular(10.0),
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_fvovdliq_ON_TAP');
                                                                                      if (_model.feedback1 == 0) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback1 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback1 = 0;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            _model.feedback1.toString(),
                                                                                            '0',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                          if ((_model.feedback1 == 7) ||
                                                                              (_model.feedback1 == 8))
                                                                            Container(
                                                                              width: 40.0,
                                                                              height: 16.0,
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    Color(0xFFF9CB82),
                                                                                    Color(0xFFFFAE2F)
                                                                                  ],
                                                                                  stops: [
                                                                                    0.0,
                                                                                    1.0
                                                                                  ],
                                                                                  begin: AlignmentDirectional(0.17, -1.0),
                                                                                  end: AlignmentDirectional(-0.17, 1.0),
                                                                                ),
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(10.0),
                                                                                  bottomRight: Radius.circular(10.0),
                                                                                  topLeft: Radius.circular(10.0),
                                                                                  topRight: Radius.circular(10.0),
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_72odf1pt_ON_TAP');
                                                                                      if (_model.feedback1 == 8) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback1 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback1 = 8;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            _model.feedback1.toString(),
                                                                                            '0',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                        ].divide(SizedBox(width: 8.0)),
                                                                      ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          14.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                30.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                              child: TextFieldRatiesWidget(
                                                                                key: Key('Keyosy_${tasksindexsIndex}_of_${tasksindexs.length}'),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                0.5,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          4.0)),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        14.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          14.0,
                                                                          0.0,
                                                                          14.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                45.0,
                                                                            height:
                                                                                38.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(12.0),
                                                                                bottomRight: Radius.circular(12.0),
                                                                                topLeft: Radius.circular(12.0),
                                                                                topRight: Radius.circular(12.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                width: 3.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                '2',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontStyle: FontStyle.italic,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 22.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              'Were the task instructions clear and easy to follow?',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FontWeight.w800,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w800,
                                                                                    fontStyle: FontStyle.italic,
                                                                                    lineHeight: 1.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 6.0)),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children:
                                                                          [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/vermelho_.branco.png',
                                                                            width:
                                                                                20.0,
                                                                            height:
                                                                                20.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Text(
                                                                                'Needs Improvement',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 8.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: 115.0,
                                                                              height: 16.0,
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    FlutterFlowTheme.of(context).error,
                                                                                    Color(0xFFFF2B37)
                                                                                  ],
                                                                                  stops: [
                                                                                    0.0,
                                                                                    1.0
                                                                                  ],
                                                                                  begin: AlignmentDirectional(0.17, -1.0),
                                                                                  end: AlignmentDirectional(-0.17, 1.0),
                                                                                ),
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(10.0),
                                                                                  bottomRight: Radius.circular(10.0),
                                                                                  topLeft: Radius.circular(10.0),
                                                                                  topRight: Radius.circular(10.0),
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_yxjzjjud_ON_TAP');
                                                                                      if (_model.feedback2 == 0) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 0;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '0',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_qh7rot1b_ON_TAP');
                                                                                      if (_model.feedback2 == 1) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 1;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '1',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_5bb51ll1_ON_TAP');
                                                                                      if (_model.feedback2 == 2) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 2;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '2',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_yftdzdva_ON_TAP');
                                                                                      if (_model.feedback2 == 3) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 3;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '3',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_mxsr4697_ON_TAP');
                                                                                      if (_model.feedback2 == 4) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 4;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '4',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_qx00bn7u_ON_TAP');
                                                                                      if (_model.feedback2 == 5) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 5;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '5',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_adehuvez_ON_TAP');
                                                                                      if (_model.feedback2 == 6) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 6;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '6',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/Amarelo_.branco.png',
                                                                            width:
                                                                                20.0,
                                                                            height:
                                                                                20.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Text(
                                                                                'Good',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 8.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: 50.0,
                                                                              height: 16.0,
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    Color(0xFFF9CB82),
                                                                                    Color(0xFFFFAE2F)
                                                                                  ],
                                                                                  stops: [
                                                                                    0.0,
                                                                                    1.0
                                                                                  ],
                                                                                  begin: AlignmentDirectional(0.17, -1.0),
                                                                                  end: AlignmentDirectional(-0.17, 1.0),
                                                                                ),
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(10.0),
                                                                                  bottomRight: Radius.circular(10.0),
                                                                                  topLeft: Radius.circular(10.0),
                                                                                  topRight: Radius.circular(10.0),
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_hyot5ace_ON_TAP');
                                                                                      if (_model.feedback2 == 7) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 7;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '7',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_4xeh2bb8_ON_TAP');
                                                                                      if (_model.feedback2 == 8) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 8;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '8',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/verde_.branco.png',
                                                                            width:
                                                                                20.0,
                                                                            height:
                                                                                20.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Text(
                                                                                'Exelent',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 8.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: 40.0,
                                                                              height: 16.0,
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    Color(0xFF67BC46),
                                                                                    Color(0xFF21B069)
                                                                                  ],
                                                                                  stops: [
                                                                                    0.0,
                                                                                    1.0
                                                                                  ],
                                                                                  begin: AlignmentDirectional(0.17, -1.0),
                                                                                  end: AlignmentDirectional(-0.17, 1.0),
                                                                                ),
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(10.0),
                                                                                  bottomRight: Radius.circular(10.0),
                                                                                  topLeft: Radius.circular(10.0),
                                                                                  topRight: Radius.circular(10.0),
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_5x5vc6la_ON_TAP');
                                                                                      if (_model.feedback2 == 9) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 9;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '9',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_7licxugr_ON_TAP');
                                                                                      if (_model.feedback2 == 10) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 10;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '10',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 8.0)),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          14.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                30.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                              child: TextFieldRatiesWidget(
                                                                                key: Key('Keyua5_${tasksindexsIndex}_of_${tasksindexs.length}'),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                0.5,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          4.0)),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        14.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          14.0,
                                                                          0.0,
                                                                          14.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                45.0,
                                                                            height:
                                                                                38.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(12.0),
                                                                                bottomRight: Radius.circular(12.0),
                                                                                topLeft: Radius.circular(12.0),
                                                                                topRight: Radius.circular(12.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                width: 3.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                '3',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontStyle: FontStyle.italic,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 22.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              'How would you rate the quality of the work delivered?',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FontWeight.w800,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w800,
                                                                                    fontStyle: FontStyle.italic,
                                                                                    lineHeight: 1.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 6.0)),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children:
                                                                          [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/vermelho_.branco.png',
                                                                            width:
                                                                                20.0,
                                                                            height:
                                                                                20.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Text(
                                                                                'Needs Improvement',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 8.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: 115.0,
                                                                              height: 16.0,
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    FlutterFlowTheme.of(context).error,
                                                                                    Color(0xFFFF2B37)
                                                                                  ],
                                                                                  stops: [
                                                                                    0.0,
                                                                                    1.0
                                                                                  ],
                                                                                  begin: AlignmentDirectional(0.17, -1.0),
                                                                                  end: AlignmentDirectional(-0.17, 1.0),
                                                                                ),
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(10.0),
                                                                                  bottomRight: Radius.circular(10.0),
                                                                                  topLeft: Radius.circular(10.0),
                                                                                  topRight: Radius.circular(10.0),
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_8hmggmiy_ON_TAP');
                                                                                      if (_model.feedback2 == 0) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 0;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '0',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_auza7zmx_ON_TAP');
                                                                                      if (_model.feedback2 == 1) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 1;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '1',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_tk86fiv9_ON_TAP');
                                                                                      if (_model.feedback2 == 2) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 2;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '2',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_f7dkggp0_ON_TAP');
                                                                                      if (_model.feedback2 == 3) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 3;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '3',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_ylux1u9j_ON_TAP');
                                                                                      if (_model.feedback2 == 4) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 4;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '4',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_yhxc5t8o_ON_TAP');
                                                                                      if (_model.feedback2 == 5) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 5;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '5',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_7gph3j1l_ON_TAP');
                                                                                      if (_model.feedback2 == 6) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 6;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '6',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/Amarelo_.branco.png',
                                                                            width:
                                                                                20.0,
                                                                            height:
                                                                                20.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Text(
                                                                                'Good',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 8.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: 50.0,
                                                                              height: 16.0,
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    Color(0xFFF9CB82),
                                                                                    Color(0xFFFFAE2F)
                                                                                  ],
                                                                                  stops: [
                                                                                    0.0,
                                                                                    1.0
                                                                                  ],
                                                                                  begin: AlignmentDirectional(0.17, -1.0),
                                                                                  end: AlignmentDirectional(-0.17, 1.0),
                                                                                ),
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(10.0),
                                                                                  bottomRight: Radius.circular(10.0),
                                                                                  topLeft: Radius.circular(10.0),
                                                                                  topRight: Radius.circular(10.0),
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_tqi4mbjk_ON_TAP');
                                                                                      if (_model.feedback2 == 7) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 7;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '7',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_5yi328j4_ON_TAP');
                                                                                      if (_model.feedback2 == 8) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 8;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '8',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/verde_.branco.png',
                                                                            width:
                                                                                20.0,
                                                                            height:
                                                                                20.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Text(
                                                                                'Exelent',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 8.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: 40.0,
                                                                              height: 16.0,
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    Color(0xFF67BC46),
                                                                                    Color(0xFF21B069)
                                                                                  ],
                                                                                  stops: [
                                                                                    0.0,
                                                                                    1.0
                                                                                  ],
                                                                                  begin: AlignmentDirectional(0.17, -1.0),
                                                                                  end: AlignmentDirectional(-0.17, 1.0),
                                                                                ),
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(10.0),
                                                                                  bottomRight: Radius.circular(10.0),
                                                                                  topLeft: Radius.circular(10.0),
                                                                                  topRight: Radius.circular(10.0),
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_7f8s6cus_ON_TAP');
                                                                                      if (_model.feedback2 == 9) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 9;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '9',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_4mvub1k7_ON_TAP');
                                                                                      if (_model.feedback2 == 10) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 10;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '10',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 8.0)),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          14.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                30.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                              child: TextFieldRatiesWidget(
                                                                                key: Key('Keyoz3_${tasksindexsIndex}_of_${tasksindexs.length}'),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                0.5,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          4.0)),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        14.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          14.0,
                                                                          0.0,
                                                                          14.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                45.0,
                                                                            height:
                                                                                38.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(12.0),
                                                                                bottomRight: Radius.circular(12.0),
                                                                                topLeft: Radius.circular(12.0),
                                                                                topRight: Radius.circular(12.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                width: 3.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                '4',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontStyle: FontStyle.italic,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 22.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              'Do you feel the price you paid matched the service you received?',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FontWeight.w800,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w800,
                                                                                    fontStyle: FontStyle.italic,
                                                                                    lineHeight: 1.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 6.0)),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children:
                                                                          [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/vermelho_.branco.png',
                                                                            width:
                                                                                20.0,
                                                                            height:
                                                                                20.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Text(
                                                                                'Needs Improvement',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 8.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: 115.0,
                                                                              height: 16.0,
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    FlutterFlowTheme.of(context).error,
                                                                                    Color(0xFFFF2B37)
                                                                                  ],
                                                                                  stops: [
                                                                                    0.0,
                                                                                    1.0
                                                                                  ],
                                                                                  begin: AlignmentDirectional(0.17, -1.0),
                                                                                  end: AlignmentDirectional(-0.17, 1.0),
                                                                                ),
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(10.0),
                                                                                  bottomRight: Radius.circular(10.0),
                                                                                  topLeft: Radius.circular(10.0),
                                                                                  topRight: Radius.circular(10.0),
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_yuxmep9q_ON_TAP');
                                                                                      if (_model.feedback2 == 0) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 0;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '0',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_p6rd91es_ON_TAP');
                                                                                      if (_model.feedback2 == 1) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 1;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '1',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_6gsw223q_ON_TAP');
                                                                                      if (_model.feedback2 == 2) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 2;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '2',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_8ma0t987_ON_TAP');
                                                                                      if (_model.feedback2 == 3) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 3;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '3',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_xuyzyg41_ON_TAP');
                                                                                      if (_model.feedback2 == 4) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 4;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '4',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_yftgdco9_ON_TAP');
                                                                                      if (_model.feedback2 == 5) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 5;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '5',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_g8kqme8i_ON_TAP');
                                                                                      if (_model.feedback2 == 6) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 6;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '6',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/Amarelo_.branco.png',
                                                                            width:
                                                                                20.0,
                                                                            height:
                                                                                20.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Text(
                                                                                'Good',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 8.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: 50.0,
                                                                              height: 16.0,
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    Color(0xFFF9CB82),
                                                                                    Color(0xFFFFAE2F)
                                                                                  ],
                                                                                  stops: [
                                                                                    0.0,
                                                                                    1.0
                                                                                  ],
                                                                                  begin: AlignmentDirectional(0.17, -1.0),
                                                                                  end: AlignmentDirectional(-0.17, 1.0),
                                                                                ),
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(10.0),
                                                                                  bottomRight: Radius.circular(10.0),
                                                                                  topLeft: Radius.circular(10.0),
                                                                                  topRight: Radius.circular(10.0),
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_0xcn99za_ON_TAP');
                                                                                      if (_model.feedback2 == 7) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 7;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '7',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_unh5epn0_ON_TAP');
                                                                                      if (_model.feedback2 == 8) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 8;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '8',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/verde_.branco.png',
                                                                            width:
                                                                                20.0,
                                                                            height:
                                                                                20.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Text(
                                                                                'Exelent',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 8.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: 40.0,
                                                                              height: 16.0,
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    Color(0xFF67BC46),
                                                                                    Color(0xFF21B069)
                                                                                  ],
                                                                                  stops: [
                                                                                    0.0,
                                                                                    1.0
                                                                                  ],
                                                                                  begin: AlignmentDirectional(0.17, -1.0),
                                                                                  end: AlignmentDirectional(-0.17, 1.0),
                                                                                ),
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(10.0),
                                                                                  bottomRight: Radius.circular(10.0),
                                                                                  topLeft: Radius.circular(10.0),
                                                                                  topRight: Radius.circular(10.0),
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_uti42g77_ON_TAP');
                                                                                      if (_model.feedback2 == 9) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 9;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '9',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RATINGS_TASKEES_Column_e1fuhefj_ON_TAP');
                                                                                      if (_model.feedback2 == 10) {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = null;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Column_update_page_state');
                                                                                        _model.feedback2 = 10;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          '10',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 8.0)),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          14.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                30.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                              child: TextFieldRatiesWidget(
                                                                                key: Key('Keyryj_${tasksindexsIndex}_of_${tasksindexs.length}'),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                0.5,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          4.0)),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        14.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          14.0,
                                                                          0.0,
                                                                          14.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                45.0,
                                                                            height:
                                                                                38.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(12.0),
                                                                                bottomRight: Radius.circular(12.0),
                                                                                topLeft: Radius.circular(12.0),
                                                                                topRight: Radius.circular(12.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                width: 3.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                '5',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontStyle: FontStyle.italic,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 22.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              'Anything else we could improve on for future tasks?',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FontWeight.w800,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w800,
                                                                                    fontStyle: FontStyle.italic,
                                                                                    lineHeight: 1.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 6.0)),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          14.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                0.7,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                0.7,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          14.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                30.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                              child: TextFieldRatiesWidget(
                                                                                key: Key('Keyx6c_${tasksindexsIndex}_of_${tasksindexs.length}'),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                0.7,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          4.0)),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 4.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ).animateOnPageLoad(
                                animationsMap['stackOnPageLoadAnimation']!),
                          ),
                        if (FFAppState().selectedRakingPages ==
                            'About the tasker')
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 40.0, 0.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 14.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'About the task',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 16.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 84.0,
                                                  height: 84.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    'https://picsum.photos/seed/193/600',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  'Enzo Godoy',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ].divide(SizedBox(width: 28.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 14.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 0.0, 14.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 45.0,
                                                    height: 38.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 3.0,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        '1',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 22.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      'How well did the tasker comminicare throughout?',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            lineHeight: 1.0,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 6.0)),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/vermelho_.branco.png',
                                                    width: 20.0,
                                                    height: 20.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Text(
                                                        'Needs Improvement',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 115.0,
                                                      height: 16.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                            Color(0xFFFF2B37)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.17, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  -0.17, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '0',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '1',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '2',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '3',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '4',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '5',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '6',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Amarelo_.branco.png',
                                                    width: 20.0,
                                                    height: 20.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Text(
                                                        'Good',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50.0,
                                                      height: 16.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFFF9CB82),
                                                            Color(0xFFFFAE2F)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.17, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  -0.17, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '7',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '8',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/verde_.branco.png',
                                                    width: 20.0,
                                                    height: 20.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Text(
                                                        'Exelent',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 40.0,
                                                      height: 16.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFF67BC46),
                                                            Color(0xFF21B069)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.17, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  -0.17, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '9',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '10',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Add Comment',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 8.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 0.7,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 14.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 0.0, 14.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 45.0,
                                                    height: 38.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 3.0,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        '2',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 22.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      'Was the tasker courteous and respectful?',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            lineHeight: 1.0,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 6.0)),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/vermelho_.branco.png',
                                                    width: 20.0,
                                                    height: 20.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Text(
                                                        'Needs Improvement',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 115.0,
                                                      height: 16.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                            Color(0xFFFF2B37)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.17, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  -0.17, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '0',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '1',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '2',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '3',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '4',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '5',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '6',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Amarelo_.branco.png',
                                                    width: 20.0,
                                                    height: 20.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Text(
                                                        'Good',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50.0,
                                                      height: 16.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFFF9CB82),
                                                            Color(0xFFFFAE2F)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.17, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  -0.17, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '7',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '8',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/verde_.branco.png',
                                                    width: 20.0,
                                                    height: 20.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Text(
                                                        'Exelent',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 40.0,
                                                      height: 16.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFF67BC46),
                                                            Color(0xFF21B069)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.17, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  -0.17, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '9',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '10',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Add Comment',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 8.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 0.7,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 14.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 0.0, 14.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 45.0,
                                                    height: 38.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 3.0,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        '3',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 22.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      'How would you rate the tasker´s skill level for this job?',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            lineHeight: 1.0,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 6.0)),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/vermelho_.branco.png',
                                                    width: 20.0,
                                                    height: 20.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Text(
                                                        'Needs Improvement',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 115.0,
                                                      height: 16.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                            Color(0xFFFF2B37)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.17, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  -0.17, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '0',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '1',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '2',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '3',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '4',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '5',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '6',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Amarelo_.branco.png',
                                                    width: 20.0,
                                                    height: 20.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Text(
                                                        'Good',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50.0,
                                                      height: 16.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFFF9CB82),
                                                            Color(0xFFFFAE2F)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.17, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  -0.17, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '7',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '8',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/verde_.branco.png',
                                                    width: 20.0,
                                                    height: 20.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Text(
                                                        'Exelent',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 40.0,
                                                      height: 16.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFF67BC46),
                                                            Color(0xFF21B069)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.17, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  -0.17, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '9',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '10',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Add Comment',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 8.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 0.7,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 14.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 0.0, 14.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 45.0,
                                                    height: 38.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 3.0,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        '4',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 22.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      'If issues came up, did the tasker handie them effectively? ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            lineHeight: 1.0,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 6.0)),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/vermelho_.branco.png',
                                                    width: 20.0,
                                                    height: 20.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Text(
                                                        'Needs Improvement',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 115.0,
                                                      height: 16.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                            Color(0xFFFF2B37)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.17, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  -0.17, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '0',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '1',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '2',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '3',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '4',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '5',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '6',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Amarelo_.branco.png',
                                                    width: 20.0,
                                                    height: 20.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Text(
                                                        'Good',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50.0,
                                                      height: 16.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFFF9CB82),
                                                            Color(0xFFFFAE2F)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.17, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  -0.17, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '7',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '8',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/verde_.branco.png',
                                                    width: 20.0,
                                                    height: 20.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Text(
                                                        'Exelent',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 40.0,
                                                      height: 16.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFF67BC46),
                                                            Color(0xFF21B069)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.17, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  -0.17, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '9',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '10',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Add Comment',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 8.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 0.7,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 14.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 0.0, 14.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 45.0,
                                                    height: 38.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 3.0,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        '5',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 22.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      'Would you book this same tasker again? ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            lineHeight: 1.0,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 6.0)),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Amarelo_.branco.png',
                                                    width: 20.0,
                                                    height: 20.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 50.0,
                                                      height: 16.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFFF9CB82),
                                                            Color(0xFFFFAE2F)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.17, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  -0.17, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'YES',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.w800,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/vermelho_.branco.png',
                                                    width: 20.0,
                                                    height: 20.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 50.0,
                                                      height: 16.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFFFF7077),
                                                            Color(0xFFFF3D49)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.17, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  -0.17, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'NO',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.w800,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Why?',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 8.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 0.7,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 14.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 0.0, 14.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 45.0,
                                                    height: 38.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 3.0,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        '6',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 22.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      'Any tips or shout-outs for the tasker?',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            lineHeight: 1.0,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 6.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Add Comment',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 8.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 0.7,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 6.0)),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'columnOnPageLoadAnimation']!),
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          child: Container(
                            width: 47.0,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Container(
                                    width: 45.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    decoration: BoxDecoration(
                                      color: () {
                                        if (FFAppState().selectedRakingPages ==
                                            'About the task') {
                                          return FlutterFlowTheme.of(context)
                                              .tertiary;
                                        } else if (FFAppState()
                                                .selectedRakingPages ==
                                            'About the tasker') {
                                          return FlutterFlowTheme.of(context)
                                              .secondary;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .primary;
                                        }
                                      }(),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 40.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                size: 12.0,
                                              ),
                                              Icon(
                                                Icons.circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                size: 12.0,
                                              ),
                                            ].divide(SizedBox(height: 8.0)),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'RATINGS_TASKEES_Stack_zw7pa5hq_ON_TAP');
                                                logFirebaseEvent(
                                                    'Stack_update_app_state');
                                                FFAppState()
                                                        .selectedRakingPages =
                                                    'About the task';
                                                safeSetState(() {});
                                              },
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                children: [
                                                  if (FFAppState()
                                                          .selectedRakingPages ==
                                                      'About the task')
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/Artboard_24_1.png',
                                                        width: 200.0,
                                                        height: 200.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Container(
                                                      width: 50.0,
                                                      height: 90.0,
                                                      child: custom_widgets
                                                          .RotatedTaskTexts(
                                                        width: 50.0,
                                                        height: 90.0,
                                                        text: 'About Task',
                                                        cor: FFAppState()
                                                                    .selectedRakingPages ==
                                                                'About the task'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'RATINGS_TASKEES_Stack_9dguqqo2_ON_TAP');
                                                logFirebaseEvent(
                                                    'Stack_update_app_state');
                                                FFAppState()
                                                        .selectedRakingPages =
                                                    'About the tasker';
                                                safeSetState(() {});
                                              },
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                children: [
                                                  if ((String var1) {
                                                    return var1 ==
                                                        'About the tasker';
                                                  }(FFAppState()
                                                      .selectedRakingPages))
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/Artboard_24_1.png',
                                                        width: 200.0,
                                                        height: 230.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: 60.0,
                                                      height: 180.0,
                                                      child: custom_widgets
                                                          .RotatedTaskTexts(
                                                        width: 60.0,
                                                        height: 180.0,
                                                        text: ' About Tasker',
                                                        cor: (String var1) {
                                                          return var1 ==
                                                              'About the tasker';
                                                        }(FFAppState()
                                                                .selectedRakingPages)
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                                            logFirebaseEvent(
                                                'RATINGS_TASKEES_Container_aye94b0y_ON_TA');
                                            logFirebaseEvent(
                                                'Container_update_page_state');
                                            _model.indexs = _model.indexs! + 1;
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 40.0,
                                            height: 170.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
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
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                width: 45.0,
                                                height: 150.0,
                                                child: custom_widgets
                                                    .RotatedTextBold(
                                                  width: 45.0,
                                                  height: 150.0,
                                                  text: 'SEND FEEDBACK',
                                                  cor: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        height: 70.0,
                        child: Stack(
                          children: [
                            wrapWithModel(
                              model: _model.navBarModel,
                              updateCallback: () => safeSetState(() {}),
                              child: NavBarWidget(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 0.7,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
