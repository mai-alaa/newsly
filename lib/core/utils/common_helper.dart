import 'package:flutter/material.dart';
import 'package:newslt/core/utils/app_styles.dart';
import 'package:newslt/core/utils/screen_size.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


import 'package:fluttertoast/fluttertoast.dart';

String? validate(String value, String? feiledName) {
  if (value.isEmpty) {
    return 'Please enter your $feiledName';
  }
  return null;
}
class LabelFeiled extends StatelessWidget {
  const LabelFeiled({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return Text( text, style: Styles.ralewayBold16(context).copyWith(fontWeight: FontWeight.w800,),);
  }
}

  labelCommon(BuildContext context, String title, {margin}) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 15),
      child: Text(
       title,
         style:Styles.ralewayBold16(context).copyWith(color: Colors.grey[600],fontSize: ScreenSize.getResponsiveFontSize(context, 20)) ,

      ),
    );
  }
void showToast(String msg, Color? color) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

Future<bool> checkConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    showToast("Please turn on your internet connection", Colors.black);
    return false;
  } else {
    return true;
  }
}
   Widget showLoading(BuildContext context, Color color, double size) {
   return SpinKitSpinningLines(
      color: color,
      size: size,
    );
}
 void showErrorToasts(Map<String, List<String>>? errors, String generalError) {
    if (errors != null && errors.isNotEmpty) {
      // Show field-specific errors
      errors.forEach((field, messages) {
        for (var message in messages) {
          showToast(message, Colors.red);
        }
      });
    } else {
      // Show general error message
      showToast(generalError, Colors.red);
    }
  }
  bool isValidEmail(String email) {
  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  return emailRegex.hasMatch(email);
}