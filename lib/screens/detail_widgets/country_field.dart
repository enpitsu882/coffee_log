import 'package:country_picker/country_picker.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

import 'card_widget.dart';

class CountryField extends StatefulWidget {
  const CountryField({super.key});

  @override
  State<CountryField> createState() => CountryFieldState();
}

class CountryFieldState extends State<CountryField> {
  Country? selectedCountry;

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
              selectedCountry != null
                  ? FlagsCode.values.byName(selectedCountry!.countryCode)
                  : FlagsCode.XX,
              height: 70,
            ),
          ),
          Text(
            selectedCountry?.nameLocalized ?? '未選択',
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
