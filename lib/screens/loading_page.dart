import 'package:flutter/material.dart';

import '../widgets/blurred_background_image.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('user-dashboard'),
      backgroundColor: Colors.teal.shade900,

      body: Stack(
        children: [
          BlurredBackground(),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100,),
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
