import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/splash_screen.dart';
import 'theme_provider.dart';
import 'language_provider.dart';
import 'data_provider.dart';

class ScientificApp extends StatelessWidget {
  const ScientificApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => DataProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'دانشمندان برجسته',
            theme: themeProvider.currentTheme,
            home: const SplashScreen(fromExit: false), // اصلاح شده: false
          );
        },
      ),
    );
  }
}