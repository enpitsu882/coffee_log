import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: LogInForm(),
          ),
        ),
      ),
    );
  }
}

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _mailadressTextController = TextEditingController();
  final _passwordTextControllers = TextEditingController();

  bool _formProgress = false;

  void _showWelcomeScreen() {
    Navigator.of(context).pushReplacementNamed('/list');
  }

  void _updateFormProgress() {
    var progress = _mailadressTextController.value.text.isNotEmpty &&
        _passwordTextControllers.value.text.isNotEmpty;

    setState(() {
      _formProgress = progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('ログイン', style: Theme.of(context).textTheme.headlineMedium),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _mailadressTextController,
              decoration: const InputDecoration(hintText: 'メールアドレス'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _passwordTextControllers,
              decoration: const InputDecoration(hintText: 'パスワード'),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.white;
              }),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Theme.of(context).colorScheme.primary;
              }),
            ),
            onPressed: _formProgress ? _showWelcomeScreen : null,
            child: const Text('ログインする'),
          ),
          RichText(
              text: TextSpan(
                  text: 'アカウントをお持ちでない場合',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).pushReplacementNamed('/signup');
                    }))
        ],
      ),
    );
  }
}
