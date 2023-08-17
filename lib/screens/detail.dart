import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import 'package:country_picker/country_picker.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      persistentFooterButtons: [_PersistentFooterButtons()],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                _NameField(),
                Row(
                  children: [_DateField(), _CountryField()],
                ),
                _ProducerField(),
                Row(
                  children: [_RoastLevelField(), _MeshField()],
                ),
                Row(
                  children: [_ProcessingField(), _VarietyField()],
                ),
                _ExtractingField(),
                _CommentField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PersistentFooterButtons extends StatelessWidget {
  const _PersistentFooterButtons();

  void _delete(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('削除してもよろしいですか？'),
          actions: [
            CupertinoDialogAction(
              child: const Text('削除'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
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
    Navigator.of(context).pushReplacementNamed('/list');
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

class _CommentField extends StatelessWidget {
  const _CommentField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: _CardWidget(
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

class _ExtractingField extends StatelessWidget {
  const _ExtractingField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: _CardWidget(
        title: 'Extracting',
        height: 110,
        content: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'ドリップ（V60）',
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

class _VarietyField extends StatelessWidget {
  const _VarietyField();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: _CardWidget(
      title: 'Variety',
      height: 140,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              'ミレニオ',
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ],
      ),
      onTap: () {},
    ));
  }
}

class _ProcessingField extends StatelessWidget {
  const _ProcessingField();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: _CardWidget(
      title: 'Processing',
      height: 140,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              'ハニープロセス',
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ],
      ),
      onTap: () {},
    ));
  }
}

class _MeshField extends StatelessWidget {
  const _MeshField();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: _CardWidget(
      title: 'Mesh',
      height: 140,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              '細挽き',
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ],
      ),
      onTap: () {},
    ));
  }
}

class _RoastLevelField extends StatelessWidget {
  const _RoastLevelField();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: _CardWidget(
      title: 'Roast Level',
      height: 140,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              '中煎り',
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ],
      ),
      onTap: () {},
    ));
  }
}

class _ProducerField extends StatefulWidget {
  const _ProducerField();

  @override
  State<_ProducerField> createState() => _ProducerFieldState();
}

class _ProducerFieldState extends State<_ProducerField> {
  String? selectedProducer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: _CardWidget(
        title: 'Producer',
        height: 110,
        content: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            '$selectedProducer',
            style: TextStyle(
                fontSize: 24, color: Theme.of(context).colorScheme.onPrimary),
            textAlign: TextAlign.center,
          ),
        ),
        onTap: () => _selectProducer(context),
      ),
    );
  }

  Future<void> _selectProducer(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('生産地を選択してください'),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    selectedProducer = 'Las Margaritas';
                  });
                  Navigator.pop(context);
                },
                child: const Text('Las Margaritas'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    selectedProducer = 'Other';
                  });
                  Navigator.pop(context);
                },
                child: const Text('Other'),
              ),
              SimpleDialogOption(
                onPressed: () {},
                child: const Text('選択肢を追加する'),
              )
            ],
          );
        });
  }
}

class _CountryField extends StatefulWidget {
  const _CountryField();

  @override
  State<_CountryField> createState() => _CountryFieldState();
}

class _CountryFieldState extends State<_CountryField> {
  Country? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: _CardWidget(
      title: 'Country',
      height: 160,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: Flag.fromCode(
              selectedCountry != null
                  ? FlagsCode.values.byName(selectedCountry!.countryCode)
                  : FlagsCode.JP,
              height: 70,
            ),
          ),
          Text(
            selectedCountry?.name ?? 'Unknown',
            style: TextStyle(
                fontSize: 16, color: Theme.of(context).colorScheme.onPrimary),
          ),
        ],
      ),
      onTap: () => _selectCountry(context),
    ));
  }

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
}

class _DateField extends StatefulWidget {
  const _DateField();

  @override
  State<_DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<_DateField> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: _CardWidget(
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
    ));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020),
        lastDate: DateTime(2025));

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}

class _NameField extends StatelessWidget {
  const _NameField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
            margin: const EdgeInsets.only(bottom: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
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
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                ),
                Text(
                  'コスタリカ\nラスマルガリタス　ミレニオ　ハニー',
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onPrimary),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
      ),
    );
  }
}

class _CardWidget extends StatelessWidget {
  const _CardWidget({
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
          )),
    );
  }
}
