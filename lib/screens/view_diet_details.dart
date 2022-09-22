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

                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Card(
                    elevation: 0,
                    color: Colors.blueGrey[100],
                    child:  SizedBox(
                      width: 400,
                      height: 150,
                      child: Column(
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
                    ),
                  ),
                ),


                //lunch

              Padding(
                padding: EdgeInsets.all(20.0),
                child: Card(
                  elevation: 0,
                  color: Colors.blueGrey[100],
                  child:  SizedBox(
                    width: 400,
                    height: 150,
                    child: Column(
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
                              child: Text('Progress :',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),

                        //progress icons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            //didn't complete
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.red,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text('Didnt \ncomplete',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),),
                                  )
                                ],
                              ),
                            ),

                            //didn't complete
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.lightGreenAccent,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text('Partially \ncomplete',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),),
                                  )
                                ],
                              ),
                            ),

                            //Completed
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.green,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text('Completed',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),),
                                  )
                                ],
                              ),
                            ),

                            //over ate
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.red,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text('Over Ate',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),),
                                  )
                                ],
                              ),
                            ),

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
                  elevation: 0,
                  color: Colors.blueGrey[100],
                  child:  SizedBox(
                    width: 400,
                    height: 150,
                    child: Column(
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
                              child: Text('Progress :',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),

                        //progress icons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            //didn't complete
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.red,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text('Didnt \ncomplete',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),),
                                  )
                                ],
                              ),
                            ),

                            //didn't complete
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.lightGreenAccent,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text('Partially \ncomplete',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),),
                                  )
                                ],
                              ),
                            ),

                            //Completed
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.green,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text('Completed',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),),
                                  )
                                ],
                              ),
                            ),

                            //over ate
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.red,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text('Over Ate',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),),
                                  )
                                ],
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
      ),
    );
  }
}
