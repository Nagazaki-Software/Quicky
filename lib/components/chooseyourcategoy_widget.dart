import '/backend/gemini/gemini.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chooseyourcategoy_model.dart';
export 'chooseyourcategoy_model.dart';

/// bottom sheet escolha sua categoria
class ChooseyourcategoyWidget extends StatefulWidget {
  const ChooseyourcategoyWidget({super.key});

  @override
  State<ChooseyourcategoyWidget> createState() =>
      _ChooseyourcategoyWidgetState();
}

class _ChooseyourcategoyWidgetState extends State<ChooseyourcategoyWidget> {
  late ChooseyourcategoyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseyourcategoyModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(45.0),
          topRight: Radius.circular(45.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      Text(
                        'Choose Your Category With AI',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ].divide(SizedBox(width: 4.0)),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
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
                      hintText: 'Write your description',
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
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
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
                FlutterFlowChoiceChips(
                  options: [
                    ChipData('Custom'),
                    ChipData('Personal & Dorms'),
                    ChipData('Food Delivery & Shopping'),
                    ChipData('Academic Help'),
                    ChipData('Health & Wellbeing'),
                    ChipData('Events & Social Support'),
                    ChipData('Trasportation & Deliveries'),
                    ChipData('Tech Support'),
                    ChipData('Maintance & Repairs'),
                    ChipData('Moving & Organizing'),
                    ChipData('Pet Care'),
                    ChipData('Creative Servies & Media')
                  ],
                  onChanged: (val) => safeSetState(
                      () => _model.choiceChipsValue = val?.firstOrNull),
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).info,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).info,
                    iconSize: 18.0,
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor: Color(0xD561390C),
                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Readex Pro',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    iconSize: 18.0,
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  chipSpacing: 8.0,
                  rowSpacing: 12.0,
                  multiselect: false,
                  initialized: _model.choiceChipsValue != null,
                  alignment: WrapAlignment.start,
                  controller: _model.choiceChipsValueController ??=
                      FormFieldController<List<String>>(
                    ['Custom'],
                  ),
                  wrapped: true,
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await geminiGenerateText(
                      context,
                      '**Retorne em json e em inglês uma task criada com, title, description, difficulty com easy, medium, hard, valor estipulado,tempo estimado, se é in person ou remote e essa category: ${_model.choiceChipsValue} **',
                    ).then((generatedText) {
                      safeSetState(() => _model.textoGerado = generatedText);
                    });

                    FFAppState().geminiJson =
                        functions.formatStringToJson(_model.textoGerado!);
                    FFAppState().update(() {});
                    Navigator.pop(context);

                    safeSetState(() {});
                  },
                  text: 'Confirm Selection',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
