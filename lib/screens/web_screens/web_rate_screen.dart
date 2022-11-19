import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/common/messgae_constants.dart';
import 'package:my_diet_guide/common/route_constants.dart';
import 'package:my_diet_guide/widgets/web_widgets/web_user_navigation_bar.dart';

import '../../controllers/Controller.dart';
import '../../models/Rate.dart';
import '../../widgets/blurred_background_image.dart';
import '../../widgets/web_widgets/web_blurred_backgound.dart';
import '../../widgets/web_widgets/web_rate_card.dart';



class WebRate extends StatefulWidget{

  const WebRate({super.key});


  @override
  State<WebRate> createState() => _WebRateState();

}

class _WebRateState extends State<WebRate> {

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
      child: Scaffold(
        backgroundColor: Colors.teal.shade900,
        appBar: WebUserNavBar(),
        body: Stack(
            children: [
              WebBlurredBackground(),
              SingleChildScrollView(
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text("Rate My Diet Guide", style: TextStyle(color: Colors.white, fontSize: 40),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "How is your experience?",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Spend a little bit of your time and, rate your experience.",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30, bottom: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    RatingBar(
                                        initialRating: starValue,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 55,
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 800,
                              child: TextFormField(
                                key: Key("feedback-text"),
                                showCursor: true,
                                maxLines: 5,
                                style: TextStyle(
                                  fontSize: 20
                                ),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(color: Colors.white)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.teal.shade900),
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    hintText: 'Your feedback here (optional)',
                                    fillColor: Colors.white.withOpacity(0.5),
                                    filled: true
                                ),
                                onChanged: (val) {
                                  setState(() => feedbackText = val);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ElevatedButton(
                                  key: Key('review-add-button'),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.teal.shade900,
                                      fixedSize: Size(200, 50)
                                  ),
                                  child: Text(
                                      'Submit',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white
                                      )
                                  ),
                                  onPressed: () async {

                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context){
                                          return AlertDialog(
                                            title: Text(
                                              "Confirmation",
                                              style: TextStyle(
                                                fontSize: 32
                                              ),
                                            ),
                                            content: Text(
                                              "Do you wish to continue as ${Controller.auth!.currentUser!.email}?",
                                              style: TextStyle(
                                                  fontSize: 20
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                  child: Text(
                                                    "Yes",
                                                    style: TextStyle(
                                                        fontSize: 20
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
                                                                        fontSize: 45
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
                                                      fontSize: 20
                                                  ),
                                                ),
                                                onPressed: (){
                                                  Navigator.of(context).pop();
                                                },
                                              )
                                            ],
                                          );
                                        }
                                    );


                                  }
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              error,
                              style: TextStyle(color: Colors.red, fontSize: 20.0),
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
                                padding: const EdgeInsets.all(20),
                                child: Container(
                                  width: 850,
                                    child: WebRateCard(rateModel: RateModel(data['rate'].toDouble(),data['email'],data['review']))),
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
      ),
    );

  }


}