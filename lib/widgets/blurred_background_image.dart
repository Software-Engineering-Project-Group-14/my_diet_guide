import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredBackground extends StatelessWidget {
  const BlurredBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
          colors: [Colors.black45, Colors.black12],
          begin: Alignment.bottomCenter,
          end: Alignment.center
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/wallpapers/wallpaper-01.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                )
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(color: Colors.transparent,),
            ),
          )
        ],
      ),
    );
  }
}
