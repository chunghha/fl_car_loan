import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../constants.dart';
import '../services/loan_calculator.service.dart';
import '../widgets/widgets.index.dart';

class MonthlyCostPage extends HookWidget {
  const MonthlyCostPage({Key? key}) : super(key: key);

  _getMonthlyPayment(
      TextEditingController loanAmountController,
      TextEditingController interestRateController,
      TextEditingController loanMonthsController) {
    var _loanAmount = loanAmountController.text.isNotEmpty
        ? double.parse(loanAmountController.text)
        : 0.00;
    var _interestRate = interestRateController.text.isNotEmpty
        ? double.parse(interestRateController.text)
        : 0.00;
    var _loanMonths = loanMonthsController.text.isNotEmpty
        ? int.parse(loanMonthsController.text)
        : 0;

    return calcMonthlyPayment(
      loanAmount: _loanAmount,
      interestRate: _interestRate,
      loanMonths: _loanMonths,
    ).toString();
  }

  _getTotalCost(
      TextEditingController loanAmountController,
      TextEditingController interestRateController,
      TextEditingController loanMonthsController) {
    var _loanAmount = loanAmountController.text.isNotEmpty
        ? double.parse(loanAmountController.text)
        : 0.00;
    var _interestRate = interestRateController.text.isNotEmpty
        ? double.parse(interestRateController.text)
        : 0.00;
    var _loanMonths = loanMonthsController.text.isNotEmpty
        ? int.parse(loanMonthsController.text)
        : 0;

    return calcTotalCost(
      loanAmount: _loanAmount,
      interestRate: _interestRate,
      loanMonths: _loanMonths,
    ).toString();
  }

  @override
  Widget build(BuildContext context) {
    final _loanAmountController = useTextEditingController(text: '25000.00');
    final _loanAmountUpdate = useValueListenable(_loanAmountController);
    useEffect(() {
      _loanAmountController.text = _loanAmountUpdate.text;
    }, [_loanAmountController]);

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
              LoanAmountInput(controller: _loanAmountController),
              InterestRateInput(controller: _interestRateController),
              LoanPeriodInput(controller: _loanPeriodController),
              Text('Total Cost of Car Loan: ${_getTotalCost(
                _loanAmountController,
                _interestRateController,
                _loanPeriodController,
              )}'),
              Text('Monthly Payment: ${_getMonthlyPayment(
                _loanAmountController,
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
