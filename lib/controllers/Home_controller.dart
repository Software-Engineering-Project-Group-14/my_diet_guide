
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/controllers/Controller.dart';
import 'package:my_diet_guide/screens/admin_mobile_error.dart';
import 'package:my_diet_guide/screens/dashboard_change.dart';
import 'package:my_diet_guide/screens/web_screens/admin_dashboard.dart';
import 'package:my_diet_guide/screens/web_screens/web_login.dart';
import 'package:my_diet_guide/screens/web_screens/web_user_dashboard.dart';

import '../models/UserBiometrics.dart';
import '../screens/login.dart';
import '../screens/user_dashboard.dart';

class HomeController extends Controller {

  HomeController({Key? key, required super.context}) : super(key: key);

  @override
  State<HomeController> createState() => _HomeControllerState();

}

class _HomeControllerState extends State<HomeController> {

  Future<bool> isUser(String u_id) async{
    return await Controller.firestore!.collection('user').doc(u_id).get().then((value) => value.exists? true:false);
  }

  Future<bool> isAdmin(String u_id) async{
    return await Controller.firestore!.collection('admin').doc(u_id).get().then((value) => value.exists? true:false);
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Controller.auth!.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return DashboardChange();
        }else{
          return LayoutBuilder(builder: (context, constraints){
            if(constraints.maxWidth < 600){
              return Login();
            } else {
              return WebLogin();
            }
          });
        }
      },
    );
  }
}


