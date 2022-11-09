import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/common/route_constants.dart';
import 'package:my_diet_guide/controllers/DietPlan_controller.dart';
import 'package:my_diet_guide/controllers/Home_controller.dart';
import 'package:my_diet_guide/models/UserBiometrics.dart';
import 'package:my_diet_guide/screens/change_plan.dart';
import 'package:my_diet_guide/screens/check_bmi.dart';
import 'package:my_diet_guide/screens/forgot_password.dart';
import 'package:my_diet_guide/screens/login.dart';
import 'package:my_diet_guide/screens/rate.dart';
import 'package:my_diet_guide/screens/select_plan.dart';
import 'package:my_diet_guide/screens/signup.dart';
import 'package:my_diet_guide/screens/update_user_biometrics_form.dart';
import 'package:my_diet_guide/screens/update_user_details_form.dart';
import 'package:my_diet_guide/screens/user_biometrics_form.dart';
import 'package:my_diet_guide/screens/user_dashboard.dart';
import 'package:my_diet_guide/screens/user_details_form.dart';
import 'package:my_diet_guide/screens/user_profile.dart';
import 'package:my_diet_guide/screens/view_diet.dart';
import 'package:my_diet_guide/screens/view_diet_details.dart';

import 'controllers/Controller.dart';
import 'models/DietPlan.dart';



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

class MyApp extends StatelessWidget {

  const MyApp({Key? key, required this.auth, required this.firestore}) : super(key: key);
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Controller.init(auth: auth, firestore: firestore);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Diet Guide",
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
      ),
      initialRoute: RouteConstants.homeRoute,
      onGenerateRoute: (settings){
        late Widget page;

        if (settings.name == RouteConstants.homeRoute){
          page = const HomeController();

        }else if (settings.name == RouteConstants.forgotPasswordRoute){
          page = ForgotPassword();

        }else if(settings.name!.startsWith(RouteConstants.planRoute)){
          final subRoute = settings.name!.substring(RouteConstants.planRoute.length);
          page = DietPlanController(
            subRoute: subRoute,
          );

        } else if (settings.name == RouteConstants.userDetailsCreateRoute){
          final args = settings.arguments as Map<String, String>;
          page = UserDetailsForm(
              email: args['email']!,
              password: args['password']!
          );

        }else if (settings.name == RouteConstants.bioUpdateRoute){
          final args = settings.arguments as Map<String, dynamic>;
          page =UpdateBiometricsForm(
              user_id: args['user_id']!,
              firstName: args['firstName']!,
              lastName: args['lastName']!,
              bday: args['bday']!,
              gender: args['gender']!,
              age: args['age']!,
          );

        } else if (settings.name == RouteConstants.bioCreateRoute){
          final args = settings.arguments as Map<String, dynamic>;
          page = UserBiometricsForm(
              email: args['email'],
              password: args['password'],
              firstName: args['firstName'],
              lastName: args['lastName'],
              age: args['age'],
              bday: args['bday'],
              gender: args['gender']
          );

        } else if (settings.name == RouteConstants.userDetailsUpdateRoute){
          page = UpdateDetailsForm(user_id: auth.currentUser!.uid);

        } else if (settings.name == RouteConstants.userDetailsViewRoute){
          page = UserProfile();

        } else if (settings.name == RouteConstants.bmiCheckRoute){
          page = CheckBMI();

        } else if (settings.name == RouteConstants.rateRoute){
          page = Rate();

        } else if (settings.name == RouteConstants.dietViewRoute){
          final args = settings.arguments as Map<String, dynamic>;
          page = DietDetails(user_id: args['user_id'], day: args['day']);

        } else {
          throw Exception('Unknown route: ${settings.name}');
        }

        return MaterialPageRoute<dynamic>(
          builder: (context) {
            return page;
          },
          settings: settings,
        );
      },
    );
  }
}
