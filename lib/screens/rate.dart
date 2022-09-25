import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/Rate.dart';

class Rate extends StatefulWidget{
  const Rate({super.key});

  @override
  State<Rate> createState() => _RateState();

}

class _RateState extends State<Rate> {

  double starValue = 3.5;
  String feedbackText = '';
  final _formKey = GlobalKey<FormState>();
  String error = '';

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Rate MyDietGuide'
          ),
        ),
        backgroundColor: Colors.grey[300],
        body: Center(
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            showCursor: true,
                            maxLines: 10,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple),
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                hintText: 'Your feedback here (optional)',
                                fillColor: Colors.grey[200],
                                filled: true
                              ),
                              onChanged: (val) {
                                setState(() => feedbackText = val);
                              },
                            ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.deepPurple,
                                    fixedSize: Size(300, 50)
                                ),
                                child: Text(
                                    'Submit',
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 20,
                                        color: Colors.black
                                    )
                                ),
                                onPressed: () async {
                                  //print(starValue);
                                  //print(feedbackText);
                                  if(FirebaseAuth.instance.currentUser != null || _formKey.currentState!.validate()){
                                    RateModel rateObject = RateModel(
                                        starValue, FirebaseAuth.instance.currentUser!.uid, feedbackText,
                                    );
                                    bool result = await rateObject.addRateToFirestore();
                                    if(result){
                                      showDialog(
                                        context: context,
                                        builder: (context){
                                          return const AlertDialog(
                                            content: Text(
                                                'Your review added.'
                                            ),
                                          );
                                        },
                                      );
                                    }else{
                                      setState(() {
                                        error = 'Could not add review. Please try again.';
                                      });
                                    }
                                  }
                                }
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          )
                        ],
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