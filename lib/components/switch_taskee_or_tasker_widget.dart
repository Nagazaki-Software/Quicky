import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'switch_taskee_or_tasker_model.dart';
export 'switch_taskee_or_tasker_model.dart';

class SwitchTaskeeOrTaskerWidget extends StatefulWidget {
  const SwitchTaskeeOrTaskerWidget({super.key});

  @override
  State<SwitchTaskeeOrTaskerWidget> createState() =>
      _SwitchTaskeeOrTaskerWidgetState();
}

class _SwitchTaskeeOrTaskerWidgetState
    extends State<SwitchTaskeeOrTaskerWidget> {
  late SwitchTaskeeOrTaskerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwitchTaskeeOrTaskerModel());

    _model.switchValue =
        valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee';
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
      child: AuthUserStreamWidget(
        builder: (context) => Switch.adaptive(
          value: _model.switchValue!,
          onChanged: (newValue) async {
            safeSetState(() => _model.switchValue = newValue);
            if (newValue) {
              if (valueOrDefault(currentUserDocument?.taskOrTaskee, '') ==
                  'Taskee') {
                await currentUserReference!.update(createUsersRecordData(
                  taskOrTaskee: 'Tasker',
                ));
              } else {
                await currentUserReference!.update(createUsersRecordData(
                  taskOrTaskee: 'Taskee',
                ));
              }
            } else {
              if (valueOrDefault(currentUserDocument?.taskOrTaskee, '') ==
                  'Tasker') {
                await currentUserReference!.update(createUsersRecordData(
                  taskOrTaskee: 'Taskee',
                ));
              } else {
                await currentUserReference!.update(createUsersRecordData(
                  taskOrTaskee: 'Tasker',
                ));
              }
            }
          },
          activeColor: FlutterFlowTheme.of(context).alternate,
          activeTrackColor: FlutterFlowTheme.of(context).primary,
          inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
          inactiveThumbColor: FlutterFlowTheme.of(context).primaryBackground,
        ),
      ),
    );
  }
}
