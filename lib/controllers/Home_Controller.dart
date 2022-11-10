import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/controllers/Controller.dart';

import '../models/UserBiometrics.dart';
import '../screens/login.dart';
import '../screens/user_dashboard.dart';

class HomeController extends Controller {

  const HomeController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Controller.auth!.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          UserBiometrics.updateCalculatedCurrentWeight(firestore: Controller.firestore,user_id: Controller.auth!.currentUser!.uid) ;
          return UserDashboard(firestore: Controller.firestore!, auth: Controller.auth!);
        }else{
          //return Login();
          return Login(firestore: Controller.firestore!, auth: Controller.auth!);
        }
      },
    );
  }
}