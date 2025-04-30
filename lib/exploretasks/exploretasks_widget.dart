import '/components/explore_componente_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'exploretasks_model.dart';
export 'exploretasks_model.dart';

/// pagina explorar tasks por categorias bonito e minimalista com cores q faça
/// sentido
class ExploretasksWidget extends StatefulWidget {
  const ExploretasksWidget({super.key});

  static String routeName = 'exploretasks';
  static String routePath = '/exploretasks';

  @override
  State<ExploretasksWidget> createState() => _ExploretasksWidgetState();
}

class _ExploretasksWidgetState extends State<ExploretasksWidget> {
  late ExploretasksModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExploretasksModel());

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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFCCC4BC),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Explore Tasks',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                  ),
                  wrapWithModel(
                    model: _model.exploreComponenteModel,
                    updateCallback: () => safeSetState(() {}),
                    child: ExploreComponenteWidget(),
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
