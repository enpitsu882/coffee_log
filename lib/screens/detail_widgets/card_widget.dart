import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.title,
    required this.height,
    required this.content,
    required this.onTap,
  });

  final String title;
  final double height;
  final Widget content;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        margin: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: Theme.of(context).colorScheme.primary,
        child: InkWell(
          onTap: () => onTap(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              ),
              Expanded(child: content),
            ],
          ),
        ),
      ),
    );
  }
}
