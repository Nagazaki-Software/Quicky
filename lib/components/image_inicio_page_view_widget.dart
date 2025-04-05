import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'image_inicio_page_view_model.dart';
export 'image_inicio_page_view_model.dart';

class ImageInicioPageViewWidget extends StatefulWidget {
  const ImageInicioPageViewWidget({
    super.key,
    this.parameter3,
  });

  final DocumentReference? parameter3;

  @override
  State<ImageInicioPageViewWidget> createState() =>
      _ImageInicioPageViewWidgetState();
}

class _ImageInicioPageViewWidgetState extends State<ImageInicioPageViewWidget> {
  late ImageInicioPageViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageInicioPageViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
