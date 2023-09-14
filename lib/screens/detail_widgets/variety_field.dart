import 'package:flutter/material.dart';

import 'card_widget.dart';

class VarietyField extends StatelessWidget {
  const VarietyField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CardWidget(
      title: 'Variety',
      height: 140,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextFormField(
              controller: controller,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
        ],
      ),
      onTap: () {},
    ));
  }
}
