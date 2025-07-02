import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/features/soundtrack/presentation/widgets/song_view_body.dart';
import 'package:nap_nest/home__items_model.dart';
import 'package:svg_flutter/svg_flutter.dart';

class BreathingCardItem extends StatelessWidget {
  BreathingCardItem({super.key});

  final List<HomeItemsModel> breathing = [
    HomeItemsModel(
      title: '7 - 11 Breathing',
      path: 'song2.mp3',
      imagePath: Assets.imagesLibrary1,
      duration: '3 : 5 min',
    ),
    HomeItemsModel(
      title: '5 - 5 Breathing',
      path: 'song1.mp3',
      imagePath: Assets.imagesLibrary2,
      duration: '3 : 5 min',
    ),
    HomeItemsModel(
      title: '3 - 6 Breathing',
      path: 'song2.mp3',
      imagePath: Assets.imagesLibrary3,
      duration: '3 - 6 min',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: breathing.length,
          itemBuilder: (context, index) {
            final breathingModel = breathing[index];
            return BreathingItem(
              breathingModel: breathing[index],
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder:
                        (_) => SongDetailsScreen(
                          title: breathingModel.title,
                          audio: breathingModel.path,
                          backgroundImage: breathingModel.imagePath,
                        ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// -------------------------------------------------------------------------------------------------------------

class BreathingItem extends StatelessWidget {
  final HomeItemsModel breathingModel;
  final VoidCallback onTap;

  const BreathingItem({super.key, required this.breathingModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180.w,
        margin: EdgeInsets.only(right: 14.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade300, offset: const Offset(0, 2)), // blurRadius: 6
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              child: SvgPicture.asset(
                breathingModel.imagePath,
                width: double.infinity,
                height: 120.h,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    breathingModel.title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Icon(Icons.heart_broken_outlined, size: 14.sp, color: Colors.grey.shade600),
                      SizedBox(width: 4.w),
                      Text(
                        breathingModel.duration,
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
