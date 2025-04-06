import '/flutter_flow/flutter_flow_util.dart';
import 'pagina_de_verificar_email_widget.dart'
    show PaginaDeVerificarEmailWidget;
import 'package:flutter/material.dart';

class PaginaDeVerificarEmailModel
    extends FlutterFlowModel<PaginaDeVerificarEmailWidget> {
  ///  State fields for stateful widgets in this page.

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
