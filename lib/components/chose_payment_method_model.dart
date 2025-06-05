import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chose_payment_method_widget.dart' show ChosePaymentMethodWidget;
import 'package:flutter/material.dart';

class ChosePaymentMethodModel
    extends FlutterFlowModel<ChosePaymentMethodWidget> {
  ///  Local state fields for this component.

  String chose = 'accountBalance';

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // Stores action output result for [Backend Call - API (get saldo)] action in Button widget.
  ApiCallResponse? getSaldo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
