import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:pedal/responsive/crossaxiscount.dart';

class Footer extends StatelessWidget {
  Footer({
    this.mediaQuery
  });
  
  final ScreenScaler scaler = new ScreenScaler();
  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      alignment: Alignment.center,
      color: Color(0xFF070707),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GridView.count(
            crossAxisCount: getFooterGridCrossAxisCount(mediaQuery),
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 50.0,
            childAspectRatio: 2.0,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  'Contact Us'.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Touche',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    fontSize: scaler.getTextSize(7.0),
                    color: Colors.white,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Text(
                      '+91 9485526412',
                      style: TextStyle(
                        fontFamily: 'Touche',
                        fontWeight: FontWeight.w300,
                        fontSize: scaler.getTextSize(5.5),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'contact@pedal.com',
                      style: TextStyle(
                        fontFamily: 'Touche',
                        fontWeight: FontWeight.w300,
                        fontSize: scaler.getTextSize(5.5),
                        color: Color(0xFFD9901B)
                      ),
                    ),
                  ),
                  Text(
                    'Kodialbail, Mangalore,',
                    style: TextStyle(
                      fontFamily: 'Touche',
                      fontWeight: FontWeight.w300,
                      fontSize: scaler.getTextSize(5.5),
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Karnataka, India - 575003',
                    style: TextStyle(
                      fontFamily: 'Touche',
                      fontWeight: FontWeight.w300,
                      fontSize: scaler.getTextSize(5.5),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  'Services'.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Touche',
                    fontWeight: FontWeight.w700,
                    fontSize: scaler.getTextSize(7.0),
                    letterSpacing: 0.5,
                    color: Colors.white,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FooterClickables(scaler: scaler, text: 'Contact Us',),
                  FooterClickables(scaler: scaler, text: 'Ordering & Payment',),
                  FooterClickables(scaler: scaler, text: 'Shipping',),
                  FooterClickables(scaler: scaler, text: 'Returns',),
                  FooterClickables(scaler: scaler, text: 'FAQ',),
                  FooterClickables(scaler: scaler, text: 'Sizing Enquiries',),
                ],
              ),
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  'Information'.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Touche',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    fontSize: scaler.getTextSize(7.0),
                    color: Colors.white,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FooterClickables(scaler: scaler, text: 'Work With Us',),
                  FooterClickables(scaler: scaler, text: 'Privacy Policy',),
                  FooterClickables(scaler: scaler, text: 'Terms & Conditions',),
                  FooterClickables(scaler: scaler, text: 'Press Enquiries',),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 140.0,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: (){},
                        child: Image(
                          image: AssetImage(
                            '../assets/images/instagram.png',
                          ),
                          width: 14.0,
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: (){},
                        child: Image(
                          image: AssetImage(
                            '../assets/images/facebook.png',
                          ),
                          width: 14.0,
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: (){},
                        child: Image(
                          image: AssetImage(
                            '../assets/images/twitter.png',
                          ),
                          width: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '©Pedal Cycles 2020',
                style: TextStyle(
                  fontFamily: 'Touche',
                  fontWeight: FontWeight.w300,
                  fontSize: scaler.getTextSize(4.5),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FooterClickables extends StatelessWidget {
  FooterClickables({
    this.scaler,
    this.text,
  });

  final ScreenScaler scaler;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: (){},
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Touche',
              fontWeight: FontWeight.w300,
              fontSize: scaler.getTextSize(5.5),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}