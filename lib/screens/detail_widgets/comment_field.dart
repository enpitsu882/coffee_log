import 'package:flutter/material.dart';

import 'card_widget.dart';

class CommentField extends StatelessWidget {
  const CommentField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CardWidget(
        title: 'Comment',
        height: 270,
        content: Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            controller: controller,
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.multiline,
            minLines: 6,
            maxLines: 6,
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
