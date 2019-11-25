import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrumate/settings_modal.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsModal>(builder: (context, settings, child) {
      List<DropdownMenuItem<int>> getItems(String type) {
        if (type == 'T-Shirt') {
          return null;
        }
        return settings
            .getSelectionOfMaxValues(type)
            .map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList();
      }
      return Container(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.all(30.0),
          child: ListView(
            children: <Widget>[
              Center(
                child: new Text(
                  "Settings",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(height: 50.0),
              new Text(
                "Type",
                style: TextStyle(fontSize: 20),
              ),
              Divider(),
              ListTile(
                title: const Text('Fibonacci'),
                leading: Radio(
                  value: 'Fibonacci',
                  groupValue: settings.getType(),
                  onChanged: (String newValue) {
                    settings.changeType(newValue);
                  },
                ),
              ),
              ListTile(
                title: const Text('Standart'),
                leading: Radio(
                  value: 'Standart',
                  groupValue: settings.getType(),
                  onChanged: (String newValue) {
                    settings.changeType(newValue);
                  },
                ),
              ),
              ListTile(
                title: const Text('T-Shirt'),
                leading: Radio(
                  value: 'T-Shirt',
                  groupValue: settings.getType(),
                  onChanged: (String newValue) {
                    settings.changeType(newValue);
                  },
                ),
              ),
              Divider(),
              new Text(
                "Largest Number",
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
              ),
              Divider(),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: settings.getMaxValue(),
                  isDense: true,
                  onChanged: (int value) {
                    settings.changeMaxValue(value);
                  },
                  items: getItems(settings.getType()),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
              ),
              Divider(),
              new Text(
                "About",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      );
    });
  }
}
