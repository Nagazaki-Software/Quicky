import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'imagem_current_task_chat_model.dart';
export 'imagem_current_task_chat_model.dart';

class ImagemCurrentTaskChatWidget extends StatefulWidget {
  const ImagemCurrentTaskChatWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
  });

  final List<String>? parameter1;
  final int? parameter2;
  final List<String>? parameter3;

  @override
  State<ImagemCurrentTaskChatWidget> createState() =>
      _ImagemCurrentTaskChatWidgetState();
}

class _ImagemCurrentTaskChatWidgetState
    extends State<ImagemCurrentTaskChatWidget> {
  late ImagemCurrentTaskChatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImagemCurrentTaskChatModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final photos = widget.parameter3?.toList() ?? [];

        return Container(
          width: double.infinity,
          child: Stack(
            children: [
              PageView.builder(
                controller: _model.pageViewController ??= PageController(
                    initialPage: max(0, min(0, photos.length - 1))),
                scrollDirection: Axis.horizontal,
                itemCount: photos.length,
                itemBuilder: (context, photosIndex) {
                  final photosItem = photos[photosIndex];
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (_model.pageViewCurrentIndex ==
                          functions
                              .quantasNaLista(widget.parameter3!.toList())) {
                        await _model.pageViewController?.animateToPage(
                          0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      } else {
                        await _model.pageViewController?.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Hero(
                      tag: photosItem,
                      transitionOnUserGestures: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                        child: Image.network(
                          photosItem,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, -1.0),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: smooth_page_indicator.SmoothPageIndicator(
                    controller: _model.pageViewController ??= PageController(
                        initialPage: max(0, min(0, photos.length - 1))),
                    count: photos.length,
                    axisDirection: Axis.horizontal,
                    onDotClicked: (i) async {
                      await _model.pageViewController!.animateToPage(
                        i,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                      safeSetState(() {});
                    },
                    effect: smooth_page_indicator.SlideEffect(
                      spacing: 8.0,
                      radius: 8.0,
                      dotWidth: 8.0,
                      dotHeight: 8.0,
                      dotColor: FlutterFlowTheme.of(context).secondaryText,
                      activeDotColor: FlutterFlowTheme.of(context).primary,
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
