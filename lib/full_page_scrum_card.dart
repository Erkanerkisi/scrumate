import 'package:flutter/material.dart';

class FullPageScrumCard extends StatelessWidget {
  const FullPageScrumCard({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 200.0,horizontal: 50.0),
        child: RaisedButton(
          color: Colors.blueAccent,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(text,style: TextStyle(
              fontSize: 100
            ),)),
      ),
    );
  }
}
