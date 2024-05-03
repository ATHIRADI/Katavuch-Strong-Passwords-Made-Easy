import 'package:flutter/material.dart';

class CustomElavatedButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  const CustomElavatedButton({
    super.key,
    this.onPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
