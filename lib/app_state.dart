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
      _frequency = prefs.getString('ff_frequency') ?? _frequency;
    });
    _safeInit(() {
      _duration = prefs.getString('ff_duration') ?? _duration;
    });
    _safeInit(() {
      _startDate = prefs.containsKey('ff_startDate')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_startDate')!)
          : _startDate;
    });
    _safeInit(() {
      _endDatae = prefs.containsKey('ff_endDatae')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_endDatae')!)
          : _endDatae;
    });
    _safeInit(() {
      _timeslot = prefs.containsKey('ff_timeslot')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_timeslot')!)
          : _timeslot;
    });
    _safeInit(() {
      _city = prefs.getString('ff_city') ?? _city;
    });
    _safeInit(() {
      _screens = prefs.getString('ff_screens') ?? _screens;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _frequency = '';
  String get frequency => _frequency;
  set frequency(String _value) {
    _frequency = _value;
    prefs.setString('ff_frequency', _value);
  }

  String _duration = '';
  String get duration => _duration;
  set duration(String _value) {
    _duration = _value;
    prefs.setString('ff_duration', _value);
  }

  String _finalAmount = '0';
  String get finalAmount => _finalAmount;
  set finalAmount(String _value) {
    _finalAmount = _value;
  }

  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? _value) {
    _startDate = _value;
    _value != null
        ? prefs.setInt('ff_startDate', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_startDate');
  }

  DateTime? _endDatae;
  DateTime? get endDatae => _endDatae;
  set endDatae(DateTime? _value) {
    _endDatae = _value;
    _value != null
        ? prefs.setInt('ff_endDatae', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_endDatae');
  }

  DateTime? _timeslot;
  DateTime? get timeslot => _timeslot;
  set timeslot(DateTime? _value) {
    _timeslot = _value;
    _value != null
        ? prefs.setInt('ff_timeslot', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_timeslot');
  }

  String _city = '';
  String get city => _city;
  set city(String _value) {
    _city = _value;
    prefs.setString('ff_city', _value);
  }

  String _screens = '';
  String get screens => _screens;
  set screens(String _value) {
    _screens = _value;
    prefs.setString('ff_screens', _value);
  }
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
