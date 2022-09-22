import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/user_details.dart';

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
                              GestureDetector(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.yellow.shade300,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    SizedBox(height: 3,),
                                    Text("Did not", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                                    SizedBox(height: 2,),
                                    Text("complete", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                onTap: (){},
                              ),
                              GestureDetector(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.lime.shade400,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    SizedBox(height: 3,),
                                    Text("parially", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                                    SizedBox(height: 2,),
                                    Text("completed", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                onTap: (){},
                              ),
                              GestureDetector(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.green.shade300,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    SizedBox(height: 3,),
                                    Text("Completed", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                onTap: (){},
                              ),
                              GestureDetector(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    SizedBox(height: 3,),
                                    Text("Over ate", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                onTap: (){},
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
