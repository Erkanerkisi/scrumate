import 'package:flutter/material.dart';
import 'package:scrumate/settings.dart';
import 'package:scrumate/settings_modal.dart';
import 'package:provider/provider.dart';
import 'home.dart';

void main() => runApp(ChangeNotifierProvider(
    builder: (context) => SettingsModal(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.indigo[900],
          body: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TabBarView(
              children: <Widget>[Home(), Settings()],
            ),
          )),
    ));
  }
}
