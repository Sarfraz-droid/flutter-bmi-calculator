import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../constants.dart';
import '../components/reusable_card.dart';

class Result extends StatefulWidget {
  Result({@required this.resultText, @required this.interpretation,@required this.bmi});

  final String resultText;
  final String interpretation;
  final String bmi;
  @override
  _ResultState createState() => _ResultState(
    resultText: resultText,
    interpretation: interpretation,
    bmi: bmi
  );
}

class _ResultState extends State<Result> {
  _ResultState({@required this.resultText, @required this.interpretation,@required this.bmi});

  final String resultText;
  final String interpretation;
  final String bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result'
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Your Result",
              style: kBoldText,
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(resultText,
                      style: kResultTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Center(
                      child: Text(
                        bmi,
                        style: kResultSolution,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0
                    ),
                    child: Center(
                      child: Text(
                        interpretation,
                        style: kResultMessage,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),

            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute(
                    builder: ((context) => InputPage())
                ),
              );
            },
            child: Container(
              child: Center(
                  child: Text("CALCULATE AGAIN")
              ),
              height: 40.0,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
