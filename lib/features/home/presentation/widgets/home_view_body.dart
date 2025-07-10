import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/constants/sliver_sizedbox.dart';
import 'package:nap_nest/features/breathing/presentation/widgets/breathing_card_home_item.dart';
import 'package:nap_nest/features/breathing/presentation/widgets/breathing_header.dart';
import 'package:nap_nest/features/home/presentation/view/card_item_gridview.dart';
import 'package:nap_nest/features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:nap_nest/features/home/presentation/widgets/custom_home_card.dart';
import 'package:nap_nest/features/library/presentation/widgets/lib_home_header.dart';
import 'package:nap_nest/features/library/presentation/widgets/lib_home_items.dart';
import 'package:nap_nest/features/soundtrack/presentation/widgets/sound_track_header.dart';
import 'package:nap_nest/features/soundtrack/presentation/widgets/sound_track_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: [
            CustomHomeAppBar(),
            CustomHomeCard(),
            sliverSizedBox(16),
            SliverToBoxAdapter(child: CategoriesCardGridView()),
            sliverSizedBox(16),
            SoundTrackHeader(),
            sliverSizedBox(6),
            SoundTrackItem(),
            sliverSizedBox(16),
            BreathingNest(),
            sliverSizedBox(6),
            BreathingCardItem(),
            sliverSizedBox(16),
            LibraryHeader(),
            sliverSizedBox(6),
            LibraryHomeItem(),
            SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          ],
        ),
      ),
    );
  }
}
