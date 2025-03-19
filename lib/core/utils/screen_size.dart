import 'package:flutter/material.dart';

class ScreenSize {
  static late double screenWidth;
  static late double screenHeight;
   static late double blockSizeHorizontal;
  static late double blockSizeVertical;


  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;



     // Block sizes for responsive calculations
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    getScaleFactor(context);

  }

  static double getResponsiveFontSize(BuildContext context, double fontsize){
    double scaleFactor = getScaleFactor(context);

    double responsiveFontSize = fontsize * scaleFactor;
    double lowerLimit = fontsize * 0.8;
    double upperLimit = fontsize * 1.2;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);

  }
  static double getScaleFactor(BuildContext context){
    if (screenWidth< 600){
      return 0.8;
    } else if (screenWidth < 1200){
      return 1.0;
    } else {
      return 1.2;
    }
  }
}
