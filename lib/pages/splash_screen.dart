import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:katavuch/constants/constants.dart';
import 'package:katavuch/pages/pages.dart';
import 'package:katavuch/utils/utils.dart';
import 'package:katavuch/widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widthFull = MediaQuery.of(context).size.width;
    final heightFull = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomContainer(
        width: widthFull,
        height: heightFull,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSizedBox(heightFull / 2.5),
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
    );
  }
}
