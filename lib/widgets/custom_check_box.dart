import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final bool? value;
  final Function(bool?)? onChanged;
  const CustomCheckBox({
    super.key,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
    );
  }
}
