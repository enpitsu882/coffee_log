import 'package:flutter/material.dart';

import 'card_widget.dart';

class RoastLevelField extends StatelessWidget {
  const RoastLevelField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CardWidget(
      title: 'Roast Level',
      height: 140,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              '中煎り',
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
