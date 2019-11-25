import 'package:flutter/material.dart';

class SettingsModal extends ChangeNotifier {
  // initial type and max value
  String _type = 'Fibonacci';
  int _maxValue = 144;

  //Card Types All List
  Map<String,List<String>> _map ={
    "Fibonacci"    : ['1','2','3','5','8','13','21','34','55','89','144','233','377','610','987'],
    "Standart" : ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15'],
    "T-Shirt" : ['XS','S','M','L','XL','XXL','XXXL'],
  };
  //Default max values
   Map<String,int> _defaultMaxValues ={
    "Fibonacci"    : 144,
    "Standart"      : 10
  };
  //Get List with given type and max Value
  List<String> getDataViaType(String type) {
    if(type == 'T-Shirt'){
      return _map[type];
    }
    List<String> list = _map[type].map((k)=> int.parse(k)).toList().where((a) => a <= getMaxValue()).toList().map((f)=> f.toString()).toList();
    return list;
  }
  //
  List<int> getSelectionOfMaxValues(String type) =>_map[type].map((f)=> int.parse(f)).toList();
  //Get all types
  List<String> getCardTypes () => _map.keys.toList();

  String getType() => _type;
  int getMaxValue() => _maxValue;

  void changeType(String type) {
    _type = type;
    if(type != 'T-Shirt'){
    _maxValue = _defaultMaxValues[type];
    }
    notifyListeners();
  }
  void changeMaxValue(int maxValue) {
    _maxValue = maxValue;
    notifyListeners();
  }
}