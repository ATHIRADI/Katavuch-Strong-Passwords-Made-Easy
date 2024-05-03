import 'package:flutter/material.dart';
import 'package:katavuch/providers/providers.dart';
import 'package:katavuch/utils/theme.dart';
import "package:provider/provider.dart";

import 'pages/pages.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PasswordProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'katavuch',
      debugShowCheckedModeBanner: false,
      theme: katavuchTheme,
      home: const SplashScreen(),
    );
  }
}
