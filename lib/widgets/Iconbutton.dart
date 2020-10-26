import 'package:flutter/material.dart';

class IconNotification extends StatelessWidget {
  IconNotification(
      {@required this.icon, this.badgeColor = Colors.white, this.badgeText});

  final Color badgeColor;
  final IconData icon;
  final String badgeText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Stack(
        children: <Widget>[
          Icon(
            icon,
            size: 30.0,
            color: Colors.white,
          ),
          Positioned(
            top: 2.0,
            right: 4.0,
            child: Container(
              padding: EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                color: badgeColor,
                shape: BoxShape.circle,
              ),
              constraints: BoxConstraints(minWidth: 18.0, minHeight: 18.0),
              child: Center(
                child: Text(
                  badgeText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
