import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class InputDate extends StatelessWidget {
  final TextEditingController _date;

  const InputDate(this._date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      type: DateTimePickerType.date,
      dateMask: 'dd/MM/yyyy',
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      dateLabelText: "Date",
      controller: _date,
    );
  }
}
