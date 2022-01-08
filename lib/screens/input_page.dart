import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_container.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'result.dart';
import '../components/CalculatorBrain.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female
}

class _InputPageState extends State<InputPage> {


  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  CalculatorBrain brain = new CalculatorBrain(180,60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
          child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = selectedGender == Gender.male ? null : Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? activeCardColor : InactiveCardColor,
                    cardChild: CardChild(
                      ObjectIcon: FontAwesomeIcons.mars,
                      TitleText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = selectedGender == Gender.female ? null : Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? activeCardColor : InactiveCardColor,
                    cardChild: CardChild(
                      ObjectIcon: FontAwesomeIcons.venus,
                      TitleText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      colour: Color(0xFF1D1E33),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'Height',
                              style: kLabelTextStyles,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: kBoldText,
                              ),
                              Text(
                                  'cm',
                                style: kLabelTextStyles,
                              ),

                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbColor: Color(0xFFEB1555),
                              activeTrackColor: Colors.white,
                              trackHeight: 1,
                              thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                              overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 20.0),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              onChanged: (values) {
                                setState(() {
                                  height = values.toInt();
                                  brain.changeHeight(height);
                                });
                              },
                              min: 100.0,
                              max: 220.0,
                              inactiveColor: Color(0xFF8D8E98),
                            ),
                          )
                        ],
                      ),
                  ),

                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                      colour: Color(0xFF1D1E33),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: kLabelTextStyles,
                          ),
                          Text(
                            weight.toString(),
                            style: kBoldText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButtonIcon(
                                icon: FontAwesomeIcons.minus,
                                onPress: (){
                                  setState(() {
                                    weight--;
                                    brain.changeWeight(weight);
                                  });
                                },
                              ),
                              SizedBox(width: 10.0,),
                              RoundButtonIcon(
                                onPress: (){
                                  setState(() {
                                    weight++;
                                    brain.changeWeight(weight);
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                  )
                ),
                Expanded(
                  child: ReusableCard(
                      colour: Color(0xFF1D1E33),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: kLabelTextStyles,
                          ),
                          Text(
                            age.toString(),
                            style: kBoldText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButtonIcon(
                                icon: FontAwesomeIcons.minus,
                                onPress: (){
                                  setState(() {
                                    age--;
                                  });
                                },

                              ),
                              SizedBox(width: 10.0),
                              RoundButtonIcon(
                                icon: FontAwesomeIcons.plus,
                                onPress: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              brain.calculateBMI();
              Navigator.push(context,
                MaterialPageRoute(
                  builder: ((context) => Result(
                    bmi: brain.getBMI(),
                    interpretation: brain.getInterpretation(),
                    resultText: brain.getResult(),
                  ))
                ),
              );
            },
            child: Container(
              child: Center(child: Text("CALCULATE")),
              height: 40.0,
              color: Colors.red,
            ),
          )
        ],
      )),
    );
  }
}

class RoundButtonIcon extends StatelessWidget {

  RoundButtonIcon({this.icon,this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(
        icon,
      ),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      elevation: 6.0,
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

