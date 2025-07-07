import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/home__items_model.dart';

class LibraryHomeItem extends StatelessWidget {
  LibraryHomeItem({super.key});

  final List<HomeItemsModel> sounds = [
    HomeItemsModel(
      title: 'Sleep disturbances',
      path: 'song2.mp3',
      imagePath: Assets.imagesLibrary4,
      duration: '7 min',
    ),
    HomeItemsModel(
      title: 'Sleep disturbances',
      path: 'song1.mp3',
      imagePath: Assets.imagesLibrary3,
      duration: '7 min',
    ),
    HomeItemsModel(
      title: 'Sleep disturbances',
      path: 'song2.mp3',
      imagePath: Assets.imagesLibrary2,
      duration: '7 min',
    ),
    HomeItemsModel(
      title: 'Sleep disturbances',
      path: 'song3.mp3',
      imagePath: Assets.imagesLibrary5,
      duration: '7 min',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sounds.length,
          itemBuilder: (context, index) {
            final sound = sounds[index];
            return LibItem(
              libModel: sound,
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     CupertinoPageRoute(
              //       builder:
              //           (_) => SongDetailsScreen(
              //             title: sound.title,
              //             audio: sound.path,
              //             backgroundImage: sound.imagePath,
              //           ),
              //     ),
              //   );
              // },
            );
          },
        ),
      ),
    );
  }
}

// -------------------------------------------------------------------------------------------------------------

class LibItem extends StatelessWidget {
  final HomeItemsModel libModel;
  // final VoidCallback onTap;

  const LibItem({super.key, required this.libModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
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
                libModel.imagePath,
                width: double.infinity,
                height: 120.h,
                fit: BoxFit.cover, // ← استبدال هنا
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    libModel.title,
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
                      Icon(
                        Icons.my_library_books_outlined,
                        size: 14.sp,
                        color: Colors.grey.shade600,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        libModel.duration,
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
