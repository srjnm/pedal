import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:pedal/models/cycle.dart';
import 'package:pedal/responsive/mobileSize.dart';
import 'package:pedal/responsive/switchposition.dart';
import 'package:pedal/widgets/cyclecard.dart';
import './widgets/header.dart';
import './widgets/footer.dart';
import './responsive/crossaxiscount.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color ={
      50:Color.fromRGBO(0, 0, 0, .1),
      100:Color.fromRGBO(0, 0, 0, .2),
      200:Color.fromRGBO(0, 0, 0, .3),
      300:Color.fromRGBO(0, 0, 0, .4),
      400:Color.fromRGBO(0, 0, 0, .5),
      500:Color.fromRGBO(0, 0, 0, .6),
      600:Color.fromRGBO(0, 0, 0, .7),
      700:Color.fromRGBO(0, 0, 0, .8),
      800:Color.fromRGBO(0, 0, 0, .9),
      900:Color.fromRGBO(0, 0, 0, 1),
    };

    MaterialColor dark = MaterialColor(0xFF000000, color);
    
    return MaterialApp(
      title: 'Pedal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: dark,
        canvasColor: dark,
      ),
      home: MyHomePage(title: 'Pedal'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 100.0,right: isMobileDevice(mediaQuery)?MediaQuery.of(context).size.width/16:MediaQuery.of(context).size.width/8),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: scaler.getHeight(25.0),
                    color: Color(0xFF070707),
                    child: Column(
                      mainAxisAlignment: switchPos(mediaQuery)?MainAxisAlignment.start:MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'When in Doubt,'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: 'Touche',
                            fontWeight: FontWeight.w700,
                            fontSize: scaler.getTextSize(10.0),
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Pedal',
                              style: TextStyle(
                                fontFamily: 'Touche',
                                fontWeight: FontWeight.w400,
                                fontSize: scaler.getTextSize(10.0),
                                letterSpacing: -0.8,
                                color: Color(0xFFD9901B),
                              ),
                            ),
                            Text(
                              ' it out.'.toUpperCase(),
                              style: TextStyle(
                                fontFamily: 'Touche',
                                fontWeight: FontWeight.w700,
                                fontSize: scaler.getTextSize(10.0),
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 250.0, bottom: 100.0),
                    color: Colors.white,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/8),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Explore Our',
                                  style: TextStyle(
                                    fontFamily: 'Touche',
                                    fontWeight: FontWeight.w700,
                                    fontSize: scaler.getTextSize(8.0),
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  ' Models',
                                  style: TextStyle(
                                    fontFamily: 'Touche',
                                    fontWeight: FontWeight.w700,
                                    fontSize: scaler.getTextSize(8.0),
                                    color: Color(0xFFD9901B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: cycles.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: getCycleGridCrossAxisCount(mediaQuery), mainAxisExtent: 300.0, crossAxisSpacing: 100.0, mainAxisSpacing: 30.0),
                            itemBuilder: (BuildContext context, int index){
                              return CycleCard(cycle: cycles[index]);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Footer(mediaQuery: mediaQuery,),
                ],
              ),
              Positioned(
                left: -(100+248000/MediaQuery.of(context).size.width),
                top: 100.0,
                child: Image(
                  image: AssetImage(
                    '../assets/images/home-bicycle.png',
                  ),
                  width: scaler.getWidth(100.0),
                ),
              ),
            ]
          ),
        ],
      ),
    );
  }
}