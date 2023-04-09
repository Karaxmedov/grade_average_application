import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'constants/app_constants.dart';
import 'helper/data_helper.dart';

class LetterDropdownWidget extends StatefulWidget {
  final Function onSelectedLetter;

  const LetterDropdownWidget({required this.onSelectedLetter, super.key});

  @override
  State<LetterDropdownWidget> createState() => _LetterDropdownWidgetState();
}

class _LetterDropdownWidgetState extends State<LetterDropdownWidget> {
  double selectedLetter = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropdownPadding,
      decoration: BoxDecoration(
          color: Constants.mainColor.shade100.withOpacity(0.4),
          borderRadius: Constants.borderRadius),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade500,
        underline: Container(),
        value: selectedLetter,
        items: DataHelper.allLetterDropdownItem(),
        onChanged: (value) {
          setState(
            () {
              selectedLetter = value!;
              widget.onSelectedLetter(selectedLetter);
            },
          );
        },
      ),
    );
  }
}
