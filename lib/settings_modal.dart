import 'package:flutter/material.dart';

class SettingsModal extends ChangeNotifier {
  String _type = 'Fibonacci';
  List data = ['1','2','3','5','8','13','21','34','55','89','144','233'];

  final List<String> _types = ["Fibonacci","Tırt Sayılar"];

  Map<String,List<String>> map ={
    "Fibonacci" : ['1','2','3','5','8','13','21','34','55','89','144','233'],
    "Tırt Sayılar" : ['1','2','3','4','5','6','7','8','9','10']
  };


  List<String> getDataViaType(String type) =>map[type];

  String getType() => _type;
  
  List<String> getTypes() => _types;

  void changeType(String type) {
    _type = type;
    notifyListeners();
  }
}