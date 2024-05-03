import 'package:flutter/material.dart';
import 'package:katavuch/constants/constants.dart';
import 'package:katavuch/utils/utils.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    KatavuchStrings.splashTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    KatavuchStrings.splashSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            verticalSizedBox(20.0),

            // App Version
            ListTile(
              leading: Icon(
                Icons.warning,
                color: KatavuchColors.extraColor,
              ),
              title: Text(
                KatavuchStrings.appVersion,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () {},
            ),

            // App Privacy Policy
            ListTile(
              leading: Icon(
                Icons.privacy_tip,
                color: KatavuchColors.extraColor,
              ),
              title: Text(
                KatavuchStrings.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
