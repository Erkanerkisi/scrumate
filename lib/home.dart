import 'package:flutter/material.dart';
import 'package:scrumate/settings_modal.dart';
import 'list_view.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsModal>(builder: (context, settings, child) {
      return MainListView(data: settings.getDataViaType(settings.getType()));
    });
  }
}
