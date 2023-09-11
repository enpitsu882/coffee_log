import 'package:flutter/material.dart';

import 'card_widget.dart';

class ProcessingField extends StatelessWidget {
  const ProcessingField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CardWidget(
      title: 'Processing',
      height: 140,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              'ハニープロセス',
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
