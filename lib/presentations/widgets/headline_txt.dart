import 'package:flutter/material.dart';
import 'package:newslt/core/utils/app_styles.dart';
import 'package:newslt/core/utils/screen_size.dart';

class HeadlineText extends StatelessWidget {
  const HeadlineText({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(text, style: Styles.bold34(context).copyWith(fontSize: ScreenSize.getResponsiveFontSize(context, 32),),textAlign: TextAlign.center,));
  }
}