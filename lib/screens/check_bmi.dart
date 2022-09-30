import 'package:flutter/material.dart';
import 'package:my_diet_guide/models/BMI.dart';
import 'package:my_diet_guide/widgets/background_image.dart';

import '../widgets/BMICard.dart';

class CheckBMI extends StatefulWidget {
   CheckBMI({Key? key}) : super(key: key);
  double result = 0;
  @override
  State<CheckBMI> createState() => _CheckBMIState();
}

class _CheckBMIState extends State<CheckBMI> {
  final _currentWeight = TextEditingController();
  final _currentHeight = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage(),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.indigo[800],
          title: const Text(
            'Check BMI',
          ),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Container(
                  //   // child : BMICard(),
                  //   child: Text('${result}',
                  //   style: TextStyle(
                  //     color: Colors.white
                  //   ),),
                  // ),
                  // BMICard(result: '${result}'),

                  //bmi window
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade600.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: 300,
                    height: 100,
                    child: Center(
                      child: Text(

                        '${widget.result}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  //current weight
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade600.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: TextField(
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                          controller: _currentWeight,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                                fontSize: 15, color: Colors.red[1000]),
                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                            border: InputBorder.none,
                            hintText: '   Current Weight (Kg)',
                            hintStyle:
                                TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  //current height
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade600.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: TextField(
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                          controller: _currentHeight,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                                fontSize: 15, color: Colors.red[1000]),
                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                            border: InputBorder.none,
                            hintText: '   Current Height (Cm)',
                            hintStyle:
                                TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 60,
                  ),
                  //calculate button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: GestureDetector(
                            onTap: ()   {
                              print('object');
                              var bmiModel = BMIModel(
                                  double.parse(_currentHeight.text),
                                  double.parse(_currentWeight.text));


                                widget.result =bmiModel.calculateBMI() as double;
                                print('result in front : ' + '${widget.result}');
                               setState(() {
                                });
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.teal.shade900,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Center(
                                child: Text(
                                  'Calculate',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
