import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/features/soundtrack/presentation/widgets/custom_appbar.dart';
import 'package:nap_nest/features/soundtrack/presentation/widgets/song_view_body.dart';
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => SongDetailScreen(
                            title: 'Basic Mindfulness',
                            audioAsset: 'song1.mp3',
                            backgroundAsset: Assets.imagesSound3,
                          ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              SoundtrackCard(
                imageAsset: Assets.imagesSound4,
                title: 'Basic Mindfulness',
                duration: '8:24',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => SongDetailScreen(
                            title: 'Basic Mindfulness',
                            audioAsset: 'song2.mp3',
                            backgroundAsset: Assets.imagesSound2,
                          ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              SoundtrackCard(
                imageAsset: Assets.imagesSound4,
                title: 'Basic Mindfulness',
                duration: '8:24',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => SongDetailScreen(
                            title: 'Basic Mindfulness',
                            audioAsset: 'song3.mp3',
                            backgroundAsset: Assets.imagesSound4,
                          ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
