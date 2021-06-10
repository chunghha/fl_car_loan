import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../constants.dart';
import '../services/loan_calculator.service.dart';
import '../widgets/widgets.index.dart';

class MonthlyCostPage extends HookWidget {
  const MonthlyCostPage({Key? key}) : super(key: key);

  _getMonthlyPayment(double loanAmount, double interestRate, int loanMonths) {
    return calcMonthlyPayment(
      loanAmount: loanAmount,
      interestRate: interestRate,
      loanMonths: loanMonths,
    ).toString();
  }

  _getTotalCost(double loanAmount, double interestRate, int loanMonths) {
    return calcTotalCost(
      loanAmount: loanAmount,
      interestRate: interestRate,
      loanMonths: loanMonths,
    ).toString();
  }

  @override
  Widget build(BuildContext context) {
    final _loanAmountController = useTextEditingController(text: '25000.00');
    final _interestRateController = useTextEditingController(text: '3.11');
    final _loanPeriodController = useTextEditingController(text: '60');

    return Column(
      children: [
        paddingBox(padding: 32),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300),
          child: Wrap(
            spacing: defaultPadding * 2,
            runSpacing: defaultPadding * 2,
            alignment: WrapAlignment.center,
            children: [
              LoanAmountInput(controller: _loanAmountController),
              InterestRateInput(controller: _interestRateController),
              LoanPeriodInput(controller: _loanPeriodController),
              Text('Total Cost of Car Loan: ${_getTotalCost(
                double.parse(_loanAmountController.text),
                double.parse(_interestRateController.text),
                int.parse(_loanPeriodController.text),
              )}'),
              Text('Monthly Payment: ${_getMonthlyPayment(
                double.parse(_loanAmountController.text),
                double.parse(_interestRateController.text),
                int.parse(_loanPeriodController.text),
              )}'),
            ],
          ),
        ),
      ],
    );
  }
}
