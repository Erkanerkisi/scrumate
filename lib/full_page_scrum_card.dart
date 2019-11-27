import 'package:flutter/material.dart';
import 'package:shake/shake.dart';


class FullPageScrumCard extends StatefulWidget {
  const FullPageScrumCard(
      {Key key, @required this.text, this.image, this.tapToReveal,this.shakeToReveal})
      : super(key: key);

  final String text;
  final Image image;
  final bool tapToReveal;
  final bool shakeToReveal;

  @override
  _FullPageScrumCardState createState() => _FullPageScrumCardState();
}

class _FullPageScrumCardState extends State<FullPageScrumCard> {

  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      if (isReady && widget.shakeToReveal) {
              setState(() {
                isReady = true;
              });
            }
    });
    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }

  final String READY = 'Ready';
  final double READY_FONT = 80.0;
  final double TEXT_FONT = 120.0;

  bool isReady = false;
  Widget _buildChild() {
    Widget returnWidget;
    if (widget.tapToReveal && !isReady) {
      isReady = true;
      returnWidget = Text(
        READY,
        style: TextStyle(
            fontFamily: 'Alatsi', fontSize: READY_FONT, color: Colors.white),
      );
    } else {
      isReady = false;
      returnWidget = Text(
        widget.text,
        style: TextStyle(
            fontFamily: 'Alatsi', fontSize: TEXT_FONT, color: Colors.white),
      );
    }
    if (widget.image != null) {
      return widget.image;
    }
    return returnWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[900],
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 150.0, horizontal: 45.0),
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0),
              side: BorderSide(width: 2.0, color: Colors.white)),
          color: Colors.lightBlue[700],
          onPressed: () {
            if (isReady) {
              setState(() {
                isReady = true;
              });
            } else {
              Navigator.pop(context);
            }
          },
          child: _buildChild(),
        ),
      ),
    );
  }
}
