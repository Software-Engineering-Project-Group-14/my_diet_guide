import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordBox extends StatelessWidget {

  final String hint;
  final TextEditingController controller;

  const PasswordBox({Key? key, required this.hint, required this.controller}) : super(key: key);

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
              keyboardType: TextInputType.text,
              obscureText: true,
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
                    FontAwesomeIcons.lock,
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
