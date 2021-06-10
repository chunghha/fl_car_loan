import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../constants.dart';
import '../services/loan_calculator.service.dart';
import '../widgets/widgets.index.dart';

class MaximumLoanPage extends HookWidget {
  const MaximumLoanPage({Key? key}) : super(key: key);

  _getMaxBorrowable(
      TextEditingController monthlyPaymentController,
      TextEditingController interestRateController,
      TextEditingController loanMonthsController) {
    var _monthlyPayment = monthlyPaymentController.text.isNotEmpty
        ? double.parse(monthlyPaymentController.text)
        : 0.00;
    var _interestRate = interestRateController.text.isNotEmpty
        ? double.parse(interestRateController.text)
        : 0.00;
    var _loanMonths = loanMonthsController.text.isNotEmpty
        ? int.parse(loanMonthsController.text)
        : 0;
    return calcMaxBorrowable(
      interestRate: _interestRate,
      monthlyPayment: _monthlyPayment,
      loanMonths: _loanMonths,
    ).toString();
  }

  _getTotalCostByMonths(TextEditingController monthlyPaymentController,
      TextEditingController loanMonthsController) {
    var _monthlyPayment = monthlyPaymentController.text.isNotEmpty
        ? double.parse(monthlyPaymentController.text)
        : 0.00;
    var _loanMonths = loanMonthsController.text.isNotEmpty
        ? int.parse(loanMonthsController.text)
        : 0;
    return calcTotalCostByMonths(
      monthlyPayment: _monthlyPayment,
      loanMonths: _loanMonths,
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
                _monthlyPaymentController,
                _loanPeriodController,
              )}'),
              Text('Maximum Borrowable Amount: ${_getMaxBorrowable(
                _monthlyPaymentController,
                _interestRateController,
                _loanPeriodController,
              )}'),
            ],
          ),
        ),
      ],
    );
  }
}
