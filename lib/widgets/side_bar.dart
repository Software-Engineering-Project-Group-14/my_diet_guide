import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_diet_guide/widgets/background_image.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }



  Widget buildHeader(BuildContext context){
    return Material(
      color: Colors.teal.shade900,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top,
              bottom: 24
          ),
          // child: Column(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 116),
          //       child: Text("Hello There"),
          //     )
          //   ],
          // ),
        ),
      ),
    );
  }



  Widget buildMenuItems(BuildContext context){
    return Container(
      padding: EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: Icon(Icons.home_outlined, size: 30, color: Colors.black54,),
            title: Text("Home", style: TextStyle(fontSize: 19),),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.home_outlined, size: 30),
            title: Text("Home", style: TextStyle(fontSize: 19),),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.home_outlined, size: 30),
            title: Text("Home", style: TextStyle(fontSize: 19),),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.home_outlined, size: 30),
            title: Text("Home", style: TextStyle(fontSize: 19),),
            onTap: (){

            },
          ),
          Divider(color: Colors.teal.shade900 , thickness: 2),
          ListTile(
            leading: Icon(FontAwesomeIcons.arrowRightFromBracket, color: Colors.teal.shade900,),
            title: Text("Log Out", style: TextStyle(fontSize: 19, color: Colors.teal.shade900),),
            onTap: (){
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }


}
