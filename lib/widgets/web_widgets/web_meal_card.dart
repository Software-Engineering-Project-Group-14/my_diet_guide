import 'package:flutter/material.dart';

class WebMealCard extends StatelessWidget {

  final String title;
  final String mealName;
  final String imageLocation;
  final Widget navigate;

  const WebMealCard({Key? key, required this.title, required this.mealName, required this.imageLocation, required this.navigate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Text(title, style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
          ),

          Divider(height: 2),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(
                image: AssetImage(imageLocation),
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
          ),

          Divider(height: 2),






        ],
      ),
    );
  }
}
