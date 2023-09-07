// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlayerSelectionsStruct extends FFFirebaseStruct {
  PlayerSelectionsStruct({
    DateTime? timestamp,
    String? audioPath,
    DocumentReference? player,
    String? cardText,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _timestamp = timestamp,
        _audioPath = audioPath,
        _player = player,
        _cardText = cardText,
        super(firestoreUtilData);

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;
  bool hasTimestamp() => _timestamp != null;

  // "audioPath" field.
  String? _audioPath;
  String get audioPath => _audioPath ?? '';
  set audioPath(String? val) => _audioPath = val;
  bool hasAudioPath() => _audioPath != null;

  // "player" field.
  DocumentReference? _player;
  DocumentReference? get player => _player;
  set player(DocumentReference? val) => _player = val;
  bool hasPlayer() => _player != null;

  // "cardText" field.
  String? _cardText;
  String get cardText => _cardText ?? '';
  set cardText(String? val) => _cardText = val;
  bool hasCardText() => _cardText != null;

  static PlayerSelectionsStruct fromMap(Map<String, dynamic> data) =>
      PlayerSelectionsStruct(
        timestamp: data['timestamp'] as DateTime?,
        audioPath: data['audioPath'] as String?,
        player: data['player'] as DocumentReference?,
        cardText: data['cardText'] as String?,
      );

  static PlayerSelectionsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? PlayerSelectionsStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'timestamp': _timestamp,
        'audioPath': _audioPath,
        'player': _player,
        'cardText': _cardText,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'audioPath': serializeParam(
          _audioPath,
          ParamType.String,
        ),
        'player': serializeParam(
          _player,
          ParamType.DocumentReference,
        ),
        'cardText': serializeParam(
          _cardText,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlayerSelectionsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PlayerSelectionsStruct(
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        audioPath: deserializeParam(
          data['audioPath'],
          ParamType.String,
          false,
        ),
        player: deserializeParam(
          data['player'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['players'],
        ),
        cardText: deserializeParam(
          data['cardText'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlayerSelectionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlayerSelectionsStruct &&
        timestamp == other.timestamp &&
        audioPath == other.audioPath &&
        player == other.player &&
        cardText == other.cardText;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([timestamp, audioPath, player, cardText]);
}

PlayerSelectionsStruct createPlayerSelectionsStruct({
  DateTime? timestamp,
  String? audioPath,
  DocumentReference? player,
  String? cardText,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlayerSelectionsStruct(
      timestamp: timestamp,
      audioPath: audioPath,
      player: player,
      cardText: cardText,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlayerSelectionsStruct? updatePlayerSelectionsStruct(
  PlayerSelectionsStruct? playerSelections, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    playerSelections
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlayerSelectionsStructData(
  Map<String, dynamic> firestoreData,
  PlayerSelectionsStruct? playerSelections,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (playerSelections == null) {
    return;
  }
  if (playerSelections.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && playerSelections.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final playerSelectionsData =
      getPlayerSelectionsFirestoreData(playerSelections, forFieldValue);
  final nestedData =
      playerSelectionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = playerSelections.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlayerSelectionsFirestoreData(
  PlayerSelectionsStruct? playerSelections, [
  bool forFieldValue = false,
]) {
  if (playerSelections == null) {
    return {};
  }
  final firestoreData = mapToFirestore(playerSelections.toMap());

  // Add any Firestore field values
  playerSelections.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlayerSelectionsListFirestoreData(
  List<PlayerSelectionsStruct>? playerSelectionss,
) =>
    playerSelectionss
        ?.map((e) => getPlayerSelectionsFirestoreData(e, true))
        .toList() ??
    [];
