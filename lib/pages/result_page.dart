import 'package:bmi_tt9/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
   ResultPage({
    Key? key,
    required this.result,
  }) : super(key: key);

  final double result;
  Color? color;
  String? text;
  String? textdesc;


  String testResult(double value){
    if(value < 15 ){
      text = 'very severely underweight';
      textdesc = 'Less than 15';
      color = Colors.yellowAccent;

    } else if(value >=15&& value <=16) {
      text = 'Severely underweight';
      textdesc = 'Between 15 and 16';
      color = Colors.green;

    }else if(value >16&& value <=25) {
      text = 'Underweight';
      textdesc = 'Between 16 and 18.5';
      color = Colors.orange;

    }else if(value >=18.5&& value <=25) {
      text = 'Normal';
      textdesc = 'Between 18.5 and 25';
      color = Colors.orangeAccent;

    } else if(value > 25 ) {
      text = 'overweight';
      textdesc = 'bigger than 25';
      color = Colors.red;
    }

    return text!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0.5,
        title: Text('BMI CALCULATOR',style:
          TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text('Your Result',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40
            ),),
            SizedBox(height: 25,),
            Center(
              child: Container(
                height: 550,
                width: 350,
                color: Color(0xff1D1F33),
                child: Column(
                  children: [
                    SizedBox(height: 60,),
                    Text(testResult(result),style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: color
                    ),),
                    SizedBox(height: 20,),
                    Text('result = ${result.toStringAsFixed(1)}',style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
                    SizedBox(height: 80,),
                    Text(
                      textAlign: TextAlign.center,
                      'avg : ${textdesc}',style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                    SizedBox(height: 80,),
                    SizedBox(
                      height: 55,
                      width: 160,
                      child: ElevatedButton(
                          onPressed: (){},
                          child: Text('SAVE RESULT'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            InkWell(
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorbtn,
                ),
                child: Center(
                  child: Text(
                    "RE- CALCULATE YOUR BMI",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
