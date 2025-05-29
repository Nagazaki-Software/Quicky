import '/components/nav_bar_copy_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ratings_taskees_copy_widget.dart' show RatingsTaskeesCopyWidget;
import 'package:flutter/material.dart';

class RatingsTaskeesCopyModel
    extends FlutterFlowModel<RatingsTaskeesCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navBarCopy component.
  late NavBarCopyModel navBarCopyModel;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarCopyModel = createModel(context, () => NavBarCopyModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarCopyModel.dispose();
    navBarModel.dispose();
  }
}
