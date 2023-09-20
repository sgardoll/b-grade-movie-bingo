// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadPlayerAndMovieStruct extends FFFirebaseStruct {
  LeadPlayerAndMovieStruct({
    String? leadPlayerName,
    String? movieTitle,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _leadPlayerName = leadPlayerName,
        _movieTitle = movieTitle,
        super(firestoreUtilData);

  // "leadPlayerName" field.
  String? _leadPlayerName;
  String get leadPlayerName => _leadPlayerName ?? '';
  set leadPlayerName(String? val) => _leadPlayerName = val;
  bool hasLeadPlayerName() => _leadPlayerName != null;

  // "movieTitle" field.
  String? _movieTitle;
  String get movieTitle => _movieTitle ?? '';
  set movieTitle(String? val) => _movieTitle = val;
  bool hasMovieTitle() => _movieTitle != null;

  static LeadPlayerAndMovieStruct fromMap(Map<String, dynamic> data) =>
      LeadPlayerAndMovieStruct(
        leadPlayerName: data['leadPlayerName'] as String?,
        movieTitle: data['movieTitle'] as String?,
      );

  static LeadPlayerAndMovieStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? LeadPlayerAndMovieStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'leadPlayerName': _leadPlayerName,
        'movieTitle': _movieTitle,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'leadPlayerName': serializeParam(
          _leadPlayerName,
          ParamType.String,
        ),
        'movieTitle': serializeParam(
          _movieTitle,
          ParamType.String,
        ),
      }.withoutNulls;

  static LeadPlayerAndMovieStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LeadPlayerAndMovieStruct(
        leadPlayerName: deserializeParam(
          data['leadPlayerName'],
          ParamType.String,
          false,
        ),
        movieTitle: deserializeParam(
          data['movieTitle'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LeadPlayerAndMovieStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LeadPlayerAndMovieStruct &&
        leadPlayerName == other.leadPlayerName &&
        movieTitle == other.movieTitle;
  }

  @override
  int get hashCode => const ListEquality().hash([leadPlayerName, movieTitle]);
}

LeadPlayerAndMovieStruct createLeadPlayerAndMovieStruct({
  String? leadPlayerName,
  String? movieTitle,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeadPlayerAndMovieStruct(
      leadPlayerName: leadPlayerName,
      movieTitle: movieTitle,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeadPlayerAndMovieStruct? updateLeadPlayerAndMovieStruct(
  LeadPlayerAndMovieStruct? leadPlayerAndMovie, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    leadPlayerAndMovie
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeadPlayerAndMovieStructData(
  Map<String, dynamic> firestoreData,
  LeadPlayerAndMovieStruct? leadPlayerAndMovie,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (leadPlayerAndMovie == null) {
    return;
  }
  if (leadPlayerAndMovie.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && leadPlayerAndMovie.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leadPlayerAndMovieData =
      getLeadPlayerAndMovieFirestoreData(leadPlayerAndMovie, forFieldValue);
  final nestedData =
      leadPlayerAndMovieData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      leadPlayerAndMovie.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeadPlayerAndMovieFirestoreData(
  LeadPlayerAndMovieStruct? leadPlayerAndMovie, [
  bool forFieldValue = false,
]) {
  if (leadPlayerAndMovie == null) {
    return {};
  }
  final firestoreData = mapToFirestore(leadPlayerAndMovie.toMap());

  // Add any Firestore field values
  leadPlayerAndMovie.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeadPlayerAndMovieListFirestoreData(
  List<LeadPlayerAndMovieStruct>? leadPlayerAndMovies,
) =>
    leadPlayerAndMovies
        ?.map((e) => getLeadPlayerAndMovieFirestoreData(e, true))
        .toList() ??
    [];
