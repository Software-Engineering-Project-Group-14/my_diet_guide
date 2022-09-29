import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/view_diet_details.dart';

class ViewDietCard extends StatelessWidget {
  final String day;
  final String user_id;
  const ViewDietCard({Key? key, required this.day, required this.user_id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DietDetails(user_id: user_id,)));
          },
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white24, Colors.white10],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text(day,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                  )
              ),
            ),
          )
      ),
    );
  }
}
