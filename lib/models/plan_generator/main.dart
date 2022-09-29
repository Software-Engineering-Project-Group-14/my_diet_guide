

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/models/plan_generator/DishGenerator.dart';
import 'package:my_diet_guide/models/plan_generator/MealGenerator.dart';
import 'package:my_diet_guide/models/plan_generator/PlanGenerator.dart';

Future<void> main() async {
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBG6hB8dbhSyv4wnMM08rPCGVX-ttX8tNY",
        appId: "1:946107548040:android:dd03aea3530fcabeedba3d",
        messagingSenderId: "946107548040",
        projectId: "my-diet-guide-14",
      )
  );

  PlanGenerator planGenerator = PlanGenerator();
  planGenerator.generate();
 // print(planGenerator.getRandomActiveness());
 // print(planGenerator.getRandomAgeGroup());
 // print(planGenerator.getRandomIntensity());

//  MealGenerator m = new MealGenerator();
  //m.generate();

  runApp(DevicePreview(builder: (context)=>MyApp1()));



}



class MyApp1 extends StatefulWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  State<MyApp1> createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {

 // late Stream<QuerySnapshot> dishStream;

  @override
  void initState() {
    //dishStream = DishGenerator.getDishStream();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal.shade900,
        body: Text("Hello")
      ),
    );


  }




}



/*
StreamBuilder<QuerySnapshot>(
stream: dishStream,
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
DishGenerator d = DishGenerator();
d.setDishes(snapshot);

return Column(
children: []
);
}
),
 */