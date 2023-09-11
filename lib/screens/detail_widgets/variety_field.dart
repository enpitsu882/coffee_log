import 'package:flutter/material.dart';

import 'card_widget.dart';

class VarietyField extends StatelessWidget {
  const VarietyField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CardWidget(
      title: 'Variety',
      height: 140,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              'ミレニオ',
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ],
      ),
      onTap: () {},
    ));
  }
}
