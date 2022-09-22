import 'package:flutter/material.dart';

class RecordProgressPage extends StatefulWidget {
  const RecordProgressPage({Key? key}) : super(key: key);

  @override
  State<RecordProgressPage> createState() => _RecordProgressPageState();
}

class _RecordProgressPageState extends State<RecordProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: ListView(
            children: [
              SizedBox(height: 20,),
              Center(
                child: Text(
                  "Record Progress",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  '2022/09/23 - Friday',
                  //textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: 150,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text("Breakfast", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22), textAlign: TextAlign.left,),
                          SizedBox(height: 10,),
                          Text("Meal : blah blah ", style: TextStyle(fontSize: 16), textAlign: TextAlign.left,),
                          SizedBox(height: 10,),
                          Text("Record Progress : ", style: TextStyle(fontSize: 16), textAlign: TextAlign.left,),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.limeAccent
                                ),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.limeAccent
                                ),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.limeAccent
                                ),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.limeAccent
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
    );
  }
}
