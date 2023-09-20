import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _playerRef =
          (await secureStorage.getString('ff_playerRef'))?.ref ?? _playerRef;
    });
    await _safeInitAsync(() async {
      _playerInitial =
          await secureStorage.getString('ff_playerInitial') ?? _playerInitial;
    });
    await _safeInitAsync(() async {
      _tmdbApiKey =
          await secureStorage.getString('ff_tmdbApiKey') ?? _tmdbApiKey;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  DocumentReference? _playerRef;
  DocumentReference? get playerRef => _playerRef;
  set playerRef(DocumentReference? _value) {
    _playerRef = _value;
    _value != null
        ? secureStorage.setString('ff_playerRef', _value.path)
        : secureStorage.remove('ff_playerRef');
  }

  void deletePlayerRef() {
    secureStorage.delete(key: 'ff_playerRef');
  }

  String _playerInitial = '?';
  String get playerInitial => _playerInitial;
  set playerInitial(String _value) {
    _playerInitial = _value;
    secureStorage.setString('ff_playerInitial', _value);
  }

  void deletePlayerInitial() {
    secureStorage.delete(key: 'ff_playerInitial');
  }

  DocumentReference? _gameSelected;
  DocumentReference? get gameSelected => _gameSelected;
  set gameSelected(DocumentReference? _value) {
    _gameSelected = _value;
  }

  bool _gameIsSelected = false;
  bool get gameIsSelected => _gameIsSelected;
  set gameIsSelected(bool _value) {
    _gameIsSelected = _value;
  }

  String _tmdbApiKey = '15d2ea6d0dc1d476efbca3eba2b9bbfb';
  String get tmdbApiKey => _tmdbApiKey;
  set tmdbApiKey(String _value) {
    _tmdbApiKey = _value;
    secureStorage.setString('ff_tmdbApiKey', _value);
  }

  void deleteTmdbApiKey() {
    secureStorage.delete(key: 'ff_tmdbApiKey');
  }

  String _movieBeingWatched = '';
  String get movieBeingWatched => _movieBeingWatched;
  set movieBeingWatched(String _value) {
    _movieBeingWatched = _value;
  }

  Color _gameColor = Color(4289665855);
  Color get gameColor => _gameColor;
  set gameColor(Color _value) {
    _gameColor = _value;
  }

  final _cardsQueryManager = FutureRequestManager<List<CardsRecord>>();
  Future<List<CardsRecord>> cardsQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CardsRecord>> Function() requestFn,
  }) =>
      _cardsQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCardsQueryCache() => _cardsQueryManager.clear();
  void clearCardsQueryCacheKey(String? uniqueKey) =>
      _cardsQueryManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
