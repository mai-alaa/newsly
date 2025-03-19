import 'package:flutter/material.dart';
import 'package:newslt/core/utils/app_styles.dart';
import 'package:newslt/core/utils/common_helper.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
   const CustomButton({super.key, required this.onTap, required this.text, this.image, required this.buttonColor, this.icon, required this.txtColor,  this.iconColor, this.width, this.height,  this.isLoading=false,});
  final VoidCallback onTap;
  final String text;
  final Color buttonColor;

   final Image? image;

  final IconData? icon;
  final Color txtColor;
  final Color? iconColor;
   final double? width;  
  final double? height; 
 final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null:onTap,
      
      child: Container(
   
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(50)
        ),
        width: width??double.infinity,
        height: height?? MediaQuery.sizeOf(context).height*0.07,
        child: isLoading ? showLoading(context,Colors.white,16): Center(child: Text(text,style: Styles.ralewayBold16(context).copyWith(color: txtColor),)),
      ),
    );
  }
}