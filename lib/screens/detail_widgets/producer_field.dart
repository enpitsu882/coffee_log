import 'package:flutter/material.dart';

import 'card_widget.dart';

class ProducerField extends StatelessWidget {
  const ProducerField({
    super.key,
    required this.controller,
    required this.nameFieldString,
    required this.changeNameFieldString,
  });

  final TextEditingController controller;
  final List<String> nameFieldString;
  final Function changeNameFieldString;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CardWidget(
        title: 'Producer',
        height: 110,
        content: TextFormField(
          controller: controller,
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          textAlign: TextAlign.center,
          decoration: const InputDecoration(border: InputBorder.none),
          onChanged: (text) {
            changeNameFieldString(text, 1);
          },
        ),
        onTap: () {},
      ),
    );
  }
}
