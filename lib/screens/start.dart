import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Coffee Log',
                  style: Theme.of(context).textTheme.headlineMedium),
              RichText(
                  text: TextSpan(
                      text: 'ログイン',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushReplacementNamed('/login');
                        })),
              RichText(
                  text: TextSpan(
                      text: '新規登録',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushReplacementNamed('/signup');
                        }))
            ],
          ),
        ));
  }
}
