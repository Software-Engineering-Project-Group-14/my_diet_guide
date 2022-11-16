import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class WebStarRatingBar extends StatefulWidget {

  double starValue;

  WebStarRatingBar({Key? key, required this.starValue}) : super(key: key);

  @override
  State<WebStarRatingBar> createState() => _WebStarRatingBarState();
}

class _WebStarRatingBarState extends State<WebStarRatingBar> {

  var starValue;

  @override
  void initState() {
    this.starValue = widget.starValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: this.starValue,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 35,
      ignoreGestures: true,
      ratingWidget: RatingWidget(
          full: const Icon(Icons.star, color: Colors.orange),
          half: const Icon(
            Icons.star_half,
            color: Colors.orange,
          ),
          empty: const Icon(
            Icons.star_outline,
            color: Colors.orange,
          )),
      onRatingUpdate: (double value) {  },
    );
  }
}
