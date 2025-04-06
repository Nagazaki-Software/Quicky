import '/backend/backend.dart';
import '/components/your_message_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'message_widget.dart' show MessageWidget;
import 'package:flutter/material.dart';

class MessageModel extends FlutterFlowModel<MessageWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in message widget.
  ChatRecord? queryChat;
  // Model for yourMessage component.
  late YourMessageModel yourMessageModel;

  @override
  void initState(BuildContext context) {
    yourMessageModel = createModel(context, () => YourMessageModel());
  }

  @override
  void dispose() {
    yourMessageModel.dispose();
  }
}
