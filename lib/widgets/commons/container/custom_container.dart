import 'package:flutter/material.dart';
import 'package:katavuch/constants/constants.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  double? width;
  double? height;
  CustomContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: KatavuchColors.gradientColor,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: child,
        ),
      ),
    );
  }
}
