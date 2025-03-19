import 'package:flutter/material.dart';

extension SizedBoxExtention on int{
  Widget get toHeight{
    return SizedBox(
      height: toDouble(),
    );
  }
  Widget get toWidth{
    return SizedBox(
      width: toDouble(),
    );
  }
}