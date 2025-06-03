import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/features/soundtrack/data/model/sound_model.dart';
import 'package:nap_nest/features/soundtrack/presentation/widgets/song_view_body.dart';
import 'package:svg_flutter/svg_flutter.dart';


class SoundTrackItem extends StatelessWidget {
  SoundTrackItem({super.key});

  final List<SoundModel> sounds = [
    SoundModel(
      title: 'Basic Mindfulness',
      audioPath: 'song2.mp3',
      imagePath: Assets.imagesSound4,
      duration: '8:24 min',
    ),
    SoundModel(
      title: 'Basic Mindfulness',
      audioPath: 'song1.mp3',
      imagePath: Assets.imagesSound2,
      duration: '8:24 min',
    ),
    SoundModel(
      title: 'Basic Mindfulness',
      audioPath: 'song2.mp3',
      imagePath: Assets.imagesSound1,
      duration: '8:24 min',
    ),
    SoundModel(
      title: 'Basic Mindfulness',
      audioPath: 'song3.mp3',
      imagePath: Assets.imagesSound3,
      duration: '8:24 min',
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
            return SoundItem(
              sound: sound,
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder:
                        (_) => SongDetailsScreen(
                          title: sound.title,
                          audio: sound.audioPath,
                          backgroundImage: sound.imagePath,
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


class SoundItem extends StatelessWidget {
  final SoundModel sound;
  final VoidCallback onTap;

  const SoundItem({super.key, required this.sound, required this.onTap});

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
            BoxShadow(color: Colors.grey.shade300, blurRadius: 6, offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              child: SvgPicture.asset(
                sound.imagePath,
                width: double.infinity,
                height: 120.h,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sound.title,
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
                      Icon(Icons.graphic_eq, size: 14.sp, color: Colors.grey.shade600),
                      SizedBox(width: 4.w),
                      Text(
                        sound.duration,
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
