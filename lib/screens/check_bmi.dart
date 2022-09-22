import 'package:flutter/material.dart';

class CheckBMI extends StatefulWidget {
  const CheckBMI({Key? key}) : super(key: key);

  @override
  State<CheckBMI> createState() => _CheckBMIState();
}

class _CheckBMIState extends State<CheckBMI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: const Text('Check BMI',),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                //current weight
                Row(
                  children: [
                    //current weight
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('cur. Weight : ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),

                    //input current weight
                    SizedBox(
                      width: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Enter Weight'
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                //current height
                Row(
                  children: [
                    //current weight
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('cur. Height : ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //input current weight
                    SizedBox(
                      width: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Enter Height'
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                
                SizedBox(height: 20,),
                //calculate button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text('Calculate',
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
