import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:pedal/models/cycle.dart';
import 'package:pedal/views/productpage.dart';

class CycleCard extends StatelessWidget {
  CycleCard({
    this.cycle,
  });

  final Cycle cycle;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: (){
          Navigator.push(context, CupertinoPageRoute(builder: (context){
            return ProductPage(cycle: cycle,);
          }));
        },
        splashColor: Colors.grey[400],
        child: SizedBox(
          width: 500.0,
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(
                    '../../assets/images/'+cycle.image,
                  ),
                  width: 186.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150.0,
                      child: Text(
                        cycle.name,
                        style: TextStyle(
                          fontFamily: 'Touche',
                          fontSize: scaler.getTextSize(8.0),
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      '₹'+cycle.price.toString(),
                      style: TextStyle(
                        fontFamily: 'Touche',
                        fontSize: scaler.getTextSize(8.0),
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFD9901B),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 480.0,
                  child: Text(
                    cycle.smallDesc,
                    style: TextStyle(
                      fontFamily: 'Touche',
                      fontSize: scaler.getTextSize(6.0),
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}