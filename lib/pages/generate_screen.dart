import 'package:flutter/material.dart';
import 'package:katavuch/constants/constants.dart';
import 'package:katavuch/providers/password_provider.dart';
import 'package:katavuch/utils/utils.dart';
import 'package:katavuch/widgets/widgets.dart';
import 'package:provider/provider.dart';

class GenerateScreen extends StatelessWidget {
  const GenerateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final passwordGenerator = Provider.of<PasswordProvider>(context);

    return Scaffold(
      drawer: const CustomDrawer(),
      body: CustomContainer(
        width: width,
        height: double.infinity,
        child: Column(
          children: [
            verticalSizedBox(20.0),
            appbarWidget(
              context,
              Text(
                KatavuchStrings.homeTitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: KatavuchColors.extraColor),
              ),
              [
                CustomIconButton(
                  customIcon: const Icon(Icons.star),
                  //Playstore app review url
                  onPressed: () {},
                ),
              ],
            ),
            verticalSizedBox(20.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        KatavuchStrings.homePasswordTitle.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        passwordGenerator.passwordStrength.isEmpty
                            ? "Very Weak"
                            : passwordGenerator.passwordStrength,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: passwordGenerator.passwordStrength ==
                                          "Very Weak" ||
                                      passwordGenerator.passwordStrength.isEmpty
                                  ? Colors.red
                                  : passwordGenerator.passwordStrength == "Weak"
                                      ? Colors.red[300]
                                      : passwordGenerator.passwordStrength ==
                                              "Good"
                                          ? Colors.green[300]
                                          : Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  verticalSizedBox(15.0),
                  const PasswordResultSection(),
                  verticalSizedBox(30.0),
                  const PasswordLengthSection(),
                  verticalSizedBox(30.0),
                  const PasswordSettingsSection(),
                  verticalSizedBox(30.0),
                  Row(
                    children: [
                      Expanded(
                        child: CustomElavatedButton(
                          onPressed: () {
                            passwordGenerator.generatePassword(context);
                          },
                          child: Text(
                            KatavuchStrings.homePasswordGenerateBtn,
                          ),
                        ),
                      ),
                      horizontalSizedBox(20.0),
                      CustomElavatedButton(
                        onPressed: () {
                          passwordGenerator.passwordReset();
                        },
                        child: Text(
                          KatavuchStrings.homePasswordGenerateResetBtn,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
