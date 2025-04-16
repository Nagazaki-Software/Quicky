import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'ciruclarphotowithborder_model.dart';
export 'ciruclarphotowithborder_model.dart';

/// circular photo with border
class CiruclarphotowithborderWidget extends StatefulWidget {
  const CiruclarphotowithborderWidget({super.key});

  @override
  State<CiruclarphotowithborderWidget> createState() =>
      _CiruclarphotowithborderWidgetState();
}

class _CiruclarphotowithborderWidgetState
    extends State<CiruclarphotowithborderWidget> {
  late CiruclarphotowithborderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CiruclarphotowithborderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Happy_International_no_bg.gif',
              ).image,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: AuthUserStreamWidget(
                  builder: (context) => ClipRRect(
                    borderRadius: BorderRadius.circular(60.0),
                    child: Image.network(
                      valueOrDefault<String>(
                        currentUserPhoto,
                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/quick-8zwblz/assets/fn0nlt6i0y4r/Design_sem_nome.png',
                      ),
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
