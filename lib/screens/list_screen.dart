import 'package:flag/flag.dart';
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
          int index = 0;
          appState.entries.forEach((entryId, entry) {
            children.add(_ListItem(
              entryId: entryId,
              entry: entry,
              index: index,
            ));
            index++;
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
        if (context.mounted) context.go('/detail/$entryId');
      },
      shape: const CircleBorder(),
      child: const Icon(Icons.add),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    required this.entryId,
    required this.entry,
    required this.index,
  });

  final String entryId;
  final Entry entry;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Flag.fromString(
        entry.countryCode,
        height: 100,
        width: 50,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entry.countryName,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            (entry.producer == '' &&
                    entry.variety == '' &&
                    entry.processing == '')
                ? '未選択'
                : ((entry.producer == '' ? '' : '${entry.producer}　') +
                    (entry.variety == '' ? '' : '${entry.variety}　') +
                    entry.processing),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      trailing:
          Text('${entry.date.year}/${entry.date.month}/${entry.date.day}'),
      onTap: () {
        context.go('/detail/$entryId');
      },
      tileColor: index % 2 == 0 ? Theme.of(context).colorScheme.primary : null,
    );
  }
}
