import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pagina_qual_seu_nome_widget.dart' show PaginaQualSeuNomeWidget;
import 'package:flutter/material.dart';

class PaginaQualSeuNomeModel extends FlutterFlowModel<PaginaQualSeuNomeWidget> {
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
