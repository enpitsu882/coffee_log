import 'package:flutter/material.dart';

import 'card_widget.dart';

class MeshField extends StatelessWidget {
  const MeshField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CardWidget(
      title: 'Mesh',
      height: 140,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              '細挽き',
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
