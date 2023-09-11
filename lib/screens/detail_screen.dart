import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import '../entry.dart';
import 'detail_widgets/barrel.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.entryId,
  });
  final String entryId;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        Entry? editEntry = appState.entries[entryId];

        if (editEntry == null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('ページが見つかりません'),
            ),
          );
        }

        // appState.setSelectedProducer = appState.entries[entryId]!.producer;

        return const Scaffold(
          persistentFooterButtons: [_PersistentFooterButtons()],
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    NameField(),
                    Row(
                      children: [DateField(), CountryField()],
                    ),
                    ProducerField(),
                    Row(
                      children: [RoastLevelField(), MeshField()],
                    ),
                    Row(
                      children: [ProcessingField(), VarietyField()],
                    ),
                    ExtractingField(),
                    CommentField(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PersistentFooterButtons extends StatelessWidget {
  const _PersistentFooterButtons();

  void _delete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('削除してもよろしいですか？'),
          actions: [
            TextButton(
              child: const Text('削除'),
              onPressed: () {
                // TODO: 現在表示しているデータをfirestoreから削除する
                context.go('/list');
              },
            ),
            TextButton(
              child: const Text('戻る'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _confirm(BuildContext context) {
    // TODO: 入力されたデータをfirestoreに上書き保存する
    context.go('/list');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _PersistentFooterButton(
          onTap: _delete,
          backgroundColor: Theme.of(context).colorScheme.background,
          title: '削除',
        ),
        const SizedBox(width: 10),
        _PersistentFooterButton(
          onTap: _confirm,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: '確認',
        ),
      ],
    );
  }
}

class _PersistentFooterButton extends StatelessWidget {
  const _PersistentFooterButton({
    required this.onTap,
    required this.backgroundColor,
    required this.title,
  });

  final String title;
  final Function onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => onTap(context),
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(70),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: backgroundColor,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
