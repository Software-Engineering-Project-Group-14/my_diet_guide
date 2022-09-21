import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green.shade100,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("User Dashboard",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left),
                      //Text("Dashboard", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.left),
                    ],
                  ),
                  // Image(
                  //   image: AssetImage('assets/images/dash1.png'),
                  //   fit: BoxFit.cover,
                  //   height: 85,
                  //   width: 85,
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Image(
                            image: AssetImage(
                                'assets/images/dashboard/view-diet.png'),
                            fit: BoxFit.cover,
                            width: 110,
                            height: 110,
                          ),
                        ),
                        Text(
                          "View Diet Plan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Image(
                            image: AssetImage(
                                'assets/images/dashboard/record-progress.png'),
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Record Progress",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Image(
                            image: AssetImage(
                                'assets/images/dashboard/update-profile.png'),
                            fit: BoxFit.cover,
                            width: 110,
                            height: 110,
                          ),
                        ),
                        Text(
                          "Update Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Image(
                            image: AssetImage(
                                'assets/images/dashboard/change-diet.png'),
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Change Diet Plan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Image(
                            image:
                                AssetImage('assets/images/dashboard/rate.png'),
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        Text(
                          "Rate MyDietGuide",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Image(
                            image:
                                AssetImage('assets/images/dashboard/BMI.png'),
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Check BMI",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ));
  }
}
