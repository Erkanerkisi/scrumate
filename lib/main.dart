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
          appBar: AppBar(
            title: Text("Scrumate"),
            centerTitle: true,
            bottom: TabBar(
              tabs: <Widget>[
                Icon(
                  Icons.home,
                  color: Colors.indigo,
                  size: 40.0,
                ),
                Icon(
                  Icons.settings,
                  color: Colors.indigo,
                  size: 40.0,
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[Home(), Settings()],
          )),
    ));
  }
}
