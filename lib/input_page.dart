import 'dart:ui';
import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'calculator_brain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Color malecardcolour;
Color femalecardcolour;

enum Gender {
  male,
  female,
}
int height = 180;
Gender selectgender;
int weight = 50;
int age = 25;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI Calculator')),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectgender = Gender.male;
                        });
                      },
                      child: BasicContainer(
                        colour: selectgender == Gender.male
                            ? activecolour
                            : inactivecolour,
                        childCard: Returncolumn(
                            icone: FontAwesomeIcons.mars, txt: 'MALE'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectgender = Gender.female;
                        });
                      },
                      child: BasicContainer(
                        colour: selectgender == Gender.female
                            ? activecolour
                            : inactivecolour,
                        childCard: Returncolumn(
                            icone: FontAwesomeIcons.venus, txt: 'FEMALE'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BasicContainer(
                colour: Color(0xFF1E1B31),
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                          fontSize: 18, color: Colors.deepPurple[100]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: textstyle,
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                              fontSize: 18, color: Colors.deepPurple[100]),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTickMarkColor: Color(0xFF8D8E98),
                        thumbColor: Colors.red,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        activeColor: Color(0xFFF83058),
                        inactiveColor: Colors.blueGrey[700],
                        onChanged: (double getVal) {
                          setState(() {
                            height = getVal.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: BasicContainer(
                      colour: Color(0xFF1E1B31),
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Text(
                                weight.toString(),
                                style: TextStyle(fontSize: 45),
                              ),
                              Text(
                                'kg',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight = --weight;
                                  });
                                },
                              ),
                              SizedBox(width: 10),
                              RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight = ++weight;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: BasicContainer(
                      colour: Color(0xFF1E1B31),
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(fontSize: 45),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(width: 10),
                              RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: GestureDetector(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: height, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalPage(
                        Bmi: calc.calculateBMI(),
                        Weight: calc.getResult(),
                        Messag: calc.getInterpretation(),
                      ),
                    ),
                  );
                },
              ),
              height: 55,
              width: double.infinity,
              color: Color(0xFFF83058),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  RoundButton({this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 5,
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}

class Returncolumn extends StatelessWidget {
  final IconData icone;
  final String txt;
  Returncolumn({@required this.icone, this.txt});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icone,
          size: 70,
        ),
        SizedBox(height: 10),
        Text(
          txt,
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}

class BasicContainer extends StatelessWidget {
  final Color colour;
  final Widget childCard;
  BasicContainer({@required this.colour, this.childCard});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      margin: EdgeInsets.all(10),
      child: childCard,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colour,
      ),
    );
  }
}
