import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoanPeriodInput extends StatelessWidget {
  final TextEditingController controller;

  const LoanPeriodInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: 'Loan Period (months)',
          border: OutlineInputBorder(),
          hintText: '60'),
      textAlign: TextAlign.right,
      maxLength: 2,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
    );
  }
}
