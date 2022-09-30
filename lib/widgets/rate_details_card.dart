import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateDetailsCard extends StatelessWidget {
  const RateDetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 100,
        child: Center(
          child: Column(
            children: [
              Divider(color: Colors.white , thickness: 2, indent: 20, endIndent: 20,),

              SizedBox(height: 5,),

              Row(
                children: [
                  SizedBox(width: 30,),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image(
                        image: AssetImage(
                      'assets/images/user details/user.png'
                    )

                    ),
                  ),
                  SizedBox(width: 20,),
                  Text("username1",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                  ),
                  SizedBox(width: 80,),

                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text('3.5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),),
                  )


                ],
              ),

              SizedBox(height: 5,),

              Divider(color: Colors.white , thickness: 2, indent: 20, endIndent: 20,),
            ],
          ),
        ),
      ),

    );
  }
}
