import '/components/nav_bar_homes_copy_copy2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editarperfil_widget.dart' show EditarperfilWidget;
import 'package:flutter/material.dart';

class EditarperfilModel extends FlutterFlowModel<EditarperfilWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navBarHomesCopyCopy2 component.
  late NavBarHomesCopyCopy2Model navBarHomesCopyCopy2Model;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    navBarHomesCopyCopy2Model =
        createModel(context, () => NavBarHomesCopyCopy2Model());
  }

  @override
  void dispose() {
    navBarHomesCopyCopy2Model.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
