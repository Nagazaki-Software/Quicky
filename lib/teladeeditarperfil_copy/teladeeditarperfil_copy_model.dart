import '/flutter_flow/flutter_flow_util.dart';
import 'teladeeditarperfil_copy_widget.dart' show TeladeeditarperfilCopyWidget;
import 'package:flutter/material.dart';

class TeladeeditarperfilCopyModel
    extends FlutterFlowModel<TeladeeditarperfilCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
