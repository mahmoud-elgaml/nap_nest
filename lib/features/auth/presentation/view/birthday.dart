// import 'dart:developer';

// import 'package:flutter/material.dart';

// class BirthdayForm extends StatefulWidget {
//   const BirthdayForm({super.key});

//   @override
//   BirthdayFormState createState() => BirthdayFormState();
// }

// class BirthdayFormState extends State<BirthdayForm> {
//   String? selectedMonth;
//   String? selectedDay;
//   String? selectedYear;

//   final List<String> months = [
//     'Jan',
//     'Feb',
//     'Mar',
//     'Apr',
//     'May',
//     'Jun',
//     'Jul',
//     'Aug',
//     'Sep',
//     'Oct',
//     'Nov',
//     'Dec'
//   ];
//   final List<String> days =
//       List.generate(31, (index) => (index + 1).toString());
//   final List<String> years =
//       List.generate(100, (index) => (DateTime.now().year - index).toString());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "When’s Your Birthday?",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               "Your age information will be updated on your profile page and this will be displayed publicly on your dashboard",
//               style: TextStyle(fontSize: 14, color: Colors.grey),
//             ),
//             const SizedBox(height: 30),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 buildDropdown("MM", months, (value) {
//                   setState(() => selectedMonth = value);
//                 }),
//                 const SizedBox(width: 10),
//                 buildDropdown("DD", days, (value) {
//                   setState(() => selectedDay = value);
//                 }),
//                 const SizedBox(width: 10),
//                 buildDropdown("YYYY", years, (value) {
//                   setState(() => selectedYear = value);
//                 }),
//               ],
//             ),
//             const SizedBox(height: 40),
//             SizedBox(
//               width: double.infinity,
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: (selectedMonth != null &&
//                         selectedDay != null &&
//                         selectedYear != null)
//                     ? () {
//                         log("Selected Date: $selectedMonth $selectedDay, $selectedYear");
//                       }
//                     : null,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF76A9EB),
//                   disabledBackgroundColor: Colors.grey.shade400,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                 ),
//                 child: const Text(
//                   "Next",
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildDropdown(
//       String hint, List<String> items, Function(String?) onChanged) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade300),
//           borderRadius: BorderRadius.circular(8),
//           color: Colors.white,
//         ),
//         child: DropdownButtonFormField<String>(
//           decoration: const InputDecoration(border: InputBorder.none),
//           hint: Text(hint),
//           value: null,
//           items: items.map((String item) {
//             return DropdownMenuItem<String>(
//               value: item,
//               child: Text(item),
//             );
//           }).toList(),
//           onChanged: onChanged,
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';

// class BirthdayForm extends StatefulWidget {
//   const BirthdayForm({super.key});

//   @override
//   BirthdayFormState createState() => BirthdayFormState();
// }
// class BirthdayFormState extends State<BirthdayForm> {
//   DateTime? selectedDate;
//   final TextEditingController _dateController = TextEditingController();

//   Future<void> _pickDate(BuildContext context) async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );

//     if (pickedDate != null) {
//       setState(() {
//         selectedDate = pickedDate;
//         _dateController.text =
//             "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
//       });
//     }
//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "When’s Your Birthday?",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               "Your age information will be updated on your profile page and this will be displayed publicly on your dashboard",
//               style: TextStyle(fontSize: 14, color: Colors.grey),
//             ),
//             const SizedBox(height: 30),
//             TextField(
//               controller: _dateController,
//               readOnly: true,
//               onTap: () => _pickDate(context),
//               decoration: InputDecoration(
//                 hintText: "MM / DD / YYYY",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: BorderSide(color: Colors.grey.shade300),
//                 ),
//                 filled: true,
//                 fillColor: Colors.white,
//                 suffixIcon: const Icon(Icons.calendar_today),
//               ),
//             ),
//             const SizedBox(height: 40),
//             SizedBox(
//               width: double.infinity,
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: selectedDate != null
//                     ? () {
//                         print("Selected Date: ${_dateController.text}");
//                       }
//                     : null,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF76A9EB),
//                   disabledBackgroundColor: Colors.grey.shade400,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                 ),
//                 child: const Text(
//                   "Next",
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }