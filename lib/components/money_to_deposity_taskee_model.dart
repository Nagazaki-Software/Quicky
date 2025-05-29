import '/flutter_flow/flutter_flow_util.dart';
import 'money_to_deposity_taskee_widget.dart' show MoneyToDeposityTaskeeWidget;
import 'package:flutter/material.dart';

class MoneyToDeposityTaskeeModel
    extends FlutterFlowModel<MoneyToDeposityTaskeeWidget> {
  ///  Local state fields for this component.

  double? value;

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
