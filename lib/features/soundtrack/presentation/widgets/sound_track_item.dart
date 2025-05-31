import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/features/soundtrack/presentation/widgets/song_view_body.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SoundTrackItem extends StatelessWidget {
  const SoundTrackItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200.h,
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            SoundItem(
              img: Assets.imagesSound4,
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder:
                        (_) => SongDetailScreen(
                          title: 'Basic Mindfulness',
                          audio: 'song2.mp3',
                          backgroundImage: Assets.imagesSound4,
                        ),
                  ),
                );
              },
            ),
            SoundItem(
              img: Assets.imagesSound2,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => SongDetailScreen(
                          title: 'Basic Mindfulness',
                          audio: 'song1.mp3',
                          backgroundImage: Assets.imagesSound2,
                        ),
                  ),
                );
              },
            ),
            SoundItem(
              img: Assets.imagesSound1,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => SongDetailScreen(
                          title: 'Basic Mindfulness',
                          audio: 'song2.mp3',
                          backgroundImage: Assets.imagesSound1,
                        ),
                  ),
                );
              },
            ),
            SoundItem(
              img: Assets.imagesSound3,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => SongDetailScreen(
                          title: 'Basic Mindfulness',
                          audio: 'song3.mp3',
                          backgroundImage: Assets.imagesSound3,
                        ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class SoundItem extends StatelessWidget {
//   const SoundItem({super.key, required this.img, this.onTap});
//   final String img;
//   final void Function()? onTap;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//        child: Container(
//         width: 400,
//         height: 600,
//         margin: EdgeInsets.only(right: 12.w),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(24.r),
//           child: Card(
//             child: Column(
//               children: [
//                 SvgPicture.asset(img, fit: BoxFit.fill),
//                 Text('Basic Mind'),
//                 Row(
//                   children: [
//                     Text('Basic Mind'),
//                     Text('8:24 min'),
//                     //
//                   ],
//                 ),

//                 //
//               ], //
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class SoundItem extends StatelessWidget {
  const SoundItem({super.key, required this.img, required this.onTap});

  final String img;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.only(right: 14.w),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            color: Colors.red,
            //
          ),
          width: 170.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                img,
                width: double.infinity,
                height: 120.h,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 8.h),
              Text(
                'Basic Mindfulness',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Icon(Icons.graphic_eq, size: 20.sp, color: Colors.grey),
                  SizedBox(width: 4.w),
                  Text(
                    '8:24 min',
                    style: TextStyle(fontSize: 14.sp, color: AppColors.darkGreyTxtColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
