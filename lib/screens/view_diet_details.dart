import 'package:flutter/material.dart';

class DietDetails extends StatefulWidget {
  const DietDetails({Key? key}) : super(key: key);

  @override
  State<DietDetails> createState() => _DietDetailsState();
}

class _DietDetailsState extends State<DietDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: const Text('Diet Details',),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [

              //Dinner
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 0,
                  color: Colors.blueGrey[100],
                  child:  SizedBox(
                    width: 400,
                    height: 150,
                    child: Row(
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start  , //to remove the centering from the column
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                  child: Text('Breakfast',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                  child: Text('Meal : meal name',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                  child: Text('Description :',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                  width: 80,
                                  height: 70,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image(
                                        image: AssetImage('assets/images/view diet/2.jpg')),
                                  )),
                            )
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ),



              //Lunch
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 0,
                  color: Colors.blueGrey[100],
                  child:  SizedBox(
                    width: 400,
                    height: 150,
                    child: Row(
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start  , //to remove the centering from the column
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                  child: Text('Lunch',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                  child: Text('Meal : meal name',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                  child: Text('Description :',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                  width: 80,
                                  height: 70,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image(
                                        image: AssetImage('assets/images/view diet/1.jpg')),
                                  )),
                            )
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ),


              //Dinner
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 0,
                  color: Colors.blueGrey[100],
                  child:  SizedBox(
                    width: 400,
                    height: 150,
                    child: Row(
                      children: [

                        Column(
                      crossAxisAlignment: CrossAxisAlignment.start  , //to remove the centering from the column
                      children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                  child: Text('Dinner',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                  child: Text('Meal : meal name',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                  child: Text('Description :',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                  width: 80,
                                  height: 70,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image(image: AssetImage('assets/images/view diet/3.jpg')))),
                            )
                          ],
                        )

                      ],
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
