import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/common/messgae_constants.dart';
import 'package:my_diet_guide/common/route_constants.dart';
import 'package:my_diet_guide/widgets/rate_card.dart';
import 'package:sizer/sizer.dart';

import '../controllers/Controller.dart';
import '../models/Rate.dart';
import '../widgets/blurred_background_image.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/side_bar.dart';

class Rate extends StatefulWidget{

  const Rate({super.key});


  @override
  State<Rate> createState() => _RateState();

}

class _RateState extends State<Rate> {

  late double starValue = 3;
  String feedbackText = '';
  final _formKey = GlobalKey<FormState>();
  String error = '';
  late Stream<QuerySnapshot> rateStream;

  @override
  void initState() {
    rateStream = RateModel.getRateStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      minimum: EdgeInsets.only(top: 20),
      child: Scaffold(
        backgroundColor: Colors.teal.shade900,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade900,
          elevation: 0,
        ),
        drawer: NavigationDrawer(),
        body: Stack(
          children: [
            BlurredBackground(),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text("Rate My Diet Guide", style: TextStyle(color: Colors.white, fontSize: 32),),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "How is your experience?",
                                      style: TextStyle(
                                        fontSize: 18, color: Colors.white
                                      ),
                                      // style: GoogleFonts.poppins(
                                      //     fontSize: 15,
                                      //   color: Colors.white
                                      // ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Spend a little bit of your time and,",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "rate your experience.",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    RatingBar(
                                        initialRating: starValue,
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
                            ),
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          key: Key("feedback-text"),
                          showCursor: true,
                          maxLines: 5,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.white)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal.shade900),
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              hintText: 'Your feedback here (optional)',
                              fillColor: Colors.white.withOpacity(0.5),
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
                                  primary: Colors.teal.shade900,
                                  fixedSize: Size(200, 50),
                              ),
                              child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20
                                  )
                              ),
                              onPressed: () async {
                                //print(starValue);
                                //print(feedbackText);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context){
                                      return AlertDialog(
                                        title: Text(
                                          "Confirmation",
                                          style: TextStyle(
                                              fontSize: 24
                                          ),
                                        ),
                                        content: Text(
                                          "Do you wish to continue as ${Controller.auth!.currentUser!.email}?",
                                          style: TextStyle(
                                              fontSize: 19
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            child: Text(
                                              "Yes",
                                              style: TextStyle(
                                                  fontSize: 22
                                              ),
                                            ),
                                            onPressed: ()async{
                                              if(Controller.auth!.currentUser != null || _formKey.currentState!.validate()){
                                                RateModel rateObject = RateModel(
                                                  starValue, Controller.auth!.currentUser!.email, feedbackText,
                                                );
                                                AlertDialog(
                                                  content: Center(
                                                    child: CircularProgressIndicator(),
                                                  ),
                                                );
                                                bool result = await rateObject.add();
                                                if(result){
                                                  setState(() {
                                                    feedbackText = "";
                                                  });
                                                  Navigator.of(context).pop();
                                                  showDialog(
                                                    context: context,
                                                    builder: (context){
                                                      return AlertDialog(
                                                        key: Key("review-add-alert-dialog"),
                                                        content: Text(
                                                            'Your review added.',
                                                          style: TextStyle(
                                                            fontSize: 20
                                                          ),
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                              child: const Text(
                                                                  'OK',
                                                                style: TextStyle(
                                                                  fontSize: 22
                                                                ),
                                                              ),
                                                              onPressed: () {

                                                                Navigator.of(context).pop();
                                                                Navigator.pushNamed(context, RouteConstants.rateRoute);
                                                              }
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }else{
                                                  setState(() {
                                                    error = 'Could not add review. Please try again.';
                                                  });
                                                }
                                              }

                                            },
                                          ),
                                          TextButton(
                                            child: Text(
                                              "No",
                                              style: TextStyle(
                                                  fontSize: 22
                                              ),
                                            ),
                                            onPressed: (){
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );

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
                          MessageConstants.errorMessage,
                        style: TextStyle(
                          color: Colors.white
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return  Center(
                        child: CircularProgressIndicator(),
                      );
                    }
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
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RateCard(rateModel: RateModel(data['rate'].toDouble(),data['email'],data['review'])),
                          );
                        }).toList().cast(),
                      );
                    }
                  },
                ),
              ],
            ),
            )
          ]
        ),
        bottomNavigationBar: BottomBar(user_id: Controller.auth!.currentUser!.uid),
      ),
    );

  }


}