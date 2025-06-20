import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

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
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.8,
          height: 40.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
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
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).tertiary,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('NAV_BAR_COMP_Column_9i7qda9w_ON_TAP');
                  logFirebaseEvent('Column_update_app_state');
                  FFAppState().pages = 'scoreboardTaskee';
                  safeSetState(() {});
                  logFirebaseEvent('Column_navigate_to');

                  context.pushNamed(
                    TaskeeRankingWidget.routeName,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.scoreboard_rounded,
                      color: FFAppState().pages == 'scoreboardTaskee'
                          ? FlutterFlowTheme.of(context).alternate
                          : FlutterFlowTheme.of(context).primaryBackground,
                      size: 24.0,
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
                  logFirebaseEvent('NAV_BAR_COMP_Column_v8htiu59_ON_TAP');
                  logFirebaseEvent('Column_update_app_state');
                  FFAppState().pages = 'ratingsTaskee';
                  safeSetState(() {});
                  logFirebaseEvent('Column_navigate_to');

                  context.pushNamed(
                    RatingsTaskeesWidget.routeName,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.stacked_bar_chart,
                      color: FFAppState().pages == 'ratingsTaskee'
                          ? FlutterFlowTheme.of(context).alternate
                          : FlutterFlowTheme.of(context).primaryBackground,
                      size: 24.0,
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
                  logFirebaseEvent('NAV_BAR_COMP_Column_j7oun6op_ON_TAP');
                  logFirebaseEvent('Column_update_app_state');
                  FFAppState().pages = 'createTask';
                  safeSetState(() {});
                  logFirebaseEvent('Column_navigate_to');

                  context.pushNamed(
                    CreateTaskWidget.routeName,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FFIcons.kcreateTaskButton,
                      color: FFAppState().pages == 'createTask'
                          ? FlutterFlowTheme.of(context).alternate
                          : FlutterFlowTheme.of(context).primaryBackground,
                      size: 30.0,
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
                  logFirebaseEvent('NAV_BAR_COMP_Column_tyid7p7y_ON_TAP');
                  logFirebaseEvent('Column_update_app_state');
                  FFAppState().pages = 'currentTaskTaskee';
                  safeSetState(() {});
                  logFirebaseEvent('Column_navigate_to');

                  context.pushNamed(
                    CurrentTasksWidget.routeName,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lan_sharp,
                      color: FFAppState().pages == 'currentTaskTaskee'
                          ? FlutterFlowTheme.of(context).alternate
                          : FlutterFlowTheme.of(context).primaryBackground,
                      size: 24.0,
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
                  logFirebaseEvent('NAV_BAR_COMP_Column_n5e5n6at_ON_TAP');
                  logFirebaseEvent('Column_update_app_state');
                  FFAppState().pages = 'profilePageTaskee';
                  safeSetState(() {});
                  logFirebaseEvent('Column_navigate_to');

                  context.pushNamed(
                    ProfilePageWidget.routeName,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_sharp,
                      color: FFAppState().pages == 'profilePageTaskee'
                          ? FlutterFlowTheme.of(context).alternate
                          : FlutterFlowTheme.of(context).primaryBackground,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
            ].divide(SizedBox(width: 12.0)).around(SizedBox(width: 12.0)),
          ),
        ),
      ),
    );
  }
}
