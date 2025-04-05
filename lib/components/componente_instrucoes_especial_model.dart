import '/flutter_flow/flutter_flow_util.dart';
import 'componente_instrucoes_especial_widget.dart'
    show ComponenteInstrucoesEspecialWidget;
import 'package:flutter/material.dart';

class ComponenteInstrucoesEspecialModel
    extends FlutterFlowModel<ComponenteInstrucoesEspecialWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
