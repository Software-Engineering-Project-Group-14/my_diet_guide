import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/view_diet_details.dart';

class ViewDietPlan extends StatefulWidget {
  const ViewDietPlan({Key? key}) : super(key: key);



  @override
  State<ViewDietPlan> createState() => _ViewDietPlanState();
}

class _ViewDietPlanState extends State<ViewDietPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: const Text('View Diet Plan',),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                  child: Text('Diet Plan',
                  style: TextStyle(
                      fontSize: 40,
                    fontWeight: FontWeight.bold,

                  ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                  child: Text('Dietary preference :',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                  child: Text('Intensity :',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                  child: Text('Activeness :',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
              ],
            ),


            SizedBox(height: 20),
            //monday
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/diet_details');
                },
                  child: Container(
                    padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.indigo[300],
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(
                        child: Text('Monday',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                        ),
                      )
                  )
              ),
            ),

            //tuesday
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/diet_details');
                  },
                  child: Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          color: Colors.indigo[300],
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(
                        child: Text('Tuesday',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                      )
                  )
              ),
            ),

            //wednesday
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/diet_details');
                  },
                  child: Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          color: Colors.indigo[300],
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(
                        child: Text('Wednesday',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                      )
                  )
              ),
            ),

            //thursday
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/diet_details');
                  },
                  child: Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          color: Colors.indigo[300],
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(
                        child: Text('Thursday',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                      )
                  )
              ),
            ),

            //Friday
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/diet_details');
                  },
                  child: Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          color: Colors.indigo[300],
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(
                        child: Text('Friday',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                      )
                  )
              ),
            ),

            //saturday
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/diet_details');
                  },
                  child: Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          color: Colors.indigo[300],
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(
                        child: Text('Saturday',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                      )
                  )
              ),
            ),

            //sunday
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/diet_details');
                  },
                  child: Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          color: Colors.indigo[300],
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(
                        child: Text('Sunday',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                      )
                  )
              ),
            ),
            SizedBox(height: 20,),


          ],
        ),
      )
    );
  }
}
