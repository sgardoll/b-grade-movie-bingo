import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _playerRef = prefs.getString('ff_playerRef')?.ref ?? _playerRef;
    });
    _safeInit(() {
      _playerInitial = prefs.getString('ff_playerInitial') ?? _playerInitial;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _playerRef;
  DocumentReference? get playerRef => _playerRef;
  set playerRef(DocumentReference? _value) {
    _playerRef = _value;
    _value != null
        ? prefs.setString('ff_playerRef', _value.path)
        : prefs.remove('ff_playerRef');
  }

  String _playerInitial = '?';
  String get playerInitial => _playerInitial;
  set playerInitial(String _value) {
    _playerInitial = _value;
    prefs.setString('ff_playerInitial', _value);
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
