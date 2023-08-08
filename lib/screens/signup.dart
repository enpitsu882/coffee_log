import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
          Text('新規登録', style: Theme.of(context).textTheme.headlineMedium),
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
            child: const Text('登録する'),
          ),
          RichText(
              text: TextSpan(
                  text: 'アカウントをお持ちの場合',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).pushReplacementNamed('/login');
                    }))
        ],
      ),
    );
  }
}
