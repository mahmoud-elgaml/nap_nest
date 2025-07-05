import 'package:flutter/material.dart';

class GenderSelectionField extends StatefulWidget {
  const GenderSelectionField({super.key});

  @override
  State<GenderSelectionField> createState() => _GenderSelectionFieldState();
}

class _GenderSelectionFieldState extends State<GenderSelectionField> {
  String selectedGender = 'Male';

/*************  ✨ Windsurf Command ⭐  *************/
  /// Builds a single gender option widget.
  //
  /// The [gender] parameter is the gender type to display (e.g. "Male", "Female").
  ///
  /// The widget displays a circular border with a filled circle inside if the
  /// gender is selected, and a hollow circle if not selected. The gender text
  /// is displayed next to the circle.
  ///
  /// Tapping on the widget will update the [selectedGender] state with the
  /// tapped gender.
/*******  6f34a218-8f5d-458a-957c-3f669f0915f2  *******/
  Widget buildGenderOption(String gender) {
    final bool isSelected = selectedGender == gender;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        padding: const EdgeInsets.only(top: 12, right: 18, bottom: 12, left: 12),
        decoration: ShapeDecoration(
          color: const Color(0xFFE2E4E8), // Optional background for visibility
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF74B2E7), width: 2.5),
              ),
              child:
                  isSelected
                      ? Center(
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF74B2E7),
                          ),
                        ),
                      )
                      : null,
            ),
            const SizedBox(width: 10),
            Text(
              gender,
              style: const TextStyle(
                color: Color(0xFF111111),
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gender',
            style: TextStyle(
              color: Color(0xFF414E61),
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [buildGenderOption('Male'), buildGenderOption('Female')],
          ),
        ],
      ),
    );
  }
}
