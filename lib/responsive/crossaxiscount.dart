import 'package:flutter/material.dart';

int getCycleGridCrossAxisCount(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.width;

  if(deviceWidth < 880)
    return 1;
  else if(deviceWidth <1500)
    return 2;
  else
    return 3;
}

int getFooterGridCrossAxisCount(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.width;

  if(deviceWidth < 850)
    return 2;
  else if(deviceWidth < 1200)
    return 4;
  else
    return 6;
}