import 'package:flutter/material.dart';
import 'package:my_diet_guide/models/Rate.dart';
import 'package:my_diet_guide/widgets/web_widgets/web_star_rating_bar.dart';

class WebRateCard extends StatefulWidget {

  RateModel rateModel;

  WebRateCard({Key? key, required this.rateModel}) : super(key: key);

  @override
  State<WebRateCard> createState() => _WebRateCardState();
}


class _WebRateCardState extends State<WebRateCard> {

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
          borderRadius: BorderRadius.circular(40),
          border: Border.all(width: 5, color: Colors.white10)
      ),
      child: Row(

        children: [

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: WebStarRatingBar(starValue: rateModel.rate,),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                    "${rateModel.email}",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Container(
                      width: 550,
                      child: Text(
                        "${rateModel.review}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,

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