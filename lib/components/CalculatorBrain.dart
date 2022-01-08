import 'dart:math';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalculatorBrain{
  String result;
  double _bmi;

  int height;
  int weight;

  CalculatorBrain(int h,int w)
  {
    height = h;
    weight = w;
    calculateBMI();

  }

  void changeHeight(int h) {
    height = h;
  }

  void changeWeight(int w){
    weight = w;
  }


  void calculateBMI(){
    print(weight);
    print(height);
    _bmi = (weight/pow(height/100, 2));
    print(_bmi);
  }

  String getBMI(){
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){

    if(_bmi < 18.5)
    {
      result = "UnderWright";
    }else if(_bmi <= 24.9)
    {
      result = "Normal";
    }else if(_bmi <= 29.9)
    {
      result = "Overweight";
    }else{
      result = "Very Overweight";
    }
    return result;
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return 'You have a higher than normal body weight. Try to exercise more.';
    }else if (_bmi >= 18.5){
      return 'You have a normal body weight. Good job!';
    }else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

}