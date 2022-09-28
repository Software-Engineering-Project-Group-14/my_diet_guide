import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_diet_guide/screens/change_plan.dart';
import 'package:my_diet_guide/screens/rate.dart';
import 'package:my_diet_guide/screens/record_progress_page.dart';
import 'package:my_diet_guide/screens/update_user_details.dart';
import 'package:my_diet_guide/screens/view_diet.dart';
import 'package:my_diet_guide/widgets/background_image.dart';
import 'package:my_diet_guide/widgets/blurred_background_image.dart';
import 'package:my_diet_guide/widgets/bottom_bar.dart';
import 'package:my_diet_guide/widgets/user_dash_body.dart';
import '../widgets/side_bar.dart';
import 'check_bmi.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {

  final dietUser = FirebaseAuth.instance.currentUser;

  late String user_id = dietUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade900,
          elevation: 0,
          // leading: MaterialButton(
          //   onPressed: () {
          //     FirebaseAuth.instance.signOut();
          //   },
          //   color: Colors.deepPurple,
          //   child: Text('sign out'),
          // ),
        ),
        drawer: NavigationDrawer(),

        body: Stack(
          children: [
            BlurredBackground(),
            UserDashBody(user_id: user_id),
          ],
        ),

        // body: ListView(
        //   scrollDirection: Axis.vertical,
        //   children: [
        //     SizedBox(
        //       height: 30,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 40),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Column(
        //             children: [
        //               Text("User Dashboard",
        //                   style: TextStyle(
        //                       fontSize: 30, fontWeight: FontWeight.bold),
        //                   textAlign: TextAlign.left),
        //               //Text("Dashboard", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.left),
        //             ],
        //           ),
        //           // Image(
        //           //   image: AssetImage('assets/images/dash1.png'),
        //           //   fit: BoxFit.cover,
        //           //   height: 85,
        //           //   width: 85,
        //           // ),
        //         ],
        //       ),
        //     ),
        //     SizedBox(
        //       height: 30,
        //     ),
        //
        //
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         GestureDetector(
        //           onTap: () {
        //             Navigator.of(context).push(MaterialPageRoute(
        //                 builder: (_){
        //                   return ViewDietPlan();
        //                 }
        //             ));
        //           },
        //           child: Container(
        //             height: 150,
        //             width: 150,
        //             decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(15),
        //             ),
        //             child: Column(
        //               children: [
        //                 Container(
        //                   child: Image(
        //                     image: AssetImage(
        //                         'assets/images/dashboard/view-diet.png'),
        //                     fit: BoxFit.cover,
        //                     width: 110,
        //                     height: 110,
        //                   ),
        //                 ),
        //                 Text(
        //                   "View Diet Plan",
        //                   style: TextStyle(
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 16,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //
        //
        //         GestureDetector(
        //           onTap: () {
        //             Navigator.of(context).push(MaterialPageRoute(
        //                 builder: (_){
        //                   return RecordProgressPage();
        //                 }
        //             ));
        //           },
        //           child: Container(
        //             height: 150,
        //             width: 150,
        //             decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(15),
        //             ),
        //             child: Column(
        //               children: [
        //                 SizedBox(
        //                   height: 10,
        //                 ),
        //                 Container(
        //                   child: Image(
        //                     image: AssetImage(
        //                         'assets/images/dashboard/record-progress.png'),
        //                     fit: BoxFit.cover,
        //                     width: 90,
        //                     height: 90,
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 10,
        //                 ),
        //                 Text(
        //                   "Record Progress",
        //                   style: TextStyle(
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 16,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //
        //
        //
        //     SizedBox(
        //       height: 40,
        //     ),
        //
        //
        //
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         GestureDetector(
        //           onTap: () {
        //             Navigator.of(context).push(MaterialPageRoute(
        //                 builder: (_){
        //                   return UpdateUserDetailsPage();
        //                 }
        //             ));},
        //           child: Container(
        //             height: 150,
        //             width: 150,
        //             decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(15),
        //             ),
        //             child: Column(
        //               children: [
        //                 Container(
        //                   child: Image(
        //                     image: AssetImage(
        //                         'assets/images/dashboard/update-profile.png'),
        //                     fit: BoxFit.cover,
        //                     width: 110,
        //                     height: 110,
        //                   ),
        //                 ),
        //                 Text(
        //                   "Update Profile",
        //                   style: TextStyle(
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 16,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //
        //
        //         GestureDetector(
        //           onTap: () {
        //             Navigator.of(context).push(MaterialPageRoute(
        //                 builder: (_){
        //                   return ChangePlan();
        //                 }
        //             ));
        //           },
        //           child: Container(
        //             height: 150,
        //             width: 150,
        //             decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(15),
        //             ),
        //             child: Column(
        //               children: [
        //                 SizedBox(
        //                   height: 10,
        //                 ),
        //                 Container(
        //                   child: Image(
        //                     image: AssetImage(
        //                         'assets/images/dashboard/change-diet.png'),
        //                     fit: BoxFit.cover,
        //                     width: 90,
        //                     height: 90,
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 10,
        //                 ),
        //                 Text(
        //                   "Change Diet Plan",
        //                   style: TextStyle(
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 16,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //
        //
        //
        //     SizedBox(
        //       height: 40,
        //     ),
        //
        //
        //
        //
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         GestureDetector(
        //           onTap: () {
        //             Navigator.of(context).push(MaterialPageRoute(
        //                 builder: (_){
        //                   return Rate();
        //                 }
        //             ));},
        //           child: Container(
        //             height: 150,
        //             width: 150,
        //             decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(15),
        //             ),
        //             child: Column(
        //               children: [
        //                 SizedBox(
        //                   height: 10,
        //                 ),
        //                 Container(
        //                   child: Image(
        //                     image:
        //                         AssetImage('assets/images/dashboard/rate.png'),
        //                     fit: BoxFit.cover,
        //                     width: 100,
        //                     height: 100,
        //                   ),
        //                 ),
        //                 Text(
        //                   "Rate MyDietGuide",
        //                   style: TextStyle(
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 16,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //
        //
        //         GestureDetector(
        //           onTap: () {
        //             Navigator.of(context).push(MaterialPageRoute(
        //                 builder: (_){
        //                   return CheckBMI();
        //                 }
        //             ));},
        //           child: Container(
        //             height: 150,
        //             width: 150,
        //             decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(15),
        //             ),
        //             child: Column(
        //               children: [
        //                 SizedBox(
        //                   height: 10,
        //                 ),
        //                 Container(
        //                   child: Image(
        //                     image:
        //                         AssetImage('assets/images/dashboard/BMI.png'),
        //                     fit: BoxFit.cover,
        //                     width: 90,
        //                     height: 90,
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 10,
        //                 ),
        //                 Text(
        //                   "Check BMI",
        //                   style: TextStyle(
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 16,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //     SizedBox(
        //       height: 100,
        //     ),
        //   ],
        // ),
      bottomNavigationBar: BottomBar(user_id: user_id),
    );
  }
}
