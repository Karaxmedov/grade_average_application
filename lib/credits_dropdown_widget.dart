import 'package:flutter/material.dart';

import 'constants/app_constants.dart';
import 'helper/data_helper.dart';

class CreditsDropdownWidget extends StatefulWidget {
  final Function onSelectedCredits;

  const CreditsDropdownWidget({required this.onSelectedCredits, super.key});

  @override
  State<CreditsDropdownWidget> createState() => _CreditsDropdownWidgetState();
}

class _CreditsDropdownWidgetState extends State<CreditsDropdownWidget> {
  int selectedCredit = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropdownPadding,
      decoration: BoxDecoration(
          color: Constants.mainColor.shade100.withOpacity(0.4),
          borderRadius: Constants.borderRadius),
      child: DropdownButton<int>(
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade500,
        underline: Container(),
        value: selectedCredit,
        items: DataHelper.allCreditsDropdownItem(),
        onChanged: (value) {
          setState(
            () {
              selectedCredit = value!;
              widget.onSelectedCredits(selectedCredit);
            },
          );
        },
      ),
    );
  }
}
