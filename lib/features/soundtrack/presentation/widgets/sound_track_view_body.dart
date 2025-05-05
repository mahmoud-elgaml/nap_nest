import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/features/soundtrack/presentation/widgets/custom_appbar.dart';
import 'package:nap_nest/features/soundtrack/presentation/widgets/sound_track_card.dart';

class SoundTrackViewBody extends StatelessWidget {
  const SoundTrackViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SoundTrackAppbar(),
              SizedBox(height: 20.h),
              SoundtrackCard(
                imageAsset: Assets.imagesSound4,
                title: 'Basic Mindfulness',
                duration: '8:24',
              ),
              SizedBox(height: 20.h),
              SoundtrackCard(
                imageAsset: Assets.imagesSound2,
                title: 'Evening Calm',
                duration: '5:10',
              ),
              SizedBox(height: 20.h),
              SoundtrackCard(
                imageAsset: Assets.imagesSound1,
                title: 'Basic Mindfulness',
                duration: '8:24',
              ),
              SizedBox(height: 20.h),
              const SoundtrackCard(
                imageAsset: Assets.imagesSound3,
                title: 'Nature Bliss',
                duration: '10:00',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
