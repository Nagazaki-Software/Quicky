import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar_homes_copy_copy_widget.dart';
import '/components/nav_bar_tinder_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'chat_widget.dart' show ChatWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  String? direcao = '';

  ///  State fields for stateful widgets in this page.

  // Model for navBarHomesCopyCopy component.
  late NavBarHomesCopyCopyModel navBarHomesCopyCopyModel;
  // Model for navBarTinder component.
  late NavBarTinderModel navBarTinderModel;

  @override
  void initState(BuildContext context) {
    navBarHomesCopyCopyModel =
        createModel(context, () => NavBarHomesCopyCopyModel());
    navBarTinderModel = createModel(context, () => NavBarTinderModel());
  }

  @override
  void dispose() {
    navBarHomesCopyCopyModel.dispose();
    navBarTinderModel.dispose();
  }
}
