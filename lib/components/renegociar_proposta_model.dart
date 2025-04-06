import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'renegociar_proposta_widget.dart' show RenegociarPropostaWidget;
import 'package:flutter/material.dart';

class RenegociarPropostaModel
    extends FlutterFlowModel<RenegociarPropostaWidget> {
  ///  Local state fields for this component.

  bool? renegociateError = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
