import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../constants.dart';
import '../services/loan_calculator.service.dart';
import '../widgets/widgets.index.dart';

class MaximumLoanPage extends HookWidget {
  const MaximumLoanPage({Key? key}) : super(key: key);

  _getMaxBorrowable(
      double monthlyPayment, double interestRate, int loanMonths) {
    return calcMaxBorrowable(
      interestRate: interestRate,
      monthlyPayment: monthlyPayment,
      loanMonths: loanMonths,
    ).toString();
  }

  _getTotalCostByMonths(double monthlyPayment, int loanMonths) {
    return calcTotalCostByMonths(
      monthlyPayment: monthlyPayment,
      loanMonths: loanMonths,
    ).toString();
  }

  @override
  Widget build(BuildContext context) {
    final _monthlyPaymentController = useTextEditingController(text: '450.00');
    final _monthlyPaymentUpdate = useValueListenable(_monthlyPaymentController);
    useEffect(() {
      _monthlyPaymentController.text = _monthlyPaymentUpdate.text;
    }, [_monthlyPaymentController]);

    final _interestRateController = useTextEditingController(text: '3.11');
    final _interestRateUpdate = useValueListenable(_interestRateController);
    useEffect(() {
      _interestRateController.text = _interestRateUpdate.text;
    }, [_interestRateController]);

    final _loanPeriodController = useTextEditingController(text: '60');
    final _loanPeriodUpdate = useValueListenable(_loanPeriodController);
    useEffect(() {
      _loanPeriodController.text = _loanPeriodUpdate.text;
    }, [_loanPeriodController]);

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
              MonthlyPaymentInput(controller: _monthlyPaymentController),
              InterestRateInput(controller: _interestRateController),
              LoanPeriodInput(controller: _loanPeriodController),
              Text('Total Cost of Car Loan: ${_getTotalCostByMonths(
                double.parse(_monthlyPaymentController.text),
                int.parse(_loanPeriodController.text),
              )}'),
              Text('Maximum Borrowable Amount: ${_getMaxBorrowable(
                double.parse(_monthlyPaymentController.text),
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
