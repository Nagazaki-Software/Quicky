import '/components/nav_bar_homes_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_widget.dart' show ChatWidget;
import 'package:flutter/material.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  String? direcao = '';

  ///  State fields for stateful widgets in this page.

  // Model for navBarHomesCopy component.
  late NavBarHomesCopyModel navBarHomesCopyModel;

  @override
  void initState(BuildContext context) {
    navBarHomesCopyModel = createModel(context, () => NavBarHomesCopyModel());
  }

  @override
  void dispose() {
    navBarHomesCopyModel.dispose();
  }
}
