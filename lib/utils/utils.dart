import 'package:flutter/material.dart';
import 'package:katavuch/constants/constants.dart';

// customContainer({
//   required child,
//   double? width,
//   double? height,
// }) {
//   return Container(
//     width: width,
//     height: height,
//     decoration: BoxDecoration(
//       gradient: KatavuchColors.gradientColor,
//     ),
//     child: SafeArea(
//       child: child,
//     ),
//   );
// }

Widget verticalSizedBox(double h) {
  return SizedBox(
    height: h,
  );
}

Widget horizontalSizedBox(double w) {
  return SizedBox(
    width: w,
  );
}

Widget appbarWidget(context, title, List<Widget>? actions) {
  return AppBar(
    backgroundColor: KatavuchColors.transparentColor,
    foregroundColor: KatavuchColors.extraColor,
    title: title,
    actions: actions,
  );
}

showSnackBar(context, String text) {
  SnackBar snackBar = SnackBar(
    content: Text(text),
    dismissDirection: DismissDirection.up,
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}
