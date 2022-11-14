import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/admin_mobile_error.dart';
import 'package:my_diet_guide/screens/loading_page.dart';
import 'package:my_diet_guide/screens/user_dashboard.dart';
import 'package:my_diet_guide/screens/web_screens/admin_dashboard.dart';
import 'package:my_diet_guide/screens/web_screens/web_user_dashboard.dart';

import '../controllers/Controller.dart';
import '../models/UserBiometrics.dart';

class DashboardChange extends StatefulWidget {
  const DashboardChange({Key? key}) : super(key: key);

  @override
  State<DashboardChange> createState() => _DashboardChangeState();
}

class _DashboardChangeState extends State<DashboardChange> {

  Future<String> getType(String u_id) async {
    final userSnapshot = await Controller.firestore!.collection('app_users').doc(u_id).get();
    String type = userSnapshot.data()!['type'];
    return type;
  }

  @override
  Widget build(BuildContext context) {
    String u_id = Controller.auth!.currentUser!.uid;

    return FutureBuilder<String>(
      future: getType(u_id),
      builder: (context, snapshot){
        if(snapshot.hasData){
          final type = snapshot.data;

          if(type =='user'){
            UserBiometrics.updateCalculatedCurrentWeight(user_id: Controller.auth!.currentUser!.uid);
            return LayoutBuilder(
                builder: (context, constraints){
                  if(constraints.maxWidth < 600){
                    return UserDashboard();
                  }
                  else {
                    return WebUserDashboard();
                  }
                }
            );
          }
          else {
            return LayoutBuilder(
                builder: (context, constraints){
                  if(constraints.maxWidth < 600){
                    return AdminMobileError();
                  }
                  else {
                    return AdminDashboard();
                  }
                }
            );
          }
        } else {
          return LoadingPage();
        }

      }
    );
  }
}
