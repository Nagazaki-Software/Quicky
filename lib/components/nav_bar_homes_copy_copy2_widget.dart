import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_homes_copy_copy2_model.dart';
export 'nav_bar_homes_copy_copy2_model.dart';

class NavBarHomesCopyCopy2Widget extends StatefulWidget {
  const NavBarHomesCopyCopy2Widget({super.key});

  @override
  State<NavBarHomesCopyCopy2Widget> createState() =>
      _NavBarHomesCopyCopy2WidgetState();
}

class _NavBarHomesCopyCopy2WidgetState
    extends State<NavBarHomesCopyCopy2Widget> {
  late NavBarHomesCopyCopy2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarHomesCopyCopy2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Ativo_1creativeservies.png',
                              width: 180.0,
                              height: 50.0,
                              fit: BoxFit.cover,
                              alignment: Alignment(-1.0, 0.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(SizedBox(width: 4.0)),
              ),
            ),
            Text(
              'Save',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).primary,
                    letterSpacing: 0.0,
                  ),
            ),
          ].divide(SizedBox(width: 12.0)),
        ),
      ),
    );
  }
}
