import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/widgets/rate_details_card.dart';

import '../widgets/blurred_background_image.dart';

class ViewAllRates extends StatefulWidget {
  const ViewAllRates({Key? key}) : super(key: key);

  @override
  State<ViewAllRates> createState() => _ViewAllRatesState();
}

class _ViewAllRatesState extends State<ViewAllRates> {
  
  // Stream<List<>> readRatings() => FirebaseFirestore.instance.collection('rate')
  final CollectionReference _ratings = FirebaseFirestore.instance.collection('rate');
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlurredBackground(),
        Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'View All Rates',
            ),
          ),
          body:
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          width: 360,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white10],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight
                              ),
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(width: 2, color: Colors.white10)
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15, right: 125),
                                child: Text("2022/09/27 - Tuesday", style: TextStyle(fontSize: 19, color: Colors.white,),),
                              ),

                              SizedBox(height: 30,),
                              // RateDetailsCard(),
                              // RateDetailsCard()
                              StreamBuilder(
                                stream: _ratings.snapshots(),
                                  builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
                                    if(streamSnapshot.hasData){
                                      print('snapshot has data 0000');
                                      return ListView.builder(
                                          itemCount: streamSnapshot.data!.docs.length,
                                          itemBuilder: (context,index){
                                            final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                                            print(documentSnapshot['email']);
                                            return Card(
                                              child: ListTile(
                                                title: Text(documentSnapshot['email']),
                                                // subtitle: Text(documentSnapshot['rating']),
                                              ),
                                            );
                                          }
                                          );
                                    }
                                    return CircularProgressIndicator();
                                  }
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

      ),
    ]
    );
  }
}
