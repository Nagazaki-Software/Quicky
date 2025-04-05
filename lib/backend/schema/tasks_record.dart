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

  // "Localizacao" field.
  LatLng? _localizacao;
  LatLng? get localizacao => _localizacao;
  bool hasLocalizacao() => _localizacao != null;

  // "Modalidade" field.
  String? _modalidade;
  String get modalidade => _modalidade ?? '';
  bool hasModalidade() => _modalidade != null;

  // "MateriaisNecessarios" field.
  String? _materiaisNecessarios;
  String get materiaisNecessarios => _materiaisNecessarios ?? '';
  bool hasMateriaisNecessarios() => _materiaisNecessarios != null;

  // "InstrucoesEspeciais" field.
  String? _instrucoesEspeciais;
  String get instrucoesEspeciais => _instrucoesEspeciais ?? '';
  bool hasInstrucoesEspeciais() => _instrucoesEspeciais != null;

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

  // "NivelTrabalho" field.
  String? _nivelTrabalho;
  String get nivelTrabalho => _nivelTrabalho ?? '';
  bool hasNivelTrabalho() => _nivelTrabalho != null;

  // "PagamentoPrecos" field.
  double? _pagamentoPrecos;
  double get pagamentoPrecos => _pagamentoPrecos ?? 0.0;
  bool hasPagamentoPrecos() => _pagamentoPrecos != null;

  // "locationString" field.
  String? _locationString;
  String get locationString => _locationString ?? '';
  bool hasLocationString() => _locationString != null;

  // "duracaoEstimada" field.
  String? _duracaoEstimada;
  String get duracaoEstimada => _duracaoEstimada ?? '';
  bool hasDuracaoEstimada() => _duracaoEstimada != null;

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

  // "usuariosDisputandoPelaTask" field.
  List<DocumentReference>? _usuariosDisputandoPelaTask;
  List<DocumentReference> get usuariosDisputandoPelaTask =>
      _usuariosDisputandoPelaTask ?? const [];
  bool hasUsuariosDisputandoPelaTask() => _usuariosDisputandoPelaTask != null;

  void _initializeFields() {
    _foto = getDataList(snapshotData['Foto']);
    _titulo = snapshotData['Titulo'] as String?;
    _descricao = snapshotData['Descricao'] as String?;
    _categoria = snapshotData['Categoria'] as String?;
    _localizacao = snapshotData['Localizacao'] as LatLng?;
    _modalidade = snapshotData['Modalidade'] as String?;
    _materiaisNecessarios = snapshotData['MateriaisNecessarios'] as String?;
    _instrucoesEspeciais = snapshotData['InstrucoesEspeciais'] as String?;
    _userReference = snapshotData['userReference'] as DocumentReference?;
    _tempo = snapshotData['Tempo'] as DateTime?;
    _data = snapshotData['Data'] as DateTime?;
    _nivelTrabalho = snapshotData['NivelTrabalho'] as String?;
    _pagamentoPrecos = castToType<double>(snapshotData['PagamentoPrecos']);
    _locationString = snapshotData['locationString'] as String?;
    _duracaoEstimada = snapshotData['duracaoEstimada'] as String?;
    _aceito = snapshotData['aceito'] as bool?;
    _idDaTask = snapshotData['idDaTask'] as String?;
    _status = snapshotData['status'] as String?;
    _taxa = snapshotData['taxa'] as String?;
    _valorTotal = snapshotData['valorTotal'] as String?;
    _priority = snapshotData['priority'] as String?;
    _valor = snapshotData['valor'] as String?;
    _valorDeUrgencia = snapshotData['valorDeUrgencia'] as String?;
    _usuariosDisputandoPelaTask =
        getDataList(snapshotData['usuariosDisputandoPelaTask']);
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
  LatLng? localizacao,
  String? modalidade,
  String? materiaisNecessarios,
  String? instrucoesEspeciais,
  DocumentReference? userReference,
  DateTime? tempo,
  DateTime? data,
  String? nivelTrabalho,
  double? pagamentoPrecos,
  String? locationString,
  String? duracaoEstimada,
  bool? aceito,
  String? idDaTask,
  String? status,
  String? taxa,
  String? valorTotal,
  String? priority,
  String? valor,
  String? valorDeUrgencia,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Titulo': titulo,
      'Descricao': descricao,
      'Categoria': categoria,
      'Localizacao': localizacao,
      'Modalidade': modalidade,
      'MateriaisNecessarios': materiaisNecessarios,
      'InstrucoesEspeciais': instrucoesEspeciais,
      'userReference': userReference,
      'Tempo': tempo,
      'Data': data,
      'NivelTrabalho': nivelTrabalho,
      'PagamentoPrecos': pagamentoPrecos,
      'locationString': locationString,
      'duracaoEstimada': duracaoEstimada,
      'aceito': aceito,
      'idDaTask': idDaTask,
      'status': status,
      'taxa': taxa,
      'valorTotal': valorTotal,
      'priority': priority,
      'valor': valor,
      'valorDeUrgencia': valorDeUrgencia,
    }.withoutNulls,
  );

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
        e1?.localizacao == e2?.localizacao &&
        e1?.modalidade == e2?.modalidade &&
        e1?.materiaisNecessarios == e2?.materiaisNecessarios &&
        e1?.instrucoesEspeciais == e2?.instrucoesEspeciais &&
        e1?.userReference == e2?.userReference &&
        e1?.tempo == e2?.tempo &&
        e1?.data == e2?.data &&
        e1?.nivelTrabalho == e2?.nivelTrabalho &&
        e1?.pagamentoPrecos == e2?.pagamentoPrecos &&
        e1?.locationString == e2?.locationString &&
        e1?.duracaoEstimada == e2?.duracaoEstimada &&
        e1?.aceito == e2?.aceito &&
        e1?.idDaTask == e2?.idDaTask &&
        e1?.status == e2?.status &&
        e1?.taxa == e2?.taxa &&
        e1?.valorTotal == e2?.valorTotal &&
        e1?.priority == e2?.priority &&
        e1?.valor == e2?.valor &&
        e1?.valorDeUrgencia == e2?.valorDeUrgencia &&
        listEquality.equals(
            e1?.usuariosDisputandoPelaTask, e2?.usuariosDisputandoPelaTask);
  }

  @override
  int hash(TasksRecord? e) => const ListEquality().hash([
        e?.foto,
        e?.titulo,
        e?.descricao,
        e?.categoria,
        e?.localizacao,
        e?.modalidade,
        e?.materiaisNecessarios,
        e?.instrucoesEspeciais,
        e?.userReference,
        e?.tempo,
        e?.data,
        e?.nivelTrabalho,
        e?.pagamentoPrecos,
        e?.locationString,
        e?.duracaoEstimada,
        e?.aceito,
        e?.idDaTask,
        e?.status,
        e?.taxa,
        e?.valorTotal,
        e?.priority,
        e?.valor,
        e?.valorDeUrgencia,
        e?.usuariosDisputandoPelaTask
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}
