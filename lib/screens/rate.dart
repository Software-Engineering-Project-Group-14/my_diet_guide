import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/widgets/rate_card.dart';

import '../models/Rate.dart';
import '../widgets/blurred_background_image.dart';
import '../widgets/bottom_bar.dart';

class Rate extends StatefulWidget{
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  const Rate({super.key, required this.firestore, required this.auth});


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
    final Stream<QuerySnapshot> rateStream = RateModel.getRateStream(firestore: widget.firestore);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal.shade900,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade900,
          elevation: 0,
          title: const Text(
            'Rate MyDietGuide'
          ),
          toolbarHeight: 100,
        ),
        body: Stack(
          children: [
            BlurredBackground(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
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
                                          fontSize: 15,
                                        color: Colors.white
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
                                          fontSize: 15,
                                        color: Colors.white
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
                                          fontSize: 15,
                                        color: Colors.white
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
                            key: Key("feedback-text"),
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
                                key: Key('review-add-button'),
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
                                  if(widget.auth.currentUser != null || _formKey.currentState!.validate()){
                                    RateModel rateObject = RateModel(
                                      starValue, widget.auth.currentUser!.email, feedbackText,
                                    );
                                    bool result = await rateObject.add(firestore: widget.firestore);
                                    if(result){
                                      showDialog(
                                        context: context,
                                        builder: (context){
                                          return const AlertDialog(
                                            key: Key("review-add-alert-dialog"),
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
                  StreamBuilder<QuerySnapshot>(
                    stream: rateStream,
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                      if (snapshot.hasError) {
                        return const Text(
                            'Something went wrong',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text(
                          'Loading',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        );
                      }
                      //return Text('');
                      if(snapshot.data == null){
                        return Text(
                          'No ratings added yet.',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        );
                      }else{
                        return Column(
                          key: Key("reviews-column"),
                          children: snapshot.data!.docs.map((DocumentSnapshot document){
                            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                            return RateCard(rateModel: RateModel(data['rate'].toDouble(),data['email'],data['review']));
                          }).toList().cast(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            )
          ]
        ),
        bottomNavigationBar: BottomBar(user_id: widget.auth.currentUser!.uid, firestore: widget.firestore, auth: widget.auth,),
      ),
    );

  }


}