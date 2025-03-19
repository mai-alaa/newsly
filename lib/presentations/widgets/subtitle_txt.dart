import 'package:flutter/material.dart';
import 'package:newslt/core/utils/app_styles.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return   Align(
       alignment: Alignment.center,
       child: Text(text, style: Styles.poppinsReg16(context),textAlign:TextAlign.center));
  }
}