import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:pedal/responsive/mobileSize.dart';

class Header extends StatelessWidget {
  Header({
    this.mediaQuery
  });

  final ScreenScaler scaler = new ScreenScaler();
  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: (){
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Row(
                children: [
                  Image(
                    image: AssetImage(
                      '../assets/images/logo.png',
                    ),
                    width: isMobileDevice(mediaQuery)?scaler.getWidth(4.5):scaler.getWidth(6.0),
                  ),
                  SizedBox(width: 15.0,),
                  Text(
                    'Pedal',
                    style: TextStyle(
                      fontFamily: 'Touche',
                      fontSize: isMobileDevice(mediaQuery)?scaler.getTextSize(8.0):scaler.getTextSize(10.0),
                      letterSpacing: -0.8,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          isMobileDevice(mediaQuery)?Container(
            child: IconButton(
              icon: Icon(
                Icons.menu_sharp,
                size: 24.0,
                color: Colors.white,
              ),
              onPressed: (){
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ):IntrinsicHeight(
            child: Row(
              children: [
                MenuClickables(
                  text: 'Login',
                ),
                VerticalDivider(
                  thickness: 3.0,
                  color: Color(0xFFD9901B),
                ),
                MenuClickables(
                  text: 'Shopping Cart',
                ),
                VerticalDivider(
                  thickness: 3.0,
                  color: Color(0xFFD9901B),
                ),
                MenuClickables(
                  text: 'Contact Us',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuClickables extends StatelessWidget {
  MenuClickables({
    this.text,
    this.textSize,
  });

  final String text;
  final ScreenScaler scaler = new ScreenScaler();
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: (){},
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Touche',
              fontSize: scaler.getTextSize((textSize==null)?6.0:textSize),
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
