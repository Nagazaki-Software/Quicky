import '/components/nav_bar_copy_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/switch_taskee_or_tasker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for switchTaskeeOrTasker component.
  late SwitchTaskeeOrTaskerModel switchTaskeeOrTaskerModel1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;
  // Model for switchTaskeeOrTasker component.
  late SwitchTaskeeOrTaskerModel switchTaskeeOrTaskerModel2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue5;
  // State field(s) for Checkbox widget.
  bool? checkboxValue6;
  // State field(s) for Checkbox widget.
  bool? checkboxValue7;
  // State field(s) for Checkbox widget.
  bool? checkboxValue8;
  // Model for navBar component.
  late NavBarModel navBarModel;
  // Model for navBarCopy component.
  late NavBarCopyModel navBarCopyModel;

  @override
  void initState(BuildContext context) {
    switchTaskeeOrTaskerModel1 =
        createModel(context, () => SwitchTaskeeOrTaskerModel());
    switchTaskeeOrTaskerModel2 =
        createModel(context, () => SwitchTaskeeOrTaskerModel());
    navBarModel = createModel(context, () => NavBarModel());
    navBarCopyModel = createModel(context, () => NavBarCopyModel());
  }

  @override
  void dispose() {
    switchTaskeeOrTaskerModel1.dispose();
    switchTaskeeOrTaskerModel2.dispose();
    navBarModel.dispose();
    navBarCopyModel.dispose();
  }
}
