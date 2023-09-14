import 'package:flutter/material.dart';

import 'card_widget.dart';

class DateField extends StatelessWidget {
  const DateField({
    super.key,
    required this.selectedDate,
    required this.selectDate,
    required this.entryDate,
  });

  final DateTime? selectedDate;
  final Function selectDate;
  final DateTime entryDate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CardWidget(
        title: 'Date',
        height: 160,
        content: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                selectedDate != null
                    ? selectedDate!.year.toString()
                    : entryDate.year.toString(),
                style: const TextStyle(fontSize: 16, color: Color(0xFFCBCBCB)),
              ),
            ),
            Text(
              selectedDate != null
                  ? '${selectedDate!.month}/${selectedDate!.day}'
                  : '${entryDate.month}/${entryDate.day}',
              style: TextStyle(
                  fontSize: 54,
                  color: Theme.of(context).colorScheme.onPrimary,
                  height: 1.2),
            ),
          ],
        ),
        onTap: () => selectDate(context),
      ),
    );
  }
}
