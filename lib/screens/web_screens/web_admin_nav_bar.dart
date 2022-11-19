import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common/route_constants.dart';

class WebAdminNavBar extends StatefulWidget implements PreferredSizeWidget{
  const WebAdminNavBar({Key? key}) : super(key: key);

  @override
  State<WebAdminNavBar> createState() => _WebAdminNavBarState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _WebAdminNavBarState extends State<WebAdminNavBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, right: 60),
          child: GestureDetector(
            child: Text(
              "Home",
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),
            ),
            onTap: (){
              Navigator.pushNamed(context, RouteConstants.homeRoute);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, right: 60),
          child: GestureDetector(
            child: Text(
            "Log out",
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),
            ),
            onTap: (){
              FirebaseAuth.instance.signOut();
            },
          ),
        ),
      ],
    );
  }
}
