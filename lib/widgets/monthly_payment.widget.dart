import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/decimal_input_formater.dart';

class MonthlyPaymentInput extends StatelessWidget {
  final TextEditingController controller;

  const MonthlyPaymentInput({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: 'Monthly Payment',
          border: OutlineInputBorder(),
          hintText: '450.00'),
      textAlign: TextAlign.right,
      maxLength: 7,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
        DecimalTextInputFormatter(decimalRange: 2),
      ],
    );
  }
}
