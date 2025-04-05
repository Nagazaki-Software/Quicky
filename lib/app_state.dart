import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _pages = prefs.getString('ff_pages') ?? _pages;
    });
    _safeInit(() {
      _conversasData = prefs
              .getStringList('ff_conversasData')
              ?.map((x) {
                try {
                  return ChatStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _conversasData;
    });
    _safeInit(() {
      _distance = prefs.getDouble('ff_distance') ?? _distance;
    });
    _safeInit(() {
      _priceFilter = prefs.getInt('ff_priceFilter') ?? _priceFilter;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _pages = 'Pagina inicial';
  String get pages => _pages;
  set pages(String value) {
    _pages = value;
    prefs.setString('ff_pages', value);
  }

  ChatStruct _conversas = ChatStruct();
  ChatStruct get conversas => _conversas;
  set conversas(ChatStruct value) {
    _conversas = value;
  }

  void updateConversasStruct(Function(ChatStruct) updateFn) {
    updateFn(_conversas);
  }

  TodosOsChatsStruct _todasAsConversas = TodosOsChatsStruct();
  TodosOsChatsStruct get todasAsConversas => _todasAsConversas;
  set todasAsConversas(TodosOsChatsStruct value) {
    _todasAsConversas = value;
  }

  void updateTodasAsConversasStruct(Function(TodosOsChatsStruct) updateFn) {
    updateFn(_todasAsConversas);
  }

  List<ChatStruct> _conversasData = [];
  List<ChatStruct> get conversasData => _conversasData;
  set conversasData(List<ChatStruct> value) {
    _conversasData = value;
    prefs.setStringList(
        'ff_conversasData', value.map((x) => x.serialize()).toList());
  }

  void addToConversasData(ChatStruct value) {
    conversasData.add(value);
    prefs.setStringList(
        'ff_conversasData', _conversasData.map((x) => x.serialize()).toList());
  }

  void removeFromConversasData(ChatStruct value) {
    conversasData.remove(value);
    prefs.setStringList(
        'ff_conversasData', _conversasData.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromConversasData(int index) {
    conversasData.removeAt(index);
    prefs.setStringList(
        'ff_conversasData', _conversasData.map((x) => x.serialize()).toList());
  }

  void updateConversasDataAtIndex(
    int index,
    ChatStruct Function(ChatStruct) updateFn,
  ) {
    conversasData[index] = updateFn(_conversasData[index]);
    prefs.setStringList(
        'ff_conversasData', _conversasData.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInConversasData(int index, ChatStruct value) {
    conversasData.insert(index, value);
    prefs.setStringList(
        'ff_conversasData', _conversasData.map((x) => x.serialize()).toList());
  }

  List<TodosOsChatsStruct> _todasConversas = [];
  List<TodosOsChatsStruct> get todasConversas => _todasConversas;
  set todasConversas(List<TodosOsChatsStruct> value) {
    _todasConversas = value;
  }

  void addToTodasConversas(TodosOsChatsStruct value) {
    todasConversas.add(value);
  }

  void removeFromTodasConversas(TodosOsChatsStruct value) {
    todasConversas.remove(value);
  }

  void removeAtIndexFromTodasConversas(int index) {
    todasConversas.removeAt(index);
  }

  void updateTodasConversasAtIndex(
    int index,
    TodosOsChatsStruct Function(TodosOsChatsStruct) updateFn,
  ) {
    todasConversas[index] = updateFn(_todasConversas[index]);
  }

  void insertAtIndexInTodasConversas(int index, TodosOsChatsStruct value) {
    todasConversas.insert(index, value);
  }

  int _value = 0;
  int get value => _value;
  set value(int value) {
    _value = value;
  }

  String _categoria = '';
  String get categoria => _categoria;
  set categoria(String value) {
    _categoria = value;
  }

  String _PresencialRemoto = '';
  String get PresencialRemoto => _PresencialRemoto;
  set PresencialRemoto(String value) {
    _PresencialRemoto = value;
  }

  LatLng? _locationDaTask;
  LatLng? get locationDaTask => _locationDaTask;
  set locationDaTask(LatLng? value) {
    _locationDaTask = value;
  }

  String _InstrucoesEspeciais = '';
  String get InstrucoesEspeciais => _InstrucoesEspeciais;
  set InstrucoesEspeciais(String value) {
    _InstrucoesEspeciais = value;
  }

  String _gemini = '';
  String get gemini => _gemini;
  set gemini(String value) {
    _gemini = value;
  }

  String _MateriaisNecessarios = '';
  String get MateriaisNecessarios => _MateriaisNecessarios;
  set MateriaisNecessarios(String value) {
    _MateriaisNecessarios = value;
  }

  dynamic _geminiJson;
  dynamic get geminiJson => _geminiJson;
  set geminiJson(dynamic value) {
    _geminiJson = value;
  }

  String _NecessaryMaterials = '';
  String get NecessaryMaterials => _NecessaryMaterials;
  set NecessaryMaterials(String value) {
    _NecessaryMaterials = value;
  }

  String _EstimatedDuration = '';
  String get EstimatedDuration => _EstimatedDuration;
  set EstimatedDuration(String value) {
    _EstimatedDuration = value;
  }

  String _SpecialInstructions = '';
  String get SpecialInstructions => _SpecialInstructions;
  set SpecialInstructions(String value) {
    _SpecialInstructions = value;
  }

  bool _notificationAcceptTask = false;
  bool get notificationAcceptTask => _notificationAcceptTask;
  set notificationAcceptTask(bool value) {
    _notificationAcceptTask = value;
  }

  DocumentReference? _taskReference;
  DocumentReference? get taskReference => _taskReference;
  set taskReference(DocumentReference? value) {
    _taskReference = value;
  }

  List<String> _fotosDaTask = [];
  List<String> get fotosDaTask => _fotosDaTask;
  set fotosDaTask(List<String> value) {
    _fotosDaTask = value;
  }

  void addToFotosDaTask(String value) {
    fotosDaTask.add(value);
  }

  void removeFromFotosDaTask(String value) {
    fotosDaTask.remove(value);
  }

  void removeAtIndexFromFotosDaTask(int index) {
    fotosDaTask.removeAt(index);
  }

  void updateFotosDaTaskAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    fotosDaTask[index] = updateFn(_fotosDaTask[index]);
  }

  void insertAtIndexInFotosDaTask(int index, String value) {
    fotosDaTask.insert(index, value);
  }

  List<String> _fotoscreatetask = [];
  List<String> get fotoscreatetask => _fotoscreatetask;
  set fotoscreatetask(List<String> value) {
    _fotoscreatetask = value;
  }

  void addToFotoscreatetask(String value) {
    fotoscreatetask.add(value);
  }

  void removeFromFotoscreatetask(String value) {
    fotoscreatetask.remove(value);
  }

  void removeAtIndexFromFotoscreatetask(int index) {
    fotoscreatetask.removeAt(index);
  }

  void updateFotoscreatetaskAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    fotoscreatetask[index] = updateFn(_fotoscreatetask[index]);
  }

  void insertAtIndexInFotoscreatetask(int index, String value) {
    fotoscreatetask.insert(index, value);
  }

  String _filtercategory = 'All';
  String get filtercategory => _filtercategory;
  set filtercategory(String value) {
    _filtercategory = value;
  }

  NewcartaodecreditoStruct _creditcard = NewcartaodecreditoStruct();
  NewcartaodecreditoStruct get creditcard => _creditcard;
  set creditcard(NewcartaodecreditoStruct value) {
    _creditcard = value;
  }

  void updateCreditcardStruct(Function(NewcartaodecreditoStruct) updateFn) {
    updateFn(_creditcard);
  }

  double _distance = 30.0;
  double get distance => _distance;
  set distance(double value) {
    _distance = value;
    prefs.setDouble('ff_distance', value);
  }

  int _priceFilter = 0;
  int get priceFilter => _priceFilter;
  set priceFilter(int value) {
    _priceFilter = value;
    prefs.setInt('ff_priceFilter', value);
  }

  List<String> _hobbys = [];
  List<String> get hobbys => _hobbys;
  set hobbys(List<String> value) {
    _hobbys = value;
  }

  void addToHobbys(String value) {
    hobbys.add(value);
  }

  void removeFromHobbys(String value) {
    hobbys.remove(value);
  }

  void removeAtIndexFromHobbys(int index) {
    hobbys.removeAt(index);
  }

  void updateHobbysAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    hobbys[index] = updateFn(_hobbys[index]);
  }

  void insertAtIndexInHobbys(int index, String value) {
    hobbys.insert(index, value);
  }

  TasksAceitasStruct _tasksAceitadas = TasksAceitasStruct();
  TasksAceitasStruct get tasksAceitadas => _tasksAceitadas;
  set tasksAceitadas(TasksAceitasStruct value) {
    _tasksAceitadas = value;
  }

  void updateTasksAceitadasStruct(Function(TasksAceitasStruct) updateFn) {
    updateFn(_tasksAceitadas);
  }

  List<TasksAceitasStruct> _tasksAceitasList = [];
  List<TasksAceitasStruct> get tasksAceitasList => _tasksAceitasList;
  set tasksAceitasList(List<TasksAceitasStruct> value) {
    _tasksAceitasList = value;
  }

  void addToTasksAceitasList(TasksAceitasStruct value) {
    tasksAceitasList.add(value);
  }

  void removeFromTasksAceitasList(TasksAceitasStruct value) {
    tasksAceitasList.remove(value);
  }

  void removeAtIndexFromTasksAceitasList(int index) {
    tasksAceitasList.removeAt(index);
  }

  void updateTasksAceitasListAtIndex(
    int index,
    TasksAceitasStruct Function(TasksAceitasStruct) updateFn,
  ) {
    tasksAceitasList[index] = updateFn(_tasksAceitasList[index]);
  }

  void insertAtIndexInTasksAceitasList(int index, TasksAceitasStruct value) {
    tasksAceitasList.insert(index, value);
  }

  String _gesturex = '0';
  String get gesturex => _gesturex;
  set gesturex(String value) {
    _gesturex = value;
  }

  int _GestureInSwipeable = 0;
  int get GestureInSwipeable => _GestureInSwipeable;
  set GestureInSwipeable(int value) {
    _GestureInSwipeable = value;
  }

  double _localX = 0.0;
  double get localX => _localX;
  set localX(double value) {
    _localX = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
