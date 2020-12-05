import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/widgets/GenderWidget.dart';
import 'utils.dart';
import 'result_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { Female, Male }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 30,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GenderWidget(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.Male;
                        });
                      },
                      color: selectedGender == Gender.Male
                          ? kActiveColor
                          : kInactiveColor,
                      icon: Icon(
                        FontAwesomeIcons.mars,
                        size: 80.0,
                      ),
                      text: 'MALE',
                    ),
                  ),
                  Expanded(
                    child: GenderWidget(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.Female;
                        });
                      },
                      color: selectedGender == Gender.Female
                          ? kActiveColor
                          : kInactiveColor,
                      icon: Icon(
                        FontAwesomeIcons.venus,
                        size: 80.0,
                      ),
                      text: 'FEMALE',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 30,
              child: BackgroundCard(
                color: kActiveColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kTextStyleWidgetTextLowWeight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kTextStyleWidgetText,
                        ),
                        Text(
                          'cm',
                          style: kTextStyleWidgetTextLowWeight,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        inactiveTrackColor: Color(0xFF8D8E98),
                      ),
                      child: Slider(
                        min: 120.0,
                        max: 220.0,
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 30,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: BackgroundCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kTextStyleWidgetTextLowWeight,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                weight.toString(),
                                style: kTextStyleWidgetText,
                              ),
                              Text(
                                'kg',
                                style: kTextStyleWidgetTextLowWeight,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundButtonIcon(
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundButtonIcon(
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                            ],
                          ),
                        ],
                      ),
                      color: kActiveColor,
                    ),
                  ),
                  Expanded(
                    child: BackgroundCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kTextStyleWidgetTextLowWeight,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            age.toString(),
                            style: kTextStyleWidgetText,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundButtonIcon(
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundButtonIcon(
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                            ],
                          ),
                        ],
                      ),
                      color: kActiveColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: GestureDetector(
                onTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(weight: weight, height: height);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                bmi: calc.calculateBMI(),
                                result: calc.getResult(),
                                interpretation: calc.getInterpretation(),
                              )));
                },
                child: Container(
                  child: Center(
                      child: Text(
                    'CALCULATE',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1),
                  )),
                  color: Color(0xFFEB1555),
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundButtonIcon extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  RoundButtonIcon({@required this.icon, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
