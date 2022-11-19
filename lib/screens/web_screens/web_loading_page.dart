import 'package:flutter/material.dart';
import 'package:my_diet_guide/widgets/web_widgets/web_blurred_backgound.dart';

class WebLoadingPage extends StatelessWidget {
  const WebLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('user-dashboard'),
      backgroundColor: Colors.teal.shade900,

      body: Stack(
        children: [
          WebBlurredBackground(),
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
