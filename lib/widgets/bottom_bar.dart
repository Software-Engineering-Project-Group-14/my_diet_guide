import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -20),
              blurRadius: 35,
              color: Colors.teal.shade900.withOpacity(0.3),
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.user,
              color: Colors.white,
            ),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.user,
              color: Colors.white,
            ),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.user,
              color: Colors.white,
            ),
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}
