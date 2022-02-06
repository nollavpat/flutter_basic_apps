import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';

// class CurrencyInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     if (newValue.selection.baseOffset == 0) {
//       return newValue;
//     }

//     double value = double.parse(newValue.text);

//     final formatter = NumberFormat.currency(locale: 'en_US', symbol: '₱');

//     String newText = formatter.format(value);

//     return newValue.copyWith(
//         text: newText,
//         selection: TextSelection.collapsed(offset: newText.length));
//   }
// }

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction({
    Key? key,
    required this.addTx,
  }) : super(key: key);

  void submitData() {
    final enteredText = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredText.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(
      enteredText,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                TextInputFormatter.withFunction((oldValue, newValue) {
                  try {
                    final text = newValue.text;
                    if (text.isNotEmpty) double.parse(text);
                    return newValue;
                    // ignore: empty_catches
                  } catch (e) {}
                  return oldValue;
                }),
              ],
              onSubmitted: (_) =>
                  submitData(), // used in mobile keyboard check key (lower left)
            ),
            TextButton(
                onPressed: submitData,
                child: const Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.purple),
                ))
          ],
        ),
      ),
    );
  }
}
