import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';
import 'card_widget.dart';

class ProducerField extends StatelessWidget {
  const ProducerField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CardWidget(
        title: 'Producer',
        height: 110,
        content: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'producer',
            style: TextStyle(
                fontSize: 24, color: Theme.of(context).colorScheme.onPrimary),
            textAlign: TextAlign.center,
          ),
        ),
        onTap: () => showDialog(
          context: context,
          builder: (context) {
            return const _SelectProducer();
          },
        ),
      ),
    );
  }
}

class _SelectProducer extends StatelessWidget {
  const _SelectProducer();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        return SimpleDialog(
          title: const Text('生産地を選択してください'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                // appState.setSelectedProducer = 'Las Margaritas';
                Navigator.pop(context);
              },
              child: const Text('Las Margaritas'),
            ),
            SimpleDialogOption(
              onPressed: () {
                // appState.setSelectedProducer = 'Other';
                Navigator.pop(context);
              },
              child: const Text('Other'),
            ),
            SimpleDialogOption(
              onPressed: () {},
              child: const Text('選択肢を追加する'),
            ),
          ],
        );
      },
    );
  }
}
