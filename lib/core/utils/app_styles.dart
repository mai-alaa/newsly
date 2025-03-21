
import 'package:flutter/material.dart';
import 'package:newslt/core/utils/constants.dart';
import 'package:newslt/core/utils/screen_size.dart';

abstract class Styles{
 
  static TextStyle ralewayBold16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: ScreenSize.getResponsiveFontSize(context, 16), 
     
    );
  }

  static TextStyle viewMoreText(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: kPrimaryColor,
      fontSize: ScreenSize.getResponsiveFontSize(context, 20), 
    );
  }

  static TextStyle category(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: kPrimaryColor,
      fontSize: ScreenSize.getResponsiveFontSize(context, 14), 
       overflow: TextOverflow.ellipsis,
      
    );
  }

  static TextStyle bold34(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: kPrimaryColor,
      fontSize: ScreenSize.getResponsiveFontSize(context, 34), 
    );
  }

  static TextStyle poppinsReg16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      color: kPrimaryColor,
      fontFamily: 'Raleway',
    );
  }

  static TextStyle relwayReg22(BuildContext context) {
    return TextStyle(
      fontSize: ScreenSize.getResponsiveFontSize(context, 22),
      fontWeight: FontWeight.w400,
      color: kPrimaryColor,
      fontFamily: 'Raleway',
    );
  }

  static TextStyle relwayBold26(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: ScreenSize.getResponsiveFontSize(context, 26), 
      fontFamily: 'Raleway',
    );
  }
static TextStyle relwayBold14 (BuildContext context){
return TextStyle(
                      fontSize: ScreenSize.getResponsiveFontSize(context, 14),
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway',
                    );
}
    static TextStyle relwayBold18(BuildContext context) {
    return TextStyle(
                      fontSize: ScreenSize.getResponsiveFontSize(context, 18),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Raleway',
                    );
  }
 static TextStyle relwayReg14(BuildContext context) {
    return  TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontFamily: 'Raleway',
                    );
  }
   static TextStyle relwayReg12(BuildContext context) {
    return  TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    );
  }
    static TextStyle relwayBold28(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: ScreenSize.getResponsiveFontSize(context, 28), 
      fontFamily: 'Raleway',
    );
  }
}
