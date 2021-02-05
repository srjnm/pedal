import 'package:flutter/material.dart';

bool switchPos(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.width;

  if(deviceWidth < 1080)
    return true;
  else
    return false;
}

bool switchToCol(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.width;

  if(deviceWidth < 1170)
    return true;
  else
    return false;
}