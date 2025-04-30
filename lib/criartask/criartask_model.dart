import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
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

  // Stores action output result for [Backend Call - Create Document] action in Text widget.
  TasksRecord? createTask;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextFieldLocation widget.
  FocusNode? textFieldLocationFocusNode1;
  TextEditingController? textFieldLocationTextController1;
  String? Function(BuildContext, String?)?
      textFieldLocationTextController1Validator;
  // State field(s) for TextFieldLocation widget.
  FocusNode? textFieldLocationFocusNode2;
  TextEditingController? textFieldLocationTextController2;
  String? Function(BuildContext, String?)?
      textFieldLocationTextController2Validator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];
  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldLocationFocusNode1?.dispose();
    textFieldLocationTextController1?.dispose();

    textFieldLocationFocusNode2?.dispose();
    textFieldLocationTextController2?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }
}
