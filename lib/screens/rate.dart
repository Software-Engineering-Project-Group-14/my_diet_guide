import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class Rate extends StatefulWidget{
  const Rate({super.key});

  @override
  State<Rate> createState() => _RateState();

}

class _RateState extends State<Rate> {

  double starValue = 3.5;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "How is your experience?",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Spend a little bit of your time and,",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "rate your experience.",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RatingBar(
                                      initialRating: 0,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      ratingWidget: RatingWidget(
                                          full: const Icon(Icons.star, color: Colors.orange),
                                          half: const Icon(
                                            Icons.star_half,
                                            color: Colors.orange,
                                          ),
                                          empty: const Icon(
                                            Icons.star_outline,
                                            color: Colors.orange,
                                          )),
                                      onRatingUpdate: (value) {
                                        setState(() {
                                          starValue = value;
                                        });
                                      }),

                                ],
                              )
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
      ),
    );

  }


}