import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/allfilters_widget.dart';
import '/components/chooseyourcategoy_copy_widget.dart';
import '/components/filter_distance_widget.dart';
import '/components/pricefilter_widget.dart';
import '/components/swipeable_stack_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'paginainicial_componente_model.dart';
export 'paginainicial_componente_model.dart';

class PaginainicialComponenteWidget extends StatefulWidget {
  const PaginainicialComponenteWidget({super.key});

  @override
  State<PaginainicialComponenteWidget> createState() =>
      _PaginainicialComponenteWidgetState();
}

class _PaginainicialComponenteWidgetState
    extends State<PaginainicialComponenteWidget> with TickerProviderStateMixin {
  late PaginainicialComponenteModel _model;

  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginainicialComponenteModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0xFF9F9F9F),
            begin: 0.32,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1670.0.ms,
            color: FlutterFlowTheme.of(context).warning,
            begin: 0.49,
            end: 0.01,
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
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 1.0,
        child: Stack(
          alignment: AlignmentDirectional(0.0, -1.0),
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          icon: FaIcon(
                            FontAwesomeIcons.slidersH,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: AllfiltersWidget(),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                        InkWell(
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
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: ChooseyourcategoyCopyWidget(),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: Container(
                            width: 100.0,
                            height: MediaQuery.sizeOf(context).height * 0.045,
                            decoration: BoxDecoration(
                              color: Color(0xFFFBFBFB),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    FFAppState().filtercategory,
                                    'Category',
                                  ).maybeHandleOverflow(
                                    maxChars: 8,
                                    replacement: '…',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                FaIcon(
                                  FontAwesomeIcons.angleDown,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 14.0,
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ),
                        ),
                        InkWell(
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
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: FilterDistanceWidget(),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: Container(
                            width: 100.0,
                            height: MediaQuery.sizeOf(context).height * 0.045,
                            decoration: BoxDecoration(
                              color: Color(0xFFFBFBFB),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Distance',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                FaIcon(
                                  FontAwesomeIcons.angleDown,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 14.0,
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ),
                        ),
                        InkWell(
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
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: PricefilterWidget(),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: Container(
                            width: 100.0,
                            height: MediaQuery.sizeOf(context).height * 0.045,
                            decoration: BoxDecoration(
                              color: Color(0xFFFBFBFB),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Price',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                FaIcon(
                                  FontAwesomeIcons.angleDown,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 14.0,
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 6.0)),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 56.0, 0.0, 12.0),
                child: AuthUserStreamWidget(
                  builder: (context) => FutureBuilder<List<TasksRecord>>(
                    future: queryTasksRecordOnce(
                      queryBuilder: (tasksRecord) => tasksRecord.where(
                        'Categoria',
                        isEqualTo: () {
                          if ((FFAppState().filtercategory != null &&
                                  FFAppState().filtercategory != '') &&
                              (FFAppState().filtercategory != 'All')) {
                            return FFAppState().filtercategory;
                          } else if (FFAppState().filtercategory == 'All') {
                            return '';
                          } else {
                            return '';
                          }
                        }(),
                      ).whereNotIn(
                          'idDaTask',
                          (currentUserDocument?.iDdastasksAceitadas?.toList() ??
                              [])),
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Container(
                                width: double.infinity,
                                height: 90.0,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.1,
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 15.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xDF4C341C),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(20.0),
                                                      topLeft:
                                                          Radius.circular(15.0),
                                                      topRight:
                                                          Radius.circular(0.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    25.0,
                                                                    0.0,
                                                                    25.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            1.0,
                                                                        shape:
                                                                            const CircleBorder(),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          decoration:
                                                                              BoxDecoration(
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
                                                                            gradient:
                                                                                LinearGradient(
                                                                              colors: [
                                                                                FlutterFlowTheme.of(context).primary,
                                                                                Color(0xE061390C),
                                                                                FlutterFlowTheme.of(context).primary
                                                                              ],
                                                                              stops: [
                                                                                0.0,
                                                                                0.5,
                                                                                1.0
                                                                              ],
                                                                              begin: AlignmentDirectional(0.0, -1.0),
                                                                              end: AlignmentDirectional(0, 1.0),
                                                                            ),
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(14.0),
                                                                              child: Container(
                                                                                width: 200.0,
                                                                                height: 200.0,
                                                                                clipBehavior: Clip.antiAlias,
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
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: 70.0,
                                                                    height:
                                                                        70.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              4.0,
                                                                          color:
                                                                              Color(0x70432913),
                                                                          offset:
                                                                              Offset(
                                                                            2.0,
                                                                            2.0,
                                                                          ),
                                                                          spreadRadius:
                                                                              2.0,
                                                                        )
                                                                      ],
                                                                      gradient:
                                                                          LinearGradient(
                                                                        colors: [
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                          Color(
                                                                              0xE061390C),
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary
                                                                        ],
                                                                        stops: [
                                                                          0.0,
                                                                          0.5,
                                                                          1.0
                                                                        ],
                                                                        begin: AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                        end: AlignmentDirectional(
                                                                            0,
                                                                            1.0),
                                                                      ),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(12.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              double.infinity,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/icons8-banknotes-100.png',
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ).animateOnActionTrigger(
                                                                      animationsMap[
                                                                          'containerOnActionTriggerAnimation1']!,
                                                                      hasBeenTriggered:
                                                                          hasContainerTriggered1),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFF492F18),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              5.0,
                                                                          color:
                                                                              Color(0x70432913),
                                                                          offset:
                                                                              Offset(
                                                                            2.0,
                                                                            2.0,
                                                                          ),
                                                                          spreadRadius:
                                                                              1.0,
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(14.0),
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
                                                                              Image.asset(
                                                                            'assets/images/icons8-selecionado-96.png',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ).animateOnActionTrigger(
                                                                      animationsMap[
                                                                          'containerOnActionTriggerAnimation2']!,
                                                                      hasBeenTriggered:
                                                                          hasContainerTriggered2),
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: custom_widgets.FlutterCardSwiper(
                                width: double.infinity,
                                height: double.infinity,
                                widgetDentroDoSwipe: () => SwipeableStackWidget(
                                  parameter3: containerTasksRecordList,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
