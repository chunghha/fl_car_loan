import 'dart:math' as math;

double _rounding(double number, {int decimals = 2}) {
  // round numbers to two decimal places
  return double.parse((number).toStringAsFixed(decimals));
}

double calcMonthlyPayment(
    {double loanAmount = 25000,
    double interestRate = 3.11,
    int loanMonths = 60}) {
  var _monthlyRate = interestRate / 100 / 12;
  var _x = math.pow(1 + _monthlyRate, loanMonths);

  return _rounding((loanAmount * _x * _monthlyRate) / (_x - 1));
}

double _totalInterest(
    {double interestRate = 3.11,
    double loanAmount = 25000,
    int loanMonths = 60}) {
  return _rounding(calcMonthlyPayment(
            loanAmount: loanAmount,
            interestRate: interestRate,
            loanMonths: loanMonths,
          ) *
          loanMonths -
      loanAmount);
}

double calcMaxBorrowable(
    {double interestRate = 3.11,
    double monthlyPayment = 450,
    int loanMonths = 60}) {
  var _total = calcTotalCostByMonths();

  // ignore: todo
  // TODO: fix this.
  return _total - 2024;
}

double calcTotalCost(
    {double interestRate = 3.11,
    double loanAmount = 25000,
    int loanMonths = 60}) {
  return calcMonthlyPayment(
          loanAmount: loanAmount,
          interestRate: interestRate,
          loanMonths: loanMonths) *
      loanMonths;
}

double calcTotalCostByMonths(
    {double monthlyPayment = 450, int loanMonths = 60}) {
  return monthlyPayment * loanMonths;
}

void main() {
  print(_rounding(3.11 / 100 / 12, decimals: 4));
  print(calcMonthlyPayment());
  print(calcTotalCost());
  print(calcTotalCostByMonths());
  print(_totalInterest());
  print(calcMaxBorrowable());
}
