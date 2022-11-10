import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/common/route_constants.dart';
import 'package:my_diet_guide/controllers/BMI_controller.dart';
import 'package:my_diet_guide/controllers/DietPlan_controller.dart';
import 'package:my_diet_guide/controllers/Diet_controller.dart';
import 'package:my_diet_guide/controllers/Home_controller.dart';
import 'package:my_diet_guide/controllers/user_controller.dart';
import 'package:my_diet_guide/screens/forgot_password.dart';
import 'package:my_diet_guide/screens/rate.dart';

import 'controllers/Controller.dart';
import 'controllers/UserBiometrics_controller.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBG6hB8dbhSyv4wnMM08rPCGVX-ttX8tNY",
        appId: "1:946107548040:android:dd03aea3530fcabeedba3d",
        messagingSenderId: "946107548040",
        projectId: "my-diet-guide-14",
      )
  );
  runApp(DevicePreview(builder: (context)=>MyApp(firestore: FirebaseFirestore.instance, auth: FirebaseAuth.instance)));
  //runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key, required this.auth, required this.firestore}) : super(key: key);
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Controller.init(auth: widget.auth, firestore: widget.firestore);
    String cur = ModalRoute.of(context)!.settings.name!;
    final List<String> routeList = cur.split('/');
    print(routeList);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Diet Guide",
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
      ),
      initialRoute: RouteConstants.homeRoute,
      routes: {

        RouteConstants.homeRoute: (context){
          return HomeController();
        },

        RouteConstants.forgotPasswordRoute: (context)=>ForgotPassword(),

        RouteConstants.planViewRoute: (context)=>DietPlanController(
            subRoute: ModalRoute.of(context)!.settings.name!.
            substring(RouteConstants.planRoute.length)),
        RouteConstants.planChangeRoute: (context)=>DietPlanController(
            subRoute: ModalRoute.of(context)!.settings.name!.
            substring(RouteConstants.planRoute.length)),
        RouteConstants.planSelectRoute: (context)=>DietPlanController(
            arguments: ModalRoute.of(context)!.settings.arguments,
            subRoute: ModalRoute.of(context)!.settings.name!.
            substring(RouteConstants.planRoute.length)),

        RouteConstants.userDetailsViewRoute: (context)=>UserDetailsController(
            subRoute: ModalRoute.of(context)!.settings.name!.
            substring(RouteConstants.userDetailsRoute.length)),
        RouteConstants.userDetailsCreateRoute: (context)=>UserDetailsController(
            arguments: ModalRoute.of(context)!.settings.arguments,
            subRoute: ModalRoute.of(context)!.settings.name!.
            substring(RouteConstants.userDetailsRoute.length)),
        RouteConstants.userDetailsUpdateRoute: (context)=>UserDetailsController(
            arguments: ModalRoute.of(context)!.settings.arguments,
            subRoute: ModalRoute.of(context)!.settings.name!.
            substring(RouteConstants.userDetailsRoute.length)),

        RouteConstants.bioCreateRoute: (context)=>UserBiometricsController(
            arguments: ModalRoute.of(context)!.settings.arguments,
            subRoute: ModalRoute.of(context)!.settings.name!.
            substring(RouteConstants.userDetailsRoute.length)),
        RouteConstants.bioUpdateRoute: (context)=>UserBiometricsController(
            arguments: ModalRoute.of(context)!.settings.arguments,
            subRoute: ModalRoute.of(context)!.settings.name!.
            substring(RouteConstants.userDetailsRoute.length)),

        RouteConstants.bmiCheckRoute: (context)=>BMIController(),

        RouteConstants.rateRoute: (context)=>Rate(),

        RouteConstants.dietViewRoute: (context)=>DietController(
          arguments: ModalRoute.of(context)!.settings.arguments,
        ),
      },
      onUnknownRoute: (settings){
        throw Exception('Unknown route: ${ModalRoute.of(context)!.settings.name}');
      },

    );
  }
}
