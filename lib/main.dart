import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:meals_app/screens/tab_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 131, 57, 0),
    brightness: Brightness.dark,
    // background: Colors.black
  ),
  textTheme: GoogleFonts.latoTextTheme(),
  // appBarTheme: const AppBarTheme(
  //     backgroundColor: Colors.black, foregroundColor: Colors.white)
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
