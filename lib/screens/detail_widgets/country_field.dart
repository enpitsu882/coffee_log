import 'package:country_picker/country_picker.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

import 'card_widget.dart';

class CountryField extends StatelessWidget {
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
              FlagsCode.values
                  .byName(selectedCountry?.countryCode ?? countryCode),
              height: 70,
            ),
          ),
          Text(
            selectedCountry?.nameLocalized ?? countryName,
            style: TextStyle(
                fontSize: 16, color: Theme.of(context).colorScheme.onPrimary),
          ),
        ],
      ),
      onTap: () => selectCountry(context),
    ));
  }
}
