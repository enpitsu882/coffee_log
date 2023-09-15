import 'package:flutter/material.dart';

import 'card_widget.dart';

class ProcessingField extends StatelessWidget {
  const ProcessingField({
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
    return Expanded(
      child: CardWidget(
        title: 'Processing',
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
                onChanged: (text) {
                  changeNameFieldString(text, 3);
                },
              ),
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
