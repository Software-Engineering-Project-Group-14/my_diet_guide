import 'package:flutter/material.dart';

class TextBox02 extends StatelessWidget {

  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const TextBox02({Key? key, required this.controller, required this.hint, required this.keyboardType}) : super(key: key);

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
                fontSize: 19,
                color: Colors.white,
              ),
              keyboardType: keyboardType,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );


  }
}
