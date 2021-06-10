import 'dart:math' as math;

import 'package:flutter/services.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({required this.decimalRange})
      : assert(decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    var _newSelection = newValue.selection;
    var _truncated = newValue.text;

    var value = newValue.text;

    if (value.contains(".") &&
        value.substring(value.indexOf(".") + 1).length > decimalRange) {
      _truncated = oldValue.text;
      _newSelection = oldValue.selection;
    } else if (value == ".") {
      _truncated = "0.";

      _newSelection = newValue.selection.copyWith(
        baseOffset: math.min(_truncated.length, _truncated.length + 1),
        extentOffset: math.min(_truncated.length, _truncated.length + 1),
      );
    }

    return TextEditingValue(
      text: _truncated,
      selection: _newSelection,
      composing: TextRange.empty,
    );
  }
}
