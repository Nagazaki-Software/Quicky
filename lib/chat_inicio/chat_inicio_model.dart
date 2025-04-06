import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/no_chat_yet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'chat_inicio_widget.dart' show ChatInicioWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
