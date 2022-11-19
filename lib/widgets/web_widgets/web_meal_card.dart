import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WebMealCard extends StatelessWidget {

  final String title;
  final String mealName;
  final String imageLocation;
  final String description;
  final Widget navigate;

  const WebMealCard({Key? key, required this.title, required this.mealName, required this.imageLocation, required this.navigate, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Text(title, style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
          ),

          Divider(color: Colors.white , thickness: 2, indent: 20, endIndent: 20,),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(
                image: AssetImage(imageLocation),
                fit: BoxFit.cover,
                width: 15.w,
                height: 15.w,
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Center(
              child: Text(mealName, style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
            child: Center(
              child: Text(description, style: TextStyle(color: Colors.white, fontSize: 17), textAlign: TextAlign.center),
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => navigate));
              },
              child: Text("See More", style: TextStyle(color: Colors.white, fontSize: 15),),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal.shade900),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10)),
                  elevation: MaterialStateProperty.all(5),
                  fixedSize: MaterialStateProperty.all(Size(150, 30))
              ),
            ),
          )

        ],
      ),
    );
  }
}
