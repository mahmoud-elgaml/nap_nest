import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_images.dart';

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
          children: const [
            SoundItem(img: Assets.imagesSound1),
            SoundItem(img: Assets.imagesSound2),
            SoundItem(img: Assets.imagesSound3),
            SoundItem(img: Assets.imagesSound4),
          ],
        ),
      ),
    );
  }
}

class SoundItem extends StatelessWidget {
  const SoundItem({super.key, required this.img});
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      height: 180.h,
      margin: EdgeInsets.only(right: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
      ),
    );
  }
}
