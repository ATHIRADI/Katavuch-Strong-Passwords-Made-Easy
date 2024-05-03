import 'package:flutter/material.dart';
import 'package:katavuch/constants/constants.dart';
import 'package:katavuch/providers/providers.dart';
import 'package:katavuch/utils/utils.dart';
import 'package:provider/provider.dart';

class PasswordLengthSection extends StatefulWidget {
  const PasswordLengthSection({super.key});

  @override
  State<StatefulWidget> createState() => _PasswordLengthSectionState();
}

class _PasswordLengthSectionState extends State<PasswordLengthSection> {
  int passwordLength = 6;
  @override
  Widget build(BuildContext context) {
    final passwordGenerator = Provider.of<PasswordProvider>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              KatavuchStrings.homeLengthTitle.toUpperCase(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              passwordGenerator.passwordLength.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        verticalSizedBox(15.0),
        Slider(
          min: 6,
          max: 32,
          value: passwordGenerator.passwordLength.toDouble(),
          onChanged: (value) {
            setState(() {
              passwordGenerator.passwordLength = value.toInt();
            });
          },
        )
      ],
    );
  }
}
