// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:nap_nest/core/widgets/app_loading_indicator.dart';
// import 'package:nap_nest/services/api/api_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class NegativeThoughtsView extends StatelessWidget {
//   static const routeName = 'NegativeThoughtsScreen';

//   const NegativeThoughtsView({super.key});

//   Future<Map<String, dynamic>> fetchData() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');

//       if (token == null) throw Exception('Token not found');

//       final response = await ApiService.dio.get(
//         '/home/my-path/challenge-negative-thoughts',
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );

//       print('📥 API Response: ${response.data}');
//       return response.data;
//     } catch (e) {
//       print('❌ Error fetching data: $e');
//       rethrow;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black, 
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
//           child: FutureBuilder<Map<String, dynamic>>(
//             future: fetchData(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CustomAppLoading(),);
//               } else if (snapshot.hasError) {
//                 return Center(
//                   child: Text(
//                     'حدث خطأ: ${snapshot.error}',
//                     style: TextStyle(color: Colors.red, fontSize: 16.sp),
//                     textAlign: TextAlign.center,
//                   ),
//                 );
//               }

//               final data = snapshot.data ?? {};
//               print('🧪 Parsed Data: $data');

//               return SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       data['title'] ?? 'No Title',
//                       style: TextStyle(
//                         fontSize: 26.sp,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 12.h),
//                     Text(
//                       data['description'] ?? 'No Description',
//                       style: TextStyle(
//                         fontSize: 16.sp,
//                         color: Colors.white70,
//                         fontStyle: FontStyle.italic,
//                       ),
//                     ),
//                     SizedBox(height: 24.h),
//                     Container(
//                       padding: EdgeInsets.all(16.w),
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(12.r),
//                       ),
//                       child: Text(
//                         data['content'] ?? 'No Content',
//                         style: TextStyle(fontSize: 15.5.sp, color: Colors.white, height: 1.8),
//                       ),
//                     ),
//                     SizedBox(height: 40.h),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/core/widgets/app_loading_indicator.dart';
import 'package:nap_nest/services/api/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class NegativeThoughtsView extends StatelessWidget {
  static const routeName = 'NegativeThoughtsScreen';

  const NegativeThoughtsView({super.key});

  Future<Map<String, dynamic>> fetchData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null) throw Exception('Token not found');

      final response = await ApiService.dio.get(
        '/home/my-path/challenge-negative-thoughts',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      print('📥 API Response: ${response.data}');
      return response.data;
    } catch (e) {
      print('❌ Error fetching data: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 🖼️ خلفية SVG تغطي الشاشة بالكامل
          Positioned.fill(
            child: SvgPicture.asset(
              Assets.imagesAirflowBackground, // تأكد من أن asset path صحيح
              fit: BoxFit.cover,
            ),
          ),

          /// 💨 تغبيش خفيف لجعل النص مقروءًا
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(color: Colors.black.withOpacity(0.25)),
            ),
          ),

          /// 📄 المحتوى
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: FutureBuilder<Map<String, dynamic>>(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CustomAppLoading());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'حدث خطأ: ${snapshot.error}',
                        style: TextStyle(color: Colors.red, fontSize: 16.sp),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  final data = snapshot.data ?? {};

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// 📝 العنوان
                        Text(
                          data['title'] ?? '',
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 12.h),

                        /// 🧠 الوصف
                        Text(
                          data['description'] ?? '',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white70,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 24.h),

                        /// 📘 المحتوى
                        Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            data['content'] ?? '',
                            style: TextStyle(fontSize: 15.5.sp, color: Colors.white, height: 1.8),
                          ),
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
