import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardsRecord extends FirestoreRecord {
  CardsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cardsTexts" field.
  List<String>? _cardsTexts;
  List<String> get cardsTexts => _cardsTexts ?? const [];
  bool hasCardsTexts() => _cardsTexts != null;

  // "gameName" field.
  String? _gameName;
  String get gameName => _gameName ?? '';
  bool hasGameName() => _gameName != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  // "iconName" field.
  String? _iconName;
  String get iconName => _iconName ?? '';
  bool hasIconName() => _iconName != null;

  void _initializeFields() {
    _cardsTexts = getDataList(snapshotData['cardsTexts']);
    _gameName = snapshotData['gameName'] as String?;
    _image = snapshotData['image'] as String?;
    _color = getSchemaColor(snapshotData['color']);
    _iconName = snapshotData['iconName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cards');

  static Stream<CardsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CardsRecord.fromSnapshot(s));

  static Future<CardsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CardsRecord.fromSnapshot(s));

  static CardsRecord fromSnapshot(DocumentSnapshot snapshot) => CardsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CardsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CardsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CardsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CardsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCardsRecordData({
  String? gameName,
  String? image,
  Color? color,
  String? iconName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'gameName': gameName,
      'image': image,
      'color': color,
      'iconName': iconName,
    }.withoutNulls,
  );

  return firestoreData;
}

class CardsRecordDocumentEquality implements Equality<CardsRecord> {
  const CardsRecordDocumentEquality();

  @override
  bool equals(CardsRecord? e1, CardsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.cardsTexts, e2?.cardsTexts) &&
        e1?.gameName == e2?.gameName &&
        e1?.image == e2?.image &&
        e1?.color == e2?.color &&
        e1?.iconName == e2?.iconName;
  }

  @override
  int hash(CardsRecord? e) => const ListEquality()
      .hash([e?.cardsTexts, e?.gameName, e?.image, e?.color, e?.iconName]);

  @override
  bool isValidKey(Object? o) => o is CardsRecord;
}
