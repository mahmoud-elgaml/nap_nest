// import 'package:flutter/material.dart';

// class SuccessViewBody extends StatelessWidget {
//   static const routeName = 'SuccessView';
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: 428,
//           height: 926,
//           clipBehavior: Clip.antiAlias,
//           decoration: ShapeDecoration(
//             color: const Color(0xFFF6F7FB),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(40),
//             ),
//           ),
//           child: Stack(
//             children: [
//               Positioned(
//                 left: 151,
//                 top: 332,
//                 child: Container(
//                   width: 126,
//                   height: 126,
//                   decoration: ShapeDecoration(
//                     color: const Color(0xFFE4EEF9),
//                     shape: OvalBorder(),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 150,
//                 top: 331,
//                 child: Container(
//                   width: 128,
//                   height: 128,
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Color(0x0F3F486F),
//                         blurRadius: 15,
//                         offset: Offset(0, 4),
//                         spreadRadius: 0,
//                       ),
//                     ],
//                   ),
//                   child: Stack(),
//                 ),
//               ),
//               Positioned(
//                 left: 139,
//                 top: 174,
//                 child: Text(
//                   'Way to go!',
//                   style: TextStyle(
//                     color: const Color(0xFF111111),
//                     fontSize: 32,
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 51,
//                 top: 566,
//                 child: SizedBox(
//                   width: 326,
//                   child: Text(
//                     'Your password has been reset successfully!',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: const Color(0xFF414E61),
//                       fontSize: 16,
//                       fontFamily: 'Roboto',
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 24,
//                 top: 750,
//                 child: Container(
//                   width: 380,
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 32,
//                     vertical: 20,
//                   ),
//                   decoration: ShapeDecoration(
//                     color: const Color(0xFF74B2E7),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(28),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     spacing: 10,
//                     children: [
//                       Text(
//                         'Set New Password',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: const Color(0xFFF9F9F9),
//                           fontSize: 14,
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
