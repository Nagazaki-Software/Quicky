import '/components/create_taskcomponente_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'criartask_widget.dart' show CriartaskWidget;
import 'package:flutter/material.dart';

class CriartaskModel extends FlutterFlowModel<CriartaskWidget> {
  ///  Local state fields for this page.

  List<String> foto = ['l'];
  void addToFoto(String item) => foto.add(item);
  void removeFromFoto(String item) => foto.remove(item);
  void removeAtIndexFromFoto(int index) => foto.removeAt(index);
  void insertAtIndexInFoto(int index, String item) => foto.insert(index, item);
  void updateFotoAtIndex(int index, Function(String) updateFn) =>
      foto[index] = updateFn(foto[index]);

  ///  State fields for stateful widgets in this page.

  // Model for createTaskcomponente component.
  late CreateTaskcomponenteModel createTaskcomponenteModel;

  @override
  void initState(BuildContext context) {
    createTaskcomponenteModel =
        createModel(context, () => CreateTaskcomponenteModel());
  }

  @override
  void dispose() {
    createTaskcomponenteModel.dispose();
  }
}
