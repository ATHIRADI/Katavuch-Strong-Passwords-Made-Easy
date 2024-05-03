import 'package:flutter/material.dart';
import 'package:katavuch/constants/constants.dart';
import 'package:katavuch/providers/providers.dart';
import 'package:katavuch/utils/utils.dart';
import 'package:provider/provider.dart';
import 'custom_check_box.dart';

class PasswordSettingsSection extends StatelessWidget {
  const PasswordSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordGenerator = Provider.of<PasswordProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          KatavuchStrings.homeSettingsTitle.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        verticalSizedBox(15.0),
        Row(
          children: [
            CustomCheckBox(
              value: passwordGenerator.hasLowerCase,
              onChanged: (value) {
                passwordGenerator.setHasLowerCase(value!);
              },
            ),
            Text(
              KatavuchStrings.homeSettingsOptionLowercase.toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            horizontalSizedBox(20.0),
            CustomCheckBox(
              value: passwordGenerator.hasUpperCase,
              onChanged: (value) {
                passwordGenerator.setHasUpperCase(value!);
              },
            ),
            Text(
              KatavuchStrings.homeSettingsOptionUppercase.toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        Row(
          children: [
            CustomCheckBox(
              value: passwordGenerator.hasSpecial,
              onChanged: (value) {
                passwordGenerator.setHasSpecial(value!);
              },
            ),
            Text(
              KatavuchStrings.homeSettingsOptionSymbols.toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            horizontalSizedBox(20.0),
            CustomCheckBox(
              value: passwordGenerator.hasNumber,
              onChanged: (value) {
                passwordGenerator.setHasNumber(value!);
              },
            ),
            Text(
              KatavuchStrings.homeSettingsOptionNumbers.toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}
