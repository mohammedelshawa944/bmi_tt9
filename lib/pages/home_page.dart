import 'dart:math';

import 'package:bmi_tt9/pages/result_page.dart';
import 'package:bmi_tt9/widget/card_wid.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widget/my_fab_btn.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  int weight = 40;
  int age = 19;
  bool isMale =true;
  double height = 100;
  double resultBmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
             Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        isMale=true;
                      });
                    },
                    child: CardWidget(
                        widGet: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 60,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text("Male")
                          ],
                        ), colorwid: isMale ? colorbtn: colorCard
                      ,),
                  )
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: CardWidget(
                        widGet: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 60,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text("Female")
                          ],
                        ), colorwid: isMale ? colorCard : colorbtn,),
                  )
                ),
              ],
            ),
            Expanded(
              child: CardWidget(
                  widGet:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "${height.round()}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 54),
                          ),
                          Text(
                            "cm",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      Slider(
                          value: height,
                          max: 220,
                          min: 50,
                          onChanged: (double value) {
                            setState(() {
                              height = value;
                            });
                          }),
                    ],
                  ), colorwid: colorCard,)
            ),
            Row(
              children: [
                Expanded(
                  child: CardWidget(widGet: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WEIGHT"),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${weight}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyFab(onPressed: (){
                            setState(() {
                              weight++;
                            });
                          }, icon: Icons.add),
                          MyFab(onPressed: (){
                           setState(() {
                             weight--;
                           });
                          }, icon: Icons.remove),
                        ],
                      ),
                    ],
                  ), colorwid: colorCard,)
                ),
                Expanded(
                  child: CardWidget(widGet: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Age"),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${age}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyFab(onPressed: (){
                            setState(() {
                              age++;
                            });
                          }, icon: Icons.add),
                          MyFab(onPressed: (){
                            setState(() {
                              age--;
                            });
                          }, icon: Icons.remove),
                        ],
                      ),
                    ],
                  ), colorwid: colorCard,)
                ),
              ],
            ),
            InkWell(
              onTap: (){
                setState(() {
                  resultBmi = (weight/ pow(height / 100 , 2));
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=> ResultPage(result: resultBmi,)
                    )
                );
              },
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorbtn,
                ),
                child: Center(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
