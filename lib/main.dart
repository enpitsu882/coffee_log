import 'dart:io';

import 'package:coffee_log/screens/auth.dart';
import 'package:coffee_log/screens/detail.dart';
import 'package:coffee_log/screens/start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupwindow();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
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

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Log',
      theme: _themeData(),
      home: const StartScreen(),
      routes: {
        '/auth': (context) => const AuthGate(),
        '/detail': (context) => const DetailScreen(),
      },
    );
  }

  ThemeData _themeData() {
    return ThemeData(
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
        onSurface: Color(0xFFF3F2F2),
      ),
    );
  }
}
