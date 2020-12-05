import 'package:bmi_calculator/pages/utils.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String result, interpretation, bmi;

  ResultPage(
      {@required this.result,
      @required this.bmi,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: kTextStyleWidgetTextLowWeight,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10.0),
        child: Column(
          children: <Widget>[
            Text('Result:$result'),
            Text('Bmi:$bmi'),
            Text('Interpretation:$interpretation')
          ],
        ),
      ),
    );
  }
}
