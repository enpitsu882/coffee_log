import 'package:flutter/material.dart';

import 'card_widget.dart';

class CommentField extends StatelessWidget {
  const CommentField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CardWidget(
        title: 'Comment',
        height: 270,
        content: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'メモ欄。自由記入',
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
