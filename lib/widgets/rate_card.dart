import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/models/Rate.dart';
import 'package:my_diet_guide/widgets/star_rating_bar.dart';



class RateCard extends StatefulWidget {

  RateModel rateModel;

  RateCard({Key? key, required this.rateModel}) : super(key: key);

  @override
  State<RateCard> createState() => _RateCardState();
}


class _RateCardState extends State<RateCard> {

  var rateModel;

  @override
  void initState() {
    this.rateModel = widget.rateModel;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      borderOnForeground: true,
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: StarRatingBar(starValue: rateModel.rate,),
            title: Text(
                "${rateModel.email}",
                style: TextStyle(color: Colors.green)),
            subtitle: Text(
              "${rateModel.review}",
              style: TextStyle(color: Colors.orangeAccent),
            ),
          ),
        ],
      ),
    );

  }

}