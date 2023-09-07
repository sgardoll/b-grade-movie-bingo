import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BeingPlayedRecord extends FirestoreRecord {
  BeingPlayedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "timeStarted" field.
  DateTime? _timeStarted;
  DateTime? get timeStarted => _timeStarted;
  bool hasTimeStarted() => _timeStarted != null;

  // "players" field.
  List<DocumentReference>? _players;
  List<DocumentReference> get players => _players ?? const [];
  bool hasPlayers() => _players != null;

  // "playerSelections" field.
  List<PlayerSelectionsStruct>? _playerSelections;
  List<PlayerSelectionsStruct> get playerSelections =>
      _playerSelections ?? const [];
  bool hasPlayerSelections() => _playerSelections != null;

  // "joinCode" field.
  String? _joinCode;
  String get joinCode => _joinCode ?? '';
  bool hasJoinCode() => _joinCode != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "leadPlayer" field.
  DocumentReference? _leadPlayer;
  DocumentReference? get leadPlayer => _leadPlayer;
  bool hasLeadPlayer() => _leadPlayer != null;

  // "cards" field.
  DocumentReference? _cards;
  DocumentReference? get cards => _cards;
  bool hasCards() => _cards != null;

  void _initializeFields() {
    _timeStarted = snapshotData['timeStarted'] as DateTime?;
    _players = getDataList(snapshotData['players']);
    _playerSelections = getStructList(
      snapshotData['playerSelections'],
      PlayerSelectionsStruct.fromMap,
    );
    _joinCode = snapshotData['joinCode'] as String?;
    _status = snapshotData['status'] as String?;
    _leadPlayer = snapshotData['leadPlayer'] as DocumentReference?;
    _cards = snapshotData['cards'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('beingPlayed');

  static Stream<BeingPlayedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BeingPlayedRecord.fromSnapshot(s));

  static Future<BeingPlayedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BeingPlayedRecord.fromSnapshot(s));

  static BeingPlayedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BeingPlayedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BeingPlayedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BeingPlayedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BeingPlayedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BeingPlayedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBeingPlayedRecordData({
  DateTime? timeStarted,
  String? joinCode,
  String? status,
  DocumentReference? leadPlayer,
  DocumentReference? cards,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timeStarted': timeStarted,
      'joinCode': joinCode,
      'status': status,
      'leadPlayer': leadPlayer,
      'cards': cards,
    }.withoutNulls,
  );

  return firestoreData;
}

class BeingPlayedRecordDocumentEquality implements Equality<BeingPlayedRecord> {
  const BeingPlayedRecordDocumentEquality();

  @override
  bool equals(BeingPlayedRecord? e1, BeingPlayedRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timeStarted == e2?.timeStarted &&
        listEquality.equals(e1?.players, e2?.players) &&
        listEquality.equals(e1?.playerSelections, e2?.playerSelections) &&
        e1?.joinCode == e2?.joinCode &&
        e1?.status == e2?.status &&
        e1?.leadPlayer == e2?.leadPlayer &&
        e1?.cards == e2?.cards;
  }

  @override
  int hash(BeingPlayedRecord? e) => const ListEquality().hash([
        e?.timeStarted,
        e?.players,
        e?.playerSelections,
        e?.joinCode,
        e?.status,
        e?.leadPlayer,
        e?.cards
      ]);

  @override
  bool isValidKey(Object? o) => o is BeingPlayedRecord;
}
