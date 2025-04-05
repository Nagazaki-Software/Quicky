import '/flutter_flow/flutter_flow_util.dart';
import 'componente_materiais_necessarios_widget.dart'
    show ComponenteMateriaisNecessariosWidget;
import 'package:flutter/material.dart';

class ComponenteMateriaisNecessariosModel
    extends FlutterFlowModel<ComponenteMateriaisNecessariosWidget> {
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
