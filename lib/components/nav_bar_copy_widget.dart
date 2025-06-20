import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'nav_bar_copy_model.dart';
export 'nav_bar_copy_model.dart';

class NavBarCopyWidget extends StatefulWidget {
  const NavBarCopyWidget({super.key});

  @override
  State<NavBarCopyWidget> createState() => _NavBarCopyWidgetState();
}

class _NavBarCopyWidgetState extends State<NavBarCopyWidget> {
  late NavBarCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarCopyModel());

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
            color: FlutterFlowTheme.of(context).primaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x4C98B28E),
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
                  logFirebaseEvent('NAV_BAR_COPY_COMP_Column_54nfkd28_ON_TAP');
                  logFirebaseEvent('Column_update_app_state');
                  FFAppState().pages = 'scoreboardTasker';
                  safeSetState(() {});
                  logFirebaseEvent('Column_navigate_to');

                  context.pushNamed(
                    TaskeeRankingTaskerWidget.routeName,
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
                      color: FFAppState().pages == 'scoreboardTasker'
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).secondaryBackground,
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
                  logFirebaseEvent('NAV_BAR_COPY_COMP_Column_0244ylbj_ON_TAP');
                  logFirebaseEvent('Column_update_app_state');
                  FFAppState().pages = 'ratingsTasker';
                  safeSetState(() {});
                  logFirebaseEvent('Column_navigate_to');

                  context.pushNamed(
                    RatingsTaskerWidget.routeName,
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
                      color: FFAppState().pages == 'ratingsTasker'
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).secondaryBackground,
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
                  logFirebaseEvent('NAV_BAR_COPY_COMP_Column_e4cz6l60_ON_TAP');
                  logFirebaseEvent('Column_update_app_state');
                  FFAppState().pages = 'swipePage';
                  safeSetState(() {});
                  logFirebaseEvent('Column_navigate_to');

                  context.pushNamed(
                    SwipeTaskerWidget.routeName,
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
                      Icons.swipe_up,
                      color: FFAppState().pages == 'swipePage'
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).secondaryBackground,
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
                  logFirebaseEvent('NAV_BAR_COPY_COMP_Column_twmx1e8h_ON_TAP');
                  logFirebaseEvent('Column_update_app_state');
                  FFAppState().pages = 'currentTasksTasker';
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
                      color: FFAppState().pages == 'currentTasksTasker'
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).secondaryBackground,
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
                  logFirebaseEvent('NAV_BAR_COPY_COMP_Column_8uks1vus_ON_TAP');
                  logFirebaseEvent('Column_update_app_state');
                  FFAppState().pages = 'profilePageTasker';
                  safeSetState(() {});
                  logFirebaseEvent('Column_navigate_to');

                  context.pushNamed(ProfilePageWidget.routeName);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_sharp,
                      color: FFAppState().pages == 'profilePageTasker'
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).secondaryBackground,
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
