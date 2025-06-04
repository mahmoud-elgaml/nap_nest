import 'package:flutter/material.dart';

class ThoughtChoice extends StatelessWidget {
  final String text;
  final String value; // قيمة الاختيار (ممكن تكون نص أو رقم)
  final String? groupValue; // القيمة الحالية للمجموعة
  final ValueChanged<String?>? onChanged; // دالة هتتنفذ لما المستخدم يختار

  const ThoughtChoice({
    super.key,
    required this.text,
    required this.value,
    this.groupValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(height: 90,
        decoration: BoxDecoration(
          color: Color(0xAACDB8EB), // لون خلفية الاختيار
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: <Widget>[
            Radio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: Colors.green,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
