import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/your_message_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'message_widget.dart' show MessageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
