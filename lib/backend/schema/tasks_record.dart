import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Foto" field.
  List<String>? _foto;
  List<String> get foto => _foto ?? const [];
  bool hasFoto() => _foto != null;

  // "Titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "Descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "MateriaisNecessarios" field.
  String? _materiaisNecessarios;
  String get materiaisNecessarios => _materiaisNecessarios ?? '';
  bool hasMateriaisNecessarios() => _materiaisNecessarios != null;

  // "userReference" field.
  DocumentReference? _userReference;
  DocumentReference? get userReference => _userReference;
  bool hasUserReference() => _userReference != null;

  // "Tempo" field.
  DateTime? _tempo;
  DateTime? get tempo => _tempo;
  bool hasTempo() => _tempo != null;

  // "Data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "PagamentoPrecos" field.
  double? _pagamentoPrecos;
  double get pagamentoPrecos => _pagamentoPrecos ?? 0.0;
  bool hasPagamentoPrecos() => _pagamentoPrecos != null;

  // "aceito" field.
  bool? _aceito;
  bool get aceito => _aceito ?? false;
  bool hasAceito() => _aceito != null;

  // "idDaTask" field.
  String? _idDaTask;
  String get idDaTask => _idDaTask ?? '';
  bool hasIdDaTask() => _idDaTask != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "taxa" field.
  String? _taxa;
  String get taxa => _taxa ?? '';
  bool hasTaxa() => _taxa != null;

  // "valorTotal" field.
  String? _valorTotal;
  String get valorTotal => _valorTotal ?? '';
  bool hasValorTotal() => _valorTotal != null;

  // "priority" field.
  String? _priority;
  String get priority => _priority ?? '';
  bool hasPriority() => _priority != null;

  // "valor" field.
  String? _valor;
  String get valor => _valor ?? '';
  bool hasValor() => _valor != null;

  // "valorDeUrgencia" field.
  String? _valorDeUrgencia;
  String get valorDeUrgencia => _valorDeUrgencia ?? '';
  bool hasValorDeUrgencia() => _valorDeUrgencia != null;

  // "acceptRenegociate" field.
  bool? _acceptRenegociate;
  bool get acceptRenegociate => _acceptRenegociate ?? false;
  bool hasAcceptRenegociate() => _acceptRenegociate != null;

  // "usuariosDisputandoPelaTask" field.
  List<DocumentReference>? _usuariosDisputandoPelaTask;
  List<DocumentReference> get usuariosDisputandoPelaTask =>
      _usuariosDisputandoPelaTask ?? const [];
  bool hasUsuariosDisputandoPelaTask() => _usuariosDisputandoPelaTask != null;

  // "usuarioQueAceitouaTask" field.
  DocumentReference? _usuarioQueAceitouaTask;
  DocumentReference? get usuarioQueAceitouaTask => _usuarioQueAceitouaTask;
  bool hasUsuarioQueAceitouaTask() => _usuarioQueAceitouaTask != null;

  // "FornecedorDosMateriais" field.
  String? _fornecedorDosMateriais;
  String get fornecedorDosMateriais => _fornecedorDosMateriais ?? '';
  bool hasFornecedorDosMateriais() => _fornecedorDosMateriais != null;

  // "localizacao" field.
  EnderecoTasksStruct? _localizacao;
  EnderecoTasksStruct get localizacao => _localizacao ?? EnderecoTasksStruct();
  bool hasLocalizacao() => _localizacao != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "fastpass" field.
  String? _fastpass;
  String get fastpass => _fastpass ?? '';
  bool hasFastpass() => _fastpass != null;

  // "taskPrePronta" field.
  DocumentReference? _taskPrePronta;
  DocumentReference? get taskPrePronta => _taskPrePronta;
  bool hasTaskPrePronta() => _taskPrePronta != null;

  void _initializeFields() {
    _foto = getDataList(snapshotData['Foto']);
    _titulo = snapshotData['Titulo'] as String?;
    _descricao = snapshotData['Descricao'] as String?;
    _categoria = snapshotData['Categoria'] as String?;
    _materiaisNecessarios = snapshotData['MateriaisNecessarios'] as String?;
    _userReference = snapshotData['userReference'] as DocumentReference?;
    _tempo = snapshotData['Tempo'] as DateTime?;
    _data = snapshotData['Data'] as DateTime?;
    _pagamentoPrecos = castToType<double>(snapshotData['PagamentoPrecos']);
    _aceito = snapshotData['aceito'] as bool?;
    _idDaTask = snapshotData['idDaTask'] as String?;
    _status = snapshotData['status'] as String?;
    _taxa = snapshotData['taxa'] as String?;
    _valorTotal = snapshotData['valorTotal'] as String?;
    _priority = snapshotData['priority'] as String?;
    _valor = snapshotData['valor'] as String?;
    _valorDeUrgencia = snapshotData['valorDeUrgencia'] as String?;
    _acceptRenegociate = snapshotData['acceptRenegociate'] as bool?;
    _usuariosDisputandoPelaTask =
        getDataList(snapshotData['usuariosDisputandoPelaTask']);
    _usuarioQueAceitouaTask =
        snapshotData['usuarioQueAceitouaTask'] as DocumentReference?;
    _fornecedorDosMateriais = snapshotData['FornecedorDosMateriais'] as String?;
    _localizacao = snapshotData['localizacao'] is EnderecoTasksStruct
        ? snapshotData['localizacao']
        : EnderecoTasksStruct.maybeFromMap(snapshotData['localizacao']);
    _location = snapshotData['location'] as LatLng?;
    _fastpass = snapshotData['fastpass'] as String?;
    _taskPrePronta = snapshotData['taskPrePronta'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
  String? titulo,
  String? descricao,
  String? categoria,
  String? materiaisNecessarios,
  DocumentReference? userReference,
  DateTime? tempo,
  DateTime? data,
  double? pagamentoPrecos,
  bool? aceito,
  String? idDaTask,
  String? status,
  String? taxa,
  String? valorTotal,
  String? priority,
  String? valor,
  String? valorDeUrgencia,
  bool? acceptRenegociate,
  DocumentReference? usuarioQueAceitouaTask,
  String? fornecedorDosMateriais,
  EnderecoTasksStruct? localizacao,
  LatLng? location,
  String? fastpass,
  DocumentReference? taskPrePronta,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Titulo': titulo,
      'Descricao': descricao,
      'Categoria': categoria,
      'MateriaisNecessarios': materiaisNecessarios,
      'userReference': userReference,
      'Tempo': tempo,
      'Data': data,
      'PagamentoPrecos': pagamentoPrecos,
      'aceito': aceito,
      'idDaTask': idDaTask,
      'status': status,
      'taxa': taxa,
      'valorTotal': valorTotal,
      'priority': priority,
      'valor': valor,
      'valorDeUrgencia': valorDeUrgencia,
      'acceptRenegociate': acceptRenegociate,
      'usuarioQueAceitouaTask': usuarioQueAceitouaTask,
      'FornecedorDosMateriais': fornecedorDosMateriais,
      'localizacao': EnderecoTasksStruct().toMap(),
      'location': location,
      'fastpass': fastpass,
      'taskPrePronta': taskPrePronta,
    }.withoutNulls,
  );

  // Handle nested data for "localizacao" field.
  addEnderecoTasksStructData(firestoreData, localizacao, 'localizacao');

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.foto, e2?.foto) &&
        e1?.titulo == e2?.titulo &&
        e1?.descricao == e2?.descricao &&
        e1?.categoria == e2?.categoria &&
        e1?.materiaisNecessarios == e2?.materiaisNecessarios &&
        e1?.userReference == e2?.userReference &&
        e1?.tempo == e2?.tempo &&
        e1?.data == e2?.data &&
        e1?.pagamentoPrecos == e2?.pagamentoPrecos &&
        e1?.aceito == e2?.aceito &&
        e1?.idDaTask == e2?.idDaTask &&
        e1?.status == e2?.status &&
        e1?.taxa == e2?.taxa &&
        e1?.valorTotal == e2?.valorTotal &&
        e1?.priority == e2?.priority &&
        e1?.valor == e2?.valor &&
        e1?.valorDeUrgencia == e2?.valorDeUrgencia &&
        e1?.acceptRenegociate == e2?.acceptRenegociate &&
        listEquality.equals(
            e1?.usuariosDisputandoPelaTask, e2?.usuariosDisputandoPelaTask) &&
        e1?.usuarioQueAceitouaTask == e2?.usuarioQueAceitouaTask &&
        e1?.fornecedorDosMateriais == e2?.fornecedorDosMateriais &&
        e1?.localizacao == e2?.localizacao &&
        e1?.location == e2?.location &&
        e1?.fastpass == e2?.fastpass &&
        e1?.taskPrePronta == e2?.taskPrePronta;
  }

  @override
  int hash(TasksRecord? e) => const ListEquality().hash([
        e?.foto,
        e?.titulo,
        e?.descricao,
        e?.categoria,
        e?.materiaisNecessarios,
        e?.userReference,
        e?.tempo,
        e?.data,
        e?.pagamentoPrecos,
        e?.aceito,
        e?.idDaTask,
        e?.status,
        e?.taxa,
        e?.valorTotal,
        e?.priority,
        e?.valor,
        e?.valorDeUrgencia,
        e?.acceptRenegociate,
        e?.usuariosDisputandoPelaTask,
        e?.usuarioQueAceitouaTask,
        e?.fornecedorDosMateriais,
        e?.localizacao,
        e?.location,
        e?.fastpass,
        e?.taskPrePronta
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}
