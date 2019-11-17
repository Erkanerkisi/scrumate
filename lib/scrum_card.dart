import 'package:flutter/material.dart';

class ScrumCard extends StatelessWidget {
  const ScrumCard({
    Key key,
    this.color = const Color(0xFF616161),
    @required this.numberText,
    this.child,
  }) : super(key: key);

  final Color color;
  final String numberText;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        margin: EdgeInsets.only(top: 2.0),
        color: color,
        child: OutlineButton(
          borderSide: BorderSide(width: 2.0, color: Colors.white),
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          highlightColor: Colors.grey,
          onPressed: () {
            print('pressed 1');
          },
          child: Text(
            numberText,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
