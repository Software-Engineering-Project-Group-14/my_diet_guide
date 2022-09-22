import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePlan extends StatefulWidget {
  const ChangePlan({Key? key}) : super(key: key);

  @override
  State<ChangePlan> createState() => _ChangePlanState();
}

class _ChangePlanState extends State<ChangePlan> {

  final _recommededPlans = [
    "Recommended plan 1",
    "Recommended plan 2",
    "Recommended plan 3",
    "Recommended plan 4",
    "Recommended plan 5",
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        backgroundColor: Colors.green.shade100,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.blueGrey
                      )
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "You current plan: ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 20
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Plan 1",
                                  style: GoogleFonts.poppins(
                                      fontSize: 20
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent,
                                border: Border.all(
                                    color: Colors.black
                                ),
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {

                                  });

                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "Change Plan",
                                        style: GoogleFonts.poppins(
                                            fontSize: 15
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Other recommended plans for you",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: _recommededPlans.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(
                          _recommededPlans[index],
                          style: GoogleFonts.poppins(
                              fontSize: 15
                          ),
                        );
                      }
                  ),
                ],
              )
            ],
          ),
        )
    );


  }




}