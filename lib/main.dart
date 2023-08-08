import 'dart:io';

import 'package:coffee_log/screens/list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

import 'screens/detail.dart';
import 'screens/signup.dart';
import 'screens/login.dart';
// import 'screens/start.dart';

void main() {
  setupwindow();
  runApp(const MyApp());
}

void setupwindow() {
  const double windowWidth = 400;
  const double windowHeight = 700;

  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowMinSize(const Size(windowWidth, windowHeight));
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen) {
      setWindowFrame(Rect.fromCenter(
        center: screen!.frame.center,
        width: windowWidth,
        height: windowHeight,
      ));
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Log',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: Color(0xFFB04747),
              onPrimary: Color(0xFFF3F2F2),
              secondary: Color(0xFF3D6785),
              onSecondary: Color(0xFF8D8D8D),
              error: Colors.red,
              onError: Colors.transparent,
              background: Color(0xFF721919),
              onBackground: Color(0xFF8D8D8D),
              surface: Color(0xFF721919),
              onSurface: Color(0xFFF3F2F2))),
      routes: {
        '/': (context) => const ListScreen(),
        // '/': (context) => const StartScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/login': (context) => const LogInScreen(),
        '/detail': (context) => const DetailScreen(),
        '/list': (context) => const ListScreen(),
      },
    );
  }
}
