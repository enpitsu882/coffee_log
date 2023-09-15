import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  const NameField({
    super.key,
    required this.nameFieldString,
  });

  final List<String> nameFieldString;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          margin: const EdgeInsets.only(bottom: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          color: Theme.of(context).colorScheme.secondary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
              Text(
                nameFieldString[0],
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                (nameFieldString[1] == '' &&
                        nameFieldString[2] == '' &&
                        nameFieldString[3] == '')
                    ? '未選択'
                    : ((nameFieldString[1] == ''
                            ? ''
                            : '${nameFieldString[1]}　') +
                        (nameFieldString[2] == ''
                            ? ''
                            : '${nameFieldString[2]}　') +
                        nameFieldString[3]),
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
