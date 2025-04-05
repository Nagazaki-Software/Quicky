import '/components/nav_bar_homes_copy_copy_widget.dart';
import '/components/nav_bar_tinder_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_widget.dart' show ChatWidget;
import 'package:flutter/material.dart';

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
