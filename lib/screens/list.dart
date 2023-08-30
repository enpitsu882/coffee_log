import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import '../entry.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const _FloatingActionButton(),
      appBar: const _AppBar(),
      body: Consumer<AppState>(
        builder: (context, appState, _) {
          List<Widget> children = [];
          var listCount = 0;
          appState.entries.forEach((id, entry) {
            children.add(_ListItem(id: id, entry: entry, listCount: listCount));
            listCount++;
          });
          return ListView(
            children: children,
          );
        },
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.filter_list_alt),
      title: const Text('記録'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        String entryId =
            await Provider.of<AppState>(context, listen: false).addEntry();
        if (context.mounted) context.go('/detail');
      },
      shape: const CircleBorder(),
      child: const Icon(Icons.add),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    required this.id,
    required this.entry,
    required this.listCount,
  });

  final String id;
  final Entry entry;
  final int listCount;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.coffee),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(entry.country),
          Wrap(
            spacing: 12,
            children: [
              Text(entry.producer),
              Text(entry.variety),
              Text(entry.processing),
            ],
          ),
        ],
      ),
      trailing: const Text('2023/8/7'),
      onTap: () {
        // TODO: entryIdで飛ぶ
        context.go('/detail');
      },
      tileColor:
          listCount % 2 == 0 ? Theme.of(context).colorScheme.primary : null,
    );
  }
}
