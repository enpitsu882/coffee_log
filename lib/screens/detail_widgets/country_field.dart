import 'package:country_picker/country_picker.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

import 'card_widget.dart';

class CountryField extends StatefulWidget {
  const CountryField({
    super.key,
    required this.selectedCountry,
    required this.selectCountry,
    required this.countryName,
    required this.countryCode,
  });

  final Country? selectedCountry;
  final Function selectCountry;
  final String countryName;
  final String countryCode;

  @override
  State<CountryField> createState() => CountryFieldState();
}

class CountryFieldState extends State<CountryField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CardWidget(
      title: 'Country',
      height: 160,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: Flag.fromCode(
              FlagsCode.values.byName(
                  widget.selectedCountry?.countryCode ?? widget.countryCode),
              height: 70,
            ),
          ),
          Text(
            widget.selectedCountry?.nameLocalized ?? widget.countryName,
            style: TextStyle(
                fontSize: 16, color: Theme.of(context).colorScheme.onPrimary),
          ),
        ],
      ),
      onTap: () => widget.selectCountry(context),
    ));
  }
}
