import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/features/home/presentation/widgets/home_item_card.dart';

class CardItemGridView extends StatelessWidget {
  const CardItemGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 21.w,
      mainAxisSpacing: 16.h,
      childAspectRatio: 179 / 126,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: const [
        HomeItemCard(
          title: 'Ready to Sleep',
          backgroundAsset: Assets.imagesPurble,
          iconAsset: Assets.imagesMoon,
        ),
        HomeItemCard(
          title: 'Library',
          backgroundAsset: Assets.imagesBlue,
          iconAsset: Assets.imagesBook,
        ),
        HomeItemCard(
          title: 'Alarm',
          backgroundAsset: Assets.imagesGreen,
          iconAsset: Assets.imagesAlarm,
        ),
        HomeItemCard(
          title: 'Attach Device',
          backgroundAsset: Assets.imagesOrange,
          iconAsset: Assets.imagesHand,
        ),
      ],
    );
  }
}
