import '/components/explore_componente_widget.dart';
import '/components/nav_bar_homes_copy_widget.dart';
import '/components/nav_bar_tinder_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'pagina_explore_model.dart';
export 'pagina_explore_model.dart';

/// pagina inicial com swipeableStack e navbar
class PaginaExploreWidget extends StatefulWidget {
  const PaginaExploreWidget({super.key});

  static String routeName = 'paginaExplore';
  static String routePath = '/paginaExplore';

  @override
  State<PaginaExploreWidget> createState() => _PaginaExploreWidgetState();
}

class _PaginaExploreWidgetState extends State<PaginaExploreWidget> {
  late PaginaExploreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaExploreModel());

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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  wrapWithModel(
                    model: _model.exploreComponenteModel,
                    updateCallback: () => safeSetState(() {}),
                    child: ExploreComponenteWidget(),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                  ))
                    Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: wrapWithModel(
                            model: _model.navBarTinderModel,
                            updateCallback: () => safeSetState(() {}),
                            child: NavBarTinderWidget(),
                          ),
                        ),
                      ],
                    ),
                  wrapWithModel(
                    model: _model.navBarHomesCopyModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NavBarHomesCopyWidget(),
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
