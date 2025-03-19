
import 'package:flutter/material.dart';
import 'package:newslt/core/utils/constants.dart';
import 'package:newslt/core/utils/screen_size.dart';

abstract class Styles{
 
  static TextStyle ralewayBold16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: ScreenSize.getResponsiveFontSize(context, 16), // Base font size is 16
     
    );
  }

  static TextStyle viewMoreText(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: kPrimaryColor,
      fontSize: ScreenSize.getResponsiveFontSize(context, 20), // Base font size is 18
    );
  }

  static TextStyle category(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: kPrimaryColor,
      fontSize: ScreenSize.getResponsiveFontSize(context, 14), // Base font size is 12
       overflow: TextOverflow.ellipsis,
      
    );
  }

  static TextStyle bold34(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: kPrimaryColor,
      fontSize: ScreenSize.getResponsiveFontSize(context, 34), // Base font size is 34
    );
  }

  static TextStyle poppinsReg16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      color: kPrimaryColor,
      fontSize: ScreenSize.getResponsiveFontSize(context, 16), // Base font size is 16
      fontFamily: 'Raleway',
    );
  }

  static TextStyle relwayBold26(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: ScreenSize.getResponsiveFontSize(context, 26), // Base font size is 26
      fontFamily: 'Raleway',
    );
  }

}