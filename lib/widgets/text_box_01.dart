import 'package:flutter/material.dart';

class TextBox01 extends StatelessWidget {

  final String hint;
  final IconData iconName;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const TextBox01({Key? key, required this.controller, required this.hint, required this.iconName, required this.keyboardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade600.withOpacity(0.6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextField(
              controller: controller,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
              keyboardType: keyboardType,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    iconName,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );


  }
}
