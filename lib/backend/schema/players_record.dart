import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlayersRecord extends FirestoreRecord {
  PlayersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "playerName" field.
  String? _playerName;
  String get playerName => _playerName ?? '';
  bool hasPlayerName() => _playerName != null;

  // "beingPlayedRef" field.
  DocumentReference? _beingPlayedRef;
  DocumentReference? get beingPlayedRef => _beingPlayedRef;
  bool hasBeingPlayedRef() => _beingPlayedRef != null;

  void _initializeFields() {
    _playerName = snapshotData['playerName'] as String?;
    _beingPlayedRef = snapshotData['beingPlayedRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('players');

  static Stream<PlayersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlayersRecord.fromSnapshot(s));

  static Future<PlayersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlayersRecord.fromSnapshot(s));

  static PlayersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlayersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlayersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlayersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlayersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlayersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlayersRecordData({
  String? playerName,
  DocumentReference? beingPlayedRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'playerName': playerName,
      'beingPlayedRef': beingPlayedRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlayersRecordDocumentEquality implements Equality<PlayersRecord> {
  const PlayersRecordDocumentEquality();

  @override
  bool equals(PlayersRecord? e1, PlayersRecord? e2) {
    return e1?.playerName == e2?.playerName &&
        e1?.beingPlayedRef == e2?.beingPlayedRef;
  }

  @override
  int hash(PlayersRecord? e) =>
      const ListEquality().hash([e?.playerName, e?.beingPlayedRef]);

  @override
  bool isValidKey(Object? o) => o is PlayersRecord;
}
