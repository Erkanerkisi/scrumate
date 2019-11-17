import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrumate/settings_modal.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsModal>(builder: (context, settings, child) {
      return Container(
        margin: EdgeInsets.all(30.0),
        child: ListView(
          children: <Widget>[
            InputDecorator(
              decoration: InputDecoration(
                icon: const Icon(Icons.format_list_numbered),
                labelText: 'Type',
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: settings.getType(),
                  isDense: true,
                  onChanged: (String newValue) {
                    settings.changeType(newValue);
                  },
                  items: settings
                      .getCardTypes()
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            InputDecorator(
              decoration: InputDecoration(
                icon: const Icon(Icons.info),
                labelText: 'Largest Number',
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: settings.getMaxValue(),
                  isDense: true,
                  onChanged: (int value) {
                    settings.changeMaxValue(value);
                  },
                  items: settings
                      .getSelectionOfMaxValues(settings.getType())
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
