import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/constants/sliver_sizedbox.dart';
import 'package:nap_nest/features/home/presentation/view/card_item_gridview.dart';
import 'package:nap_nest/features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:nap_nest/features/home/presentation/widgets/custom_home_card.dart';
import 'package:nap_nest/features/soundtrack/presentation/widgets/sound_track_header.dart';
import 'package:nap_nest/features/soundtrack/presentation/widgets/sound_track_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: CustomScrollView(
          slivers: [
            CustomHomeAppBar(),
            CustomHomeCard(),
            sliverSizedBox(30),
            SliverToBoxAdapter(child: CategoriesCardGridView()),
            sliverSizedBox(30),
            SoundTrackHeader(),
            sliverSizedBox(8),
            SoundTrackItem(),
          ],
        ),
      ),
    );
  }
}
