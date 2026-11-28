import 'package:flutter/material.dart';

import 'screens/watches_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const canvas = Color(0xFFF7F6F1);
    const ink = Color(0xFF203A35);
    const accent = Color(0xFFB18A50);
    final colorScheme = ColorScheme.fromSeed(seedColor: ink, surface: canvas);

    return MaterialApp(
      title: 'Watches',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: colorScheme.copyWith(secondary: accent),
        useMaterial3: true,
        scaffoldBackgroundColor: canvas,
        appBarTheme: const AppBarTheme(
          backgroundColor: canvas,
          foregroundColor: ink,
          elevation: 0,
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(
            color: ink,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
          ),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Color(0xFFEAE8E1)),
          ),
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: ink,
            fontSize: 30,
            height: 1.15,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.8,
          ),
          titleLarge: TextStyle(
            color: ink,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.4,
          ),
          titleMedium: TextStyle(
            color: ink,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            color: Color(0xFF6D716D),
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ),
      home: const WatchesList(),
    );
  }
}
