import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Size size;

  const Header({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.15,   // 20% of screen height
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
                Text("Hello User!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.85)),),
                Spacer(),
                SizedBox(height: 10,)
              ],
            ),

          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     margin: EdgeInsets.symmetric(horizontal: 20),
          //     padding: EdgeInsets.symmetric(horizontal: 20),
          //     height: 54,
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(20),
          //       boxShadow: [
          //         BoxShadow(
          //           offset: Offset(0, 10),
          //           blurRadius: 50,
          //           color: Colors.teal.shade900.withOpacity(0.23),
          //         )
          //       ],
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(vertical: 20),
          //       child: Center(
          //         child: Text(
          //           "Diet Plan",
          //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //         )
          //       ),
          //     ),
          //   )
          // ),
        ],
      ),
    );
  }
}
