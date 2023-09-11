import 'package:flutter/material.dart';

import 'card_widget.dart';

class DateField extends StatefulWidget {
  const DateField({super.key});

  @override
  State<DateField> createState() => DateFieldState();
}

class DateFieldState extends State<DateField> {
  DateTime selectedDate = DateTime.now();

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
                '${selectedDate.year}',
                style: const TextStyle(fontSize: 16, color: Color(0xFFCBCBCB)),
              ),
            ),
            Text(
              '${selectedDate.month}/${selectedDate.day}',
              style: TextStyle(
                  fontSize: 54,
                  color: Theme.of(context).colorScheme.onPrimary,
                  height: 1.2),
            ),
          ],
        ),
        onTap: () => _selectDate(context),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
