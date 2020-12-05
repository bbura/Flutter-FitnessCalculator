import 'package:bmi_calculator/pages/utils.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  final Icon icon;
  final String text;
  final Color color;
  final Function onPress;

  GenderWidget(
      {@required this.icon,
      @required this.text,
      @required this.color,
      @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return BackgroundCard(
      onPress: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon,
          SizedBox(
            height: 15.0,
          ),
          Text(
            text,
            style: kTextStyleWidgetTextLowWeight,
          ),
        ],
      ),
      color: color,
    );
  }
}

class BackgroundCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onPress;

  BackgroundCard({@required this.color, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
      ),
    );
  }
}
