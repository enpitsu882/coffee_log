import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  const NameField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
            margin: const EdgeInsets.only(bottom: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            color: Theme.of(context).colorScheme.secondary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: Text(
                    'Name',
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                ),
                Text(
                  'コスタリカ\nラスマルガリタス　ミレニオ　ハニー',
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onPrimary),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
      ),
    );
  }
}
