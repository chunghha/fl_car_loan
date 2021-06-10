import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/decimal_input_formater.dart';

class InterestRateInput extends StatelessWidget {
  final TextEditingController controller;

  const InterestRateInput({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: 'Interest Rate (%)',
          border: OutlineInputBorder(),
          hintText: '3.11'),
      textAlign: TextAlign.right,
      maxLength: 5,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
        DecimalTextInputFormatter(decimalRange: 2),
      ],
    );
  }
}
