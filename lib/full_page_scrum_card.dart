import 'package:flutter/material.dart';

class FullPageScrumCard extends StatelessWidget {
  const FullPageScrumCard({Key key, @required this.text, this.image})
      : super(key: key);

  final String text;
  final Image image;

  Widget _buildChild() {
    if (image != null) {
      return image;
    }
    return Text(
      text,
      style:
          TextStyle(fontFamily: 'Alatsi', fontSize: 150, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[900],
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 150.0, horizontal: 60.0),
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0),
              side: BorderSide(width: 2.0, color: Colors.white)),
          color: Colors.lightBlue[700],
          onPressed: () {
            Navigator.pop(context);
          },
          child: _buildChild(),
        ),
      ),
    );
  }
}
