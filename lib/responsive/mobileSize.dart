import 'package:flutter/material.dart';

bool isMobileDevice(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.width;

  if(deviceWidth < 880)
    return true;
  else
    return false;
}

bool isLessThan460(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.width;

  if(deviceWidth < 460)
    return true;
  else
    return false;
}