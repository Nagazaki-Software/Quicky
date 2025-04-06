import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/outher_msg_copy_widget.dart';
import '/components/outher_msg_widget.dart';
import '/components/your_msg_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'chat_componente_widget.dart' show ChatComponenteWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
