import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_inicio_widget.dart' show ChatInicioWidget;
import 'package:flutter/material.dart';

class ChatInicioModel extends FlutterFlowModel<ChatInicioWidget> {
  ///  Local state fields for this page.

  List<TodosOsChatsStruct> message = [];
  void addToMessage(TodosOsChatsStruct item) => message.add(item);
  void removeFromMessage(TodosOsChatsStruct item) => message.remove(item);
  void removeAtIndexFromMessage(int index) => message.removeAt(index);
  void insertAtIndexInMessage(int index, TodosOsChatsStruct item) =>
      message.insert(index, item);
  void updateMessageAtIndex(int index, Function(TodosOsChatsStruct) updateFn) =>
      message[index] = updateFn(message[index]);

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
