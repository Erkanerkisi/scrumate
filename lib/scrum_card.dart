import 'package:flutter/material.dart';
import 'full_page_scrum_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:scrumate/settings_modal.dart';

class ScrumCard extends StatelessWidget {
  const ScrumCard({
    Key key,
    this.color = const Color(0xFF616161),
    @required this.numberText,
    this.image,
    this.child,
  }) : super(key: key);

  final Color color;
  final String numberText;
  final Widget child;
  final Image image;

  Widget _buildChild() {
    if (image != null) {
      return image;
    }
    return Text(
      numberText,
      style: TextStyle(fontFamily: 'Alatsi', fontSize: 30, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsModal>(builder: (context, settings, child) {
      return FlatButton(
        color: Colors.lightBlue[700],
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0),
            side: BorderSide(width: 2.0, color: Colors.white)),
        onPressed: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    FullPageScrumCard(
                        text: numberText, image: image, tapToReveal: settings.getTapToReveal(), shakeToReveal: settings.getShakeToReveal()),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        RotationTransition(
                  turns: Tween<double>(
                    begin: 0.0,
                    end: 1.0,
                  ).animate(
                    CurvedAnimation(
                        parent: animation, curve: Curves.linearToEaseOut),
                  ),
                  child: child,
                ),
              ));
        },
        child: _buildChild(),
      );
    });
  }
}
