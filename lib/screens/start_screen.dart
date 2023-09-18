import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

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
            const Icon(
              Icons.coffee,
              size: 300,
            ),
            Text(
              'Coffee Log',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Consumer<AppState>(
              builder: (context, appState, _) => Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'はじめる',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          if (appState.user != null) {
                            context.go('/list');
                          } else {
                            context.go('/signin');
                          }
                        },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
