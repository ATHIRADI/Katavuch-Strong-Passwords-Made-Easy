import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget customIcon;

  const CustomIconButton({
    super.key,
    this.onPressed,
    required this.customIcon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: customIcon,
    );
  }
}
