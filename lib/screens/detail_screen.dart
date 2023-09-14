import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import '../entry.dart';
import 'detail_widgets/barrel.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.entryId,
    required this.entry,
  });
  final String entryId;
  final Entry entry;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Country? selectedCountry;
  late TextEditingController producerController =
      TextEditingController(text: widget.entry.producer);
  late TextEditingController roastLevelController =
      TextEditingController(text: widget.entry.roastLevel);
  late TextEditingController meshController =
      TextEditingController(text: widget.entry.mesh);
  late TextEditingController processingController =
      TextEditingController(text: widget.entry.processing);
  late TextEditingController varietyController =
      TextEditingController(text: widget.entry.variety);
  late TextEditingController extractingController =
      TextEditingController(text: widget.entry.extracting);
  late TextEditingController commentController =
      TextEditingController(text: widget.entry.comment);

  Future<void> _selectCountry(BuildContext context) async {
    showCountryPicker(
      context: context,
      countryListTheme: const CountryListThemeData(
        bottomSheetHeight: 500,
      ),
      onSelect: (Country country) {
        setState(() {
          selectedCountry = country;
        });
      },
    );
  }

  void _delete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('削除してもよろしいですか？'),
          actions: [
            TextButton(
              child: const Text('削除'),
              onPressed: () async {
                await Provider.of<AppState>(context, listen: false)
                    .deleteEntry(widget.entryId);
                if (context.mounted) context.go('/list');
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

  Future<void> _confirm(BuildContext context) async {
    Entry entry = Entry(
      date: widget.entry.date,
      countryName: selectedCountry?.nameLocalized ?? widget.entry.countryName,
      countryCode: selectedCountry?.countryCode ?? widget.entry.countryCode,
      producer: producerController.text != ''
          ? producerController.text
          : widget.entry.producer,
      roastLevel: roastLevelController.text != ''
          ? roastLevelController.text
          : widget.entry.roastLevel,
      mesh: meshController.text != '' ? meshController.text : widget.entry.mesh,
      processing: processingController.text != ''
          ? processingController.text
          : widget.entry.processing,
      variety: varietyController.text != ''
          ? varietyController.text
          : widget.entry.variety,
      extracting: extractingController.text != ''
          ? extractingController.text
          : widget.entry.extracting,
      comment: commentController.text != ''
          ? commentController.text
          : widget.entry.comment,
    );
    await Provider.of<AppState>(context, listen: false)
        .updateEntry(widget.entryId, entry);
    if (context.mounted) context.go('/list');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        _PersistentFooterButtons(
          delete: _delete,
          confirm: _confirm,
        )
      ],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Form(
              child: Column(
                children: [
                  NameField(),
                  Row(
                    children: [
                      DateField(),
                      CountryField(
                        selectedCountry: selectedCountry,
                        selectCountry: _selectCountry,
                        countryName: widget.entry.countryName,
                        countryCode: widget.entry.countryCode,
                      ),
                    ],
                  ),
                  ProducerField(controller: producerController),
                  Row(
                    children: [
                      RoastLevelField(controller: roastLevelController),
                      MeshField(controller: meshController),
                    ],
                  ),
                  Row(
                    children: [
                      ProcessingField(controller: processingController),
                      VarietyField(controller: varietyController),
                    ],
                  ),
                  ExtractingField(controller: extractingController),
                  CommentField(controller: commentController),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PersistentFooterButtons extends StatelessWidget {
  const _PersistentFooterButtons({
    required this.delete,
    required this.confirm,
  });

  final Function delete;
  final Function confirm;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _PersistentFooterButton(
          onTap: delete,
          backgroundColor: Theme.of(context).colorScheme.background,
          title: '削除',
        ),
        const SizedBox(width: 10),
        _PersistentFooterButton(
          onTap: confirm,
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
