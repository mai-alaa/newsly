import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
   final int itemCount;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final IndexedWidgetBuilder itemBuilder;
  const CustomGridView({super.key, required this.itemCount, required this.crossAxisCount, required this.crossAxisSpacing, required this.mainAxisSpacing, required this.childAspectRatio, required this.itemBuilder});

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount ,
          padding: EdgeInsets.zero,
      gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,

         crossAxisSpacing: crossAxisSpacing,

          mainAxisSpacing: mainAxisSpacing,
          
          childAspectRatio: childAspectRatio,
        ), itemBuilder:itemBuilder);
  }
}