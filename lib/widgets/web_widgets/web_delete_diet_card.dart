import 'package:flutter/material.dart';

class WebDeleteDietCard extends StatelessWidget {
  final Map details;
  final String meal;
  const WebDeleteDietCard({Key? key, required this.details, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map dietDetails = details;
    return Container(
      child:Column(
        children: [
          Text(meal, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
          Text("Monday :" + dietDetails['monday_dish_id'].substring(0,10),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.8)),),
          Text("Tuesday :" + dietDetails['tuesday_dish_id'].substring(0,10),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.8)),),
          Text("Wednesday :" + dietDetails['wednesday_dish_id'].substring(0,10),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.8)),),
          Text("Thursday :" + dietDetails['thursday_dish_id'].substring(0,10),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.8)),),
          Text("Friday :" + dietDetails['friday_dish_id'].substring(0,10),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.8)),),
          Text("Saturday :" + dietDetails['saturday_dish_id'].substring(0,10),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.8)),),
          Text("Sunday :" + dietDetails['sunday_dish_id'].substring(0,10),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.8)),),
        ],
      )
    );
  }
}
