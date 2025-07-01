import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/features/attachDevice/presentation/view/attach_device_view.dart';
import 'package:nap_nest/features/home/presentation/widgets/categories_home_item_card.dart';
import 'package:nap_nest/features/library/presentation/views/library_view.dart';

class CategoriesCardGridView extends StatelessWidget {
  const CategoriesCardGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 21.w,
      mainAxisSpacing: 16.h,
      childAspectRatio: 179 / 126,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        CategoriesHomeItemCard(
          title: 'Ready to Sleep',
          backgroundAsset: Assets.imagesPurble,
          iconAsset: Assets.imagesMoon,
        ),
        CategoriesHomeItemCard(
          title: 'Library',
          backgroundAsset: Assets.imagesBlue,
          iconAsset: Assets.imagesBook,
          onPressed: () {
            Navigator.pushNamed(context, LibraryView.routeName);
          },
        ),
        CategoriesHomeItemCard(
          title: 'Alarm',
          backgroundAsset: Assets.imagesGreen,
          iconAsset: Assets.imagesAlarm,
        ),
        CategoriesHomeItemCard(
          title: 'Attach Device',
          backgroundAsset: Assets.imagesOrange,
          iconAsset: Assets.imagesHand,
          onPressed: () {
            Navigator.pushNamed(context, AttachDeviceView.routeName);
          },
        ),
      ],
    );
  }
}
