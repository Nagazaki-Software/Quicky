import '/components/outher_msg_copy_widget.dart';
import '/components/outher_msg_widget.dart';
import '/components/your_msg_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_componente_widget.dart' show ChatComponenteWidget;
import 'package:flutter/material.dart';

class ChatComponenteModel extends FlutterFlowModel<ChatComponenteWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for yourMsg component.
  late YourMsgModel yourMsgModel;
  // Model for outherMsgCopy component.
  late OutherMsgCopyModel outherMsgCopyModel;
  // Model for outherMsg component.
  late OutherMsgModel outherMsgModel;

  @override
  void initState(BuildContext context) {
    yourMsgModel = createModel(context, () => YourMsgModel());
    outherMsgCopyModel = createModel(context, () => OutherMsgCopyModel());
    outherMsgModel = createModel(context, () => OutherMsgModel());
  }

  @override
  void dispose() {
    yourMsgModel.dispose();
    outherMsgCopyModel.dispose();
    outherMsgModel.dispose();
  }
}
