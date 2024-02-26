import 'package:flutter/material.dart';

class DatePickerInputWidget extends StatefulWidget {
  const DatePickerInputWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DatePickerInputWidgetState createState() => _DatePickerInputWidgetState();
}
class _DatePickerInputWidgetState extends State<DatePickerInputWidget> {
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = picked.toLocal().toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _dateController,
        readOnly: true,
        onTap: () => _selectDate(context),
        decoration: const InputDecoration(
          labelText: 'Select Date',
          suffixIcon: Icon(Icons.calendar_today),
        ),
      ),
    );
  }
}
