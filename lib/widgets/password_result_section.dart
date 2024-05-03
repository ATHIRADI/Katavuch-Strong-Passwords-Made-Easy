import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:katavuch/constants/constants.dart';
import 'package:katavuch/utils/utils.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import 'widgets.dart';

class PasswordResultSection extends StatelessWidget {
  const PasswordResultSection({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordGenerator = Provider.of<PasswordProvider>(context);

    return Container(
      width: double.infinity,
      color: KatavuchColors.whiteColor,
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            passwordGenerator.password.isEmpty
                ? "Your Password Will Be Here"
                : passwordGenerator.password,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: KatavuchColors.brownColor,
                ),
          ),
          CustomIconButton(
            onPressed: () {
              if (passwordGenerator.password.isNotEmpty) {
                Clipboard.setData(
                  ClipboardData(
                    text: passwordGenerator.password,
                  ),
                );
                showSnackBar(context, passwordGenerator.password.toString());
                passwordGenerator
                    .passwordCopied(passwordGenerator.password.toString());
              }
            },
            customIcon: const Icon(Icons.copy),
          )
        ],
      ),
    );
  }
}
