import 'package:flutter/material.dart';

import 'card_widget.dart';

class ExtractingField extends StatelessWidget {
  const ExtractingField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CardWidget(
        title: 'Extracting',
        height: 110,
        content: TextFormField(
          controller: controller,
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          textAlign: TextAlign.center,
          decoration: const InputDecoration(border: InputBorder.none),
        ),
        onTap: () {},
      ),
    );
  }
}
