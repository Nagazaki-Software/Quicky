import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'teladeeditarperfil_copy_model.dart';
export 'teladeeditarperfil_copy_model.dart';

/// tela de editar perfil do tinder
class TeladeeditarperfilCopyWidget extends StatefulWidget {
  const TeladeeditarperfilCopyWidget({super.key});

  static String routeName = 'teladeeditarperfilCopy';
  static String routePath = '/teladeeditarperfilCopy';

  @override
  State<TeladeeditarperfilCopyWidget> createState() =>
      _TeladeeditarperfilCopyWidgetState();
}

class _TeladeeditarperfilCopyWidgetState
    extends State<TeladeeditarperfilCopyWidget> {
  late TeladeeditarperfilCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeladeeditarperfilCopyModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.switchValue = true;
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 44.0, 16.0, 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'MEDIA',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                  Container(
                    width: 2000.0,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'TextField',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        filled: true,
                        fillColor: Color(0x432B323B),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                      child: Text(
                        'ABOUT ME',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFF95A1AC),
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                      child: Text(
                        'PREFERENCIA DE TAREFAS E EXPERIENCIA',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFF95A1AC),
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: Color(0x412B323B),
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
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'TAREFAS PREFERIDAS',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                                Wrap(
                                  spacing: 5.0,
                                  runSpacing: 5.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      width: 100.0,
                                      height: 47.0,
                                      constraints: BoxConstraints(
                                        maxWidth: double.infinity,
                                        maxHeight: 30.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor1,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'American football',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100.0,
                                      height: 47.0,
                                      constraints: BoxConstraints(
                                        maxWidth: double.infinity,
                                        maxHeight: 30.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor1,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Bars',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100.0,
                                      height: 47.0,
                                      constraints: BoxConstraints(
                                        maxWidth: double.infinity,
                                        maxHeight: 30.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor1,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Netflix',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100.0,
                                      height: 47.0,
                                      constraints: BoxConstraints(
                                        maxWidth: double.infinity,
                                        maxHeight: 30.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor1,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Music',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100.0,
                                      height: 47.0,
                                      constraints: BoxConstraints(
                                        maxWidth: double.infinity,
                                        maxHeight: 30.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor1,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'TikTok',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Text(
                      'LANGUAGES I SPEAK',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFF95A1AC),
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: Color(0x412B323B),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 0.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 5.0, 0.0),
                                              child: Icon(
                                                Icons.language,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                            Text(
                                              'Add languages',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'select',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                            Icon(
                                              Icons.chevron_right,
                                              color: Color(0xFF95A1AC),
                                              size: 24.0,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Color(0x422B323B),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Smart Photos',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Switch(
                                  value: _model.switchValue!,
                                  onChanged: (newValue) async {
                                    safeSetState(
                                        () => _model.switchValue = newValue!);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).accent4,
                                  activeTrackColor: Color(0x4BFFFFFF),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                      child: Text(
                        'MORE ABOUT ME',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFF95A1AC),
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: Color(0x432B323B),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Communication style',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'select',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                          Icon(
                                            Icons.chevron_right,
                                            color: Color(0xFF95A1AC),
                                            size: 24.0,
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Training',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'select',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                          Icon(
                                            Icons.chevron_right,
                                            color: Color(0xFF95A1AC),
                                            size: 24.0,
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Family',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'select',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                          Icon(
                                            Icons.chevron_right,
                                            color: Color(0xFF95A1AC),
                                            size: 24.0,
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Personality types',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'select',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                          Icon(
                                            Icons.chevron_right,
                                            color: Color(0xFF95A1AC),
                                            size: 24.0,
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                      child: Text(
                        'GENDER',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFF95A1AC),
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.029,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Color(0x432B323B),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Woman, Cis Woman/ Cisgender Woman',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    50.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Visible',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFF717171),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Color(0xFF95A1AC),
                                size: 24.0,
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
