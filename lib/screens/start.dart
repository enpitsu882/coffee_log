import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

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
                text: 'はじめる',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.pushReplacement('/list');
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
