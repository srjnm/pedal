import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:pedal/models/cycle.dart';
import 'package:pedal/responsive/mobileSize.dart';
import 'package:pedal/responsive/switchposition.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class ProductPage extends StatefulWidget {
  ProductPage({
    this.cycle,
  });
  final Cycle cycle;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int color = 3;
  int size = 3;
  int speed = 2;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      endDrawer: isMobileDevice(mediaQuery)?Drawer(
        elevation: 25.0,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              alignment: Alignment.center,
              child: Image(
                image: AssetImage(
                  '../assets/images/logo.png',
                ),
                width: scaler.getWidth(4.5),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MenuClickables(
                    text: 'Login',
                    textSize: 7.0,
                  ),
                  Divider(thickness: 1.0, color: Colors.grey[100].withOpacity(0.3),),
                  MenuClickables(
                    text: 'Shopping Cart',
                    textSize: 7.0,
                  ),
                  Divider(thickness: 1.0, color: Colors.grey[100].withOpacity(0.3),),
                  MenuClickables(
                    text: 'Contact Us',
                    textSize: 7.0,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Text(
                '©Pedal Cycles 2020',
                style: TextStyle(
                  fontFamily: 'Touche',
                  fontWeight: FontWeight.w300,
                  fontSize: scaler.getTextSize(5.5),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ):Container(width: 0.0, height: 0.0,),
      body: ListView(
        children: [
          Header(mediaQuery: mediaQuery,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: switchToCol(mediaQuery)?20:mediaQuery.size.width/16-10, vertical: 50.0),
            width: double.infinity,
            color: Colors.black,
            child: switchToCol(mediaQuery)?Column(
              children: [
                Container(
                  child: Image(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                      isLessThan460(mediaQuery)?'../../assets/images/'+widget.cycle.image:'../../assets/images/xl-'+widget.cycle.image,
                    ),
                    width: isMobileDevice(mediaQuery)?mediaQuery.size.width-80.0:mediaQuery.size.width-200.0,
                  ),
                ),
                Container(
                  width: switchPos(mediaQuery)?double.infinity:(mediaQuery.size.width/2)-150,
                  height: 700.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.cycle.name.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Touche',
                          fontWeight: FontWeight.w700,
                          fontSize: scaler.getTextSize(8.0),
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '₹'+widget.cycle.price.toString(),
                        style: TextStyle(
                          fontFamily: 'Touche',
                          fontWeight: FontWeight.w700,
                          fontSize: scaler.getTextSize(7.0),
                          color: Color(0xFFD9901B),
                        ),
                      ),
                      Text(
                        widget.cycle.desc,
                        style: TextStyle(
                          fontFamily: 'Touche',
                          fontWeight: FontWeight.w300,
                          fontSize: scaler.getTextSize(6.0),
                          color: Colors.white,
                        ),
                      ),
                      Divider(thickness: 2.0, color: Colors.grey[400].withOpacity(0.7),),
                      Text(
                        'Colour'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Touche',
                          fontWeight: FontWeight.w700,
                          fontSize: scaler.getTextSize(7.0),
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 180.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  color = 1;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(50.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                    ),
                                    BoxShadow(
                                      color: Colors.blue,
                                      spreadRadius: -12.0,
                                      blurRadius: 12.0,
                                    ),
                                  ],
                                  border: Border.all(
                                    width: (color==1)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  color = 2;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(50.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                    ),
                                    BoxShadow(
                                      color: Colors.teal,
                                      spreadRadius: -12.0,
                                      blurRadius: 12.0,
                                    ),
                                  ],
                                  border: Border.all(
                                    width: (color==2)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  color = 3;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(50.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                    ),
                                    BoxShadow(
                                      color: Colors.red,
                                      spreadRadius: -12.0,
                                      blurRadius: 12.0,
                                    ),
                                  ],
                                  border: Border.all(
                                    width: (color==3)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  color = 4;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(50.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                    ),
                                    BoxShadow(
                                      color: Colors.yellow,
                                      spreadRadius: -12.0,
                                      blurRadius: 12.0,
                                    ),
                                  ],
                                  border: Border.all(
                                    width: (color==4)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 2.0, color: Colors.grey[400].withOpacity(0.7),),
                      Text(
                        'Size'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Touche',
                          fontWeight: FontWeight.w700,
                          fontSize: scaler.getTextSize(7.0),
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 220.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  size = 1;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                    width: (size==1)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'XS',
                                  style: TextStyle(
                                    fontFamily: 'Touche',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  size = 2;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                    width: (size==2)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'S',
                                  style: TextStyle(
                                    fontFamily: 'Touche',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  size = 3;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                    width: (size==3)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'M',
                                  style: TextStyle(
                                    fontFamily: 'Touche',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  size = 4;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                    width: (size==4)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'L',
                                  style: TextStyle(
                                    fontFamily: 'Touche',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  size = 5;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                    width: (size==5)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'XL',
                                  style: TextStyle(
                                    fontFamily: 'Touche',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 2.0, color: Colors.grey[400].withOpacity(0.7),),
                      Text(
                        'Speed'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Touche',
                          fontWeight: FontWeight.w700,
                          fontSize: scaler.getTextSize(7.0),
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 130.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  speed = 1;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                    width: (speed==1)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '6',
                                  style: TextStyle(
                                    fontFamily: 'Touche',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  speed = 2;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                    width: (speed==2)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '8',
                                  style: TextStyle(
                                    fontFamily: 'Touche',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  speed = 3;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                    width: (speed==3)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '10',
                                  style: TextStyle(
                                    fontFamily: 'Touche',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Material(
                            color: Color(0xFFD9901B),
                            borderRadius: BorderRadius.circular(80.0),
                            child: InkWell(
                                onTap: (){
                                },
                                splashColor: Colors.grey[800],
                                mouseCursor: SystemMouseCursors.click,
                                borderRadius: BorderRadius.circular(50.0),
                                child: Container(
                                  width: switchToCol(mediaQuery)?120.0:180,
                                  height: switchToCol(mediaQuery)?40.0:50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(80.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Buy Now'.toUpperCase(),
                                    style: TextStyle(
                                      fontFamily: 'Touche',
                                      fontWeight: FontWeight.w700,
                                      fontSize: switchToCol(mediaQuery)?10.0:15.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                          ),
                          Material(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(80.0),
                            child: InkWell(
                                onTap: (){
                                },
                                splashColor: Colors.grey[800],
                                mouseCursor: SystemMouseCursors.click,
                                borderRadius: BorderRadius.circular(50.0),
                                child: Container(
                                  width: switchToCol(mediaQuery)?120.0:180,
                                  height: switchToCol(mediaQuery)?40.0:50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(80.0),
                                    border: Border.all(
                                      width: 2.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Add to Cart'.toUpperCase(),
                                    style: TextStyle(
                                      fontFamily: 'Touche',
                                      fontWeight: FontWeight.w700,
                                      fontSize: switchToCol(mediaQuery)?10.0:15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ):
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                      '../../assets/images/xl-'+widget.cycle.image,
                    ),
                    width: (mediaQuery.size.width/2)-150,
                  ),
                ),
                Container(
                  width: (mediaQuery.size.width/2)-150,
                  height: 700.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.cycle.name.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Touche',
                          fontWeight: FontWeight.w700,
                          fontSize: scaler.getTextSize(8.0),
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '₹'+widget.cycle.price.toString(),
                        style: TextStyle(
                          fontFamily: 'Touche',
                          fontWeight: FontWeight.w700,
                          fontSize: scaler.getTextSize(7.0),
                          color: Color(0xFFD9901B),
                        ),
                      ),
                      Text(
                        widget.cycle.desc,
                        style: TextStyle(
                          fontFamily: 'Touche',
                          fontWeight: FontWeight.w300,
                          fontSize: scaler.getTextSize(6.0),
                          color: Colors.white,
                        ),
                      ),
                      Divider(thickness: 2.0, color: Colors.grey[400].withOpacity(0.7),),
                      Text(
                        'Colour'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Touche',
                          fontWeight: FontWeight.w700,
                          fontSize: scaler.getTextSize(7.0),
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 180.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  color = 1;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(50.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                    ),
                                    BoxShadow(
                                      color: Colors.blue,
                                      spreadRadius: -12.0,
                                      blurRadius: 12.0,
                                    ),
                                  ],
                                  border: Border.all(
                                    width: (color==1)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  color = 2;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(50.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                    ),
                                    BoxShadow(
                                      color: Colors.teal,
                                      spreadRadius: -12.0,
                                      blurRadius: 12.0,
                                    ),
                                  ],
                                  border: Border.all(
                                    width: (color==2)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  color = 3;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(50.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                    ),
                                    BoxShadow(
                                      color: Colors.red,
                                      spreadRadius: -12.0,
                                      blurRadius: 12.0,
                                    ),
                                  ],
                                  border: Border.all(
                                    width: (color==3)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  color = 4;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(50.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                    ),
                                    BoxShadow(
                                      color: Colors.yellow,
                                      spreadRadius: -12.0,
                                      blurRadius: 12.0,
                                    ),
                                  ],
                                  border: Border.all(
                                    width: (color==4)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 2.0, color: Colors.grey[400].withOpacity(0.7),),
                      Text(
                        'Size'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Touche',
                          fontWeight: FontWeight.w700,
                          fontSize: scaler.getTextSize(7.0),
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 220.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  size = 1;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                    width: (size==1)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'XS',
                                  style: TextStyle(
                                    fontFamily: 'Touche',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  size = 2;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                    width: (size==2)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'S',
                                  style: TextStyle(
                                    fontFamily: 'Touche',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  size = 3;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                    width: (size==3)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'M',
                                  style: TextStyle(
                                    fontFamily: 'Touche',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  size = 4;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                    width: (size==4)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'L',
                                  style: TextStyle(
                                    fontFamily: 'Touche',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  size = 5;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                    width: (size==5)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'XL',
                                  style: TextStyle(
                                    fontFamily: 'Touche',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 2.0, color: Colors.grey[400].withOpacity(0.7),),
                      Text(
                        'Speed'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Touche',
                          fontWeight: FontWeight.w700,
                          fontSize: scaler.getTextSize(7.0),
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 130.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  speed = 1;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                    width: (speed==1)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '6',
                                  style: TextStyle(
                                    fontFamily: 'Touche',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  speed = 2;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                    width: (speed==2)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '8',
                                  style: TextStyle(
                                    fontFamily: 'Touche',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  speed = 3;
                                });
                              },
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                    width: (speed==3)?3.0:0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '10',
                                  style: TextStyle(
                                    fontFamily: 'Touche',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.0,
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Material(
                            color: Color(0xFFD9901B),
                            borderRadius: BorderRadius.circular(80.0),
                            child: InkWell(
                                onTap: (){
                                },
                                splashColor: Colors.grey[800],
                                mouseCursor: SystemMouseCursors.click,
                                borderRadius: BorderRadius.circular(50.0),
                                child: Container(
                                  width: 180,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(80.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Buy Now'.toUpperCase(),
                                    style: TextStyle(
                                      fontFamily: 'Touche',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                          ),
                          Material(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(80.0),
                            child: InkWell(
                                onTap: (){
                                },
                                splashColor: Colors.grey[800],
                                mouseCursor: SystemMouseCursors.click,
                                borderRadius: BorderRadius.circular(50.0),
                                child: Container(
                                  width: 180,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(80.0),
                                    border: Border.all(
                                      width: 2.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Add to Cart'.toUpperCase(),
                                    style: TextStyle(
                                      fontFamily: 'Touche',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 180.0,
                  width: mediaQuery.size.width/2+50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Specifications'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Touche',
                          fontWeight: FontWeight.w700,
                          fontSize: switchToCol(mediaQuery)?18.0:scaler.getTextSize(9.0),
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Material',
                            style: TextStyle(
                              fontFamily: 'Touche',
                              fontWeight: FontWeight.w700,
                              fontSize: switchToCol(mediaQuery)?14.0:scaler.getTextSize(7.6),
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            widget.cycle.material,
                            style: TextStyle(
                              fontFamily: 'Touche',
                              fontWeight: FontWeight.w400,
                              fontSize: switchToCol(mediaQuery)?14.0:scaler.getTextSize(7.6),
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                              fontFamily: 'Touche',
                              fontWeight: FontWeight.w700,
                              fontSize: switchToCol(mediaQuery)?14.0:scaler.getTextSize(7.6),
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            widget.cycle.weight.toString()+' KG',
                            style: TextStyle(
                              fontFamily: 'Touche',
                              fontWeight: FontWeight.w400,
                              fontSize: switchToCol(mediaQuery)?14.0:scaler.getTextSize(7.6),
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Height',
                            style: TextStyle(
                              fontFamily: 'Touche',
                              fontWeight: FontWeight.w700,
                              fontSize: switchToCol(mediaQuery)?14.0:scaler.getTextSize(7.6),
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            widget.cycle.height.toString()+' M',
                            style: TextStyle(
                              fontFamily: 'Touche',
                              fontWeight: FontWeight.w400,
                              fontSize: switchToCol(mediaQuery)?14.0:scaler.getTextSize(7.6),
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Width',
                            style: TextStyle(
                              fontFamily: 'Touche',
                              fontWeight: FontWeight.w700,
                              fontSize: switchToCol(mediaQuery)?14.0:scaler.getTextSize(7.6),
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            widget.cycle.width.toString()+' M',
                            style: TextStyle(
                              fontFamily: 'Touche',
                              fontWeight: FontWeight.w400,
                              fontSize: switchToCol(mediaQuery)?14.0:scaler.getTextSize(7.6),
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                isMobileDevice(mediaQuery)?Container(
                  height: 0.0,
                  width: 0.0,
                ):
                Container(
                  padding: EdgeInsets.only(left: 100.0),
                  alignment: Alignment.center,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(22.0/7.0),
                    child: Image(
                      fit: BoxFit.fitWidth,
                      image: AssetImage(
                        '../../assets/images/xl-'+widget.cycle.image,
                      ),
                      width: (mediaQuery.size.width/4),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Footer(mediaQuery: mediaQuery,),
        ],
      ),
    );
  }
}