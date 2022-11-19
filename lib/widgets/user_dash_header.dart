import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Size size;

  const Header({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: size.height * 0.15,   // 15% of screen height
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 50),
            height: size.height * 0.075 ,
            decoration: BoxDecoration(
              color: Colors.teal.shade900,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36)
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 40,
                  color: Colors.teal.shade900.withOpacity(0.25)
                )
              ]
            ),
            child: Row(
              children: [
                Text("Hello there!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.85)),),
                Spacer(),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
