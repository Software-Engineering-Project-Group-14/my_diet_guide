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
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white24, Colors.white10],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(width: 2, color: Colors.white10)
      ),
      child: Row(

        children: [

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: StarRatingBar(starValue: rateModel.rate,),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "${rateModel.email}",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 200,
                        child: Text(
                          "${rateModel.review}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,

                          ),
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),


        ],
      ),
    );

  }

}