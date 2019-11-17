import 'package:flutter/material.dart';
import 'scrum_card.dart';

class MainListView extends StatelessWidget {
  const MainListView({Key key, @required this.data}) : super(key: key);

  final List data;

  List<Widget> getElementList() {
    final children = <Widget>[];
    for (var i = 0; i < data.length; i++) {
      children.add(ScrumCard(numberText: data.elementAt(i).toString()));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 15,
      mainAxisSpacing: 20,
      crossAxisCount: 3,
      children: getElementList()
    );
  }
}
