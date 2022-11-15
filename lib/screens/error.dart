
import 'package:flutter/material.dart';
import 'package:my_diet_guide/common/messgae_constants.dart';

import '../widgets/blurred_background_image.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        elevation: 0,),
      body: Stack(
        children: const [
          BlurredBackground(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              MessageConstants.errorMessage,
              style: TextStyle(
                fontSize: 24,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}