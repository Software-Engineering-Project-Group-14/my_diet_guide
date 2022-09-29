import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/user_dashboard.dart';

class MealCard extends StatelessWidget {
  final String title;
  final String mealName;
  final String imageLocation;
  final Widget navigate;

  const MealCard({Key? key, required this.title, required this.mealName, required this.imageLocation, required this.navigate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 120),
                child: Text(title, style: TextStyle(fontSize: 19, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
              ),
              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text("Meal : ", style: TextStyle(color: Colors.white, fontSize: 16),),

                    Container(
                      width: 160,
                      child: Text(mealName, style: TextStyle(color: Colors.white, fontSize: 16),),
                    ),
                  ],
                ),
              ),
              //Text("Meal : $mealName", style: TextStyle(color: Colors.white, fontSize: 16),),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(right: 125),
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => navigate));
                  },
                  child: Text("See More", style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal.shade900),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10)),
                      elevation: MaterialStateProperty.all(5),
                      fixedSize: MaterialStateProperty.all(Size(90, 10))
                  ),
                ),
              )
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image(
              image: AssetImage(imageLocation),
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
