import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
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
      child: Container(
        decoration: BoxDecoration(),
        child: Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
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
                      FFAppState().pages = 'Home';
                      safeSetState(() {});

                      context.pushNamed(
                        PaginaInicialWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 350),
                          ),
                        },
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_rounded,
                          color: valueOrDefault<Color>(
                            FFAppState().pages == 'Home'
                                ? FlutterFlowTheme.of(context).tertiary
                                : FlutterFlowTheme.of(context).primaryText,
                            FlutterFlowTheme.of(context).primaryText,
                          ),
                          size: 24.0,
                        ),
                        Text(
                          'Home',
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: 'Readex Pro',
                                color: valueOrDefault<Color>(
                                  FFAppState().pages == 'Home'
                                      ? FlutterFlowTheme.of(context).tertiary
                                      : FlutterFlowTheme.of(context)
                                          .primaryText,
                                  FlutterFlowTheme.of(context).primaryText,
                                ),
                                letterSpacing: 0.0,
                              ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_task_rounded,
                        color: valueOrDefault<Color>(
                          FFAppState().pages == 'All Tasks'
                              ? FlutterFlowTheme.of(context).tertiary
                              : FlutterFlowTheme.of(context).primaryText,
                          FlutterFlowTheme.of(context).primaryText,
                        ),
                        size: 24.0,
                      ),
                      Text(
                        'All Tasks',
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily: 'Readex Pro',
                              color: valueOrDefault<Color>(
                                FFAppState().pages == 'All Tasks'
                                    ? FlutterFlowTheme.of(context).tertiary
                                    : FlutterFlowTheme.of(context).primaryText,
                                FlutterFlowTheme.of(context).primaryText,
                              ),
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      FFAppState().pages = 'Scoreboard';
                      safeSetState(() {});
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sports_score_sharp,
                          color: valueOrDefault<Color>(
                            FFAppState().pages == 'Scoreboard'
                                ? FlutterFlowTheme.of(context).tertiary
                                : FlutterFlowTheme.of(context).primaryText,
                            FlutterFlowTheme.of(context).primaryText,
                          ),
                          size: 24.0,
                        ),
                        Text(
                          'Scoreboard',
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: 'Readex Pro',
                                color: valueOrDefault<Color>(
                                  FFAppState().pages == 'Scoreboard'
                                      ? FlutterFlowTheme.of(context).tertiary
                                      : FlutterFlowTheme.of(context)
                                          .primaryText,
                                  FlutterFlowTheme.of(context).primaryText,
                                ),
                                letterSpacing: 0.0,
                              ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_outline_rounded,
                        color: valueOrDefault<Color>(
                          FFAppState().pages == 'Profile'
                              ? FlutterFlowTheme.of(context).tertiary
                              : FlutterFlowTheme.of(context).primaryText,
                          FlutterFlowTheme.of(context).primaryText,
                        ),
                        size: 24.0,
                      ),
                      Text(
                        'Profile',
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily: 'Readex Pro',
                              color: valueOrDefault<Color>(
                                FFAppState().pages == 'Scoreboard'
                                    ? FlutterFlowTheme.of(context).tertiary
                                    : FlutterFlowTheme.of(context).primaryText,
                                FlutterFlowTheme.of(context).primaryText,
                              ),
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
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
