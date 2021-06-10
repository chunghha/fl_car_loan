import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/decimal_input_formater.dart';

class LoanAmountInput extends StatelessWidget {
  final TextEditingController controller;

  const LoanAmountInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: 'Loan Amount',
          border: OutlineInputBorder(),
          hintText: '25000.00'),
      textAlign: TextAlign.right,
      maxLength: 9,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
        DecimalTextInputFormatter(decimalRange: 2),
      ],
    );
  }
}
