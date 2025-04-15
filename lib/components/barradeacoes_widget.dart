import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'barradeacoes_model.dart';
export 'barradeacoes_model.dart';

class BarradeacoesWidget extends StatefulWidget {
  const BarradeacoesWidget({super.key});

  @override
  State<BarradeacoesWidget> createState() => _BarradeacoesWidgetState();
}

class _BarradeacoesWidgetState extends State<BarradeacoesWidget> {
  late BarradeacoesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BarradeacoesModel());

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
