
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/controllers/Controller.dart';

import '../models/UserBiometrics.dart';
import '../screens/login.dart';
import '../screens/user_dashboard.dart';

class HomeController extends Controller {

  const HomeController({Key? key}) : super(key: key);

  @override
  State<HomeController> createState() => _HomeControllerState();

}

class _HomeControllerState extends State<HomeController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Controller.auth!.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          UserBiometrics.updateCalculatedCurrentWeight(user_id: Controller.auth!.currentUser!.uid) ;
          return UserDashboard();
        }else{
          //return Login();
          return Login();
        }
      },
    );
  }
}


