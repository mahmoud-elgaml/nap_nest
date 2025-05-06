import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                  MaterialPageRoute(
                    builder:
                        (_) => SongDetailScreen(
                          title: 'Basic Mindfulness',
                          audioAsset: 'song2.mp3',
                          backgroundAsset: Assets.imagesSound4,
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
                          audioAsset: 'song1.mp3',
                          backgroundAsset: Assets.imagesSound2,
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
                          audioAsset: 'song2.mp3',
                          backgroundAsset: Assets.imagesSound1,
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
                          audioAsset: 'song3.mp3',
                          backgroundAsset: Assets.imagesSound3,
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

class SoundItem extends StatelessWidget {
  const SoundItem({super.key, required this.img, this.onTap});
  final String img;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 320.w,
        height: 250.h,
        margin: EdgeInsets.only(right: 12.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: SvgPicture.asset(img, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
