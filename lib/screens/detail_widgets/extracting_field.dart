import 'package:flutter/material.dart';

import 'card_widget.dart';

class ExtractingField extends StatelessWidget {
  const ExtractingField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CardWidget(
        title: 'Extracting',
        height: 110,
        content: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'ドリップ（V60）',
            style: TextStyle(
                fontSize: 24, color: Theme.of(context).colorScheme.onPrimary),
            textAlign: TextAlign.center,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
