import 'package:flutter/material.dart';

import 'card_widget.dart';

class MeshField extends StatelessWidget {
  const MeshField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CardWidget(
        title: 'Mesh',
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
      ),
    );
  }
}
