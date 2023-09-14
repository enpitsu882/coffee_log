import 'package:coffee_log/entry.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'screens/detail_screen.dart';
import 'screens/list_screen.dart';
import 'screens/start_screen.dart';

Future<void> main() async {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Coffee Log',
      theme: _themeData(),
      localizationsDelegates: [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FirebaseUILocalizations.delegate,
      ],
      supportedLocales: const [Locale('ja')],
      routerConfig: _router(),
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

  GoRouter _router() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const StartScreen(),
          routes: [
            GoRoute(
              path: 'signin',
              builder: (context, state) => _signInScreen(),
            ),
            GoRoute(
              path: 'list',
              builder: (context, state) => const ListScreen(),
            ),
            GoRoute(
              path: 'detail/:entryId',
              builder: (context, state) {
                String? params = state.pathParameters['entryId'];
                Entry? entry = Provider.of<AppState>(context, listen: false)
                    .entries[params];
                if (params == null || entry == null) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('ページが見つかりません'),
                    ),
                  );
                }
                return DetailScreen(entryId: params, entry: entry);
              },
            ),
          ],
        ),
      ],
    );
  }

  SignInScreen _signInScreen() {
    return SignInScreen(
      actions: [
        AuthStateChangeAction((context, state) {
          final user = switch (state) {
            SignedIn state => state.user,
            UserCreated state => state.credential.user,
            _ => null
          };
          if (user == null) {
            return;
          }
          if (state is UserCreated) {
            user.updateDisplayName(user.email!.split('@')[0]);
          }
          context.go('/list');
        }),
      ],
    );
  }
}
