import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/core/widgets/custom_appbar.dart';
import 'package:nap_nest/features/soundtrack/presentation/widgets/song_view_body.dart';
import 'package:nap_nest/features/soundtrack/presentation/widgets/sound_track_card.dart';
import 'package:nap_nest/home__items_model.dart';

// class SoundTrackViewBody extends StatelessWidget {
//   const SoundTrackViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SoundTrackAppbar(),
//               SizedBox(height: 20.h),
//               SoundtrackCard(
//                 imageAsset: Assets.imagesSound4,
//                 title: 'Basic Mindfulness',
//                 duration: '8:24',
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder:
//                           (_) => SongDetailsScreen(
//                             title: 'Basic Mindfulness',
//                             audio: 'song1.mp3',
//                             backgroundImage: Assets.imagesSound3,
//                           ),
//                     ),
//                   );
//                 },
//               ),
//               SizedBox(height: 20.h),
//               SoundtrackCard(
//                 imageAsset: Assets.imagesSound4,
//                 title: 'Basic Mindfulness',
//                 duration: '8:24',
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder:
//                           (_) => SongDetailsScreen(
//                             title: 'Basic Mindfulness',
//                             audio: 'song2.mp3',
//                             backgroundImage: Assets.imagesSound2,
//                           ),
//                     ),
//                   );
//                 },
//               ),
//               SizedBox(height: 20.h),
//               SoundtrackCard(
//                 imageAsset: Assets.imagesSound4,
//                 title: 'Basic Mindfulness',
//                 duration: '8:24',
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder:
//                           (_) => SongDetailsScreen(
//                             title: 'Basic Mindfulness',
//                             audio: 'song3.mp3',
//                             backgroundImage: Assets.imagesSound4,
//                           ),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class SoundTrackViewBody extends StatelessWidget {
  SoundTrackViewBody({super.key});

  final List<HomeItemsModel> sounds = [
    HomeItemsModel(
      title: 'Basic Mindfulness',
      path: 'song1.mp3',
      imagePath: Assets.imagesSound3,
      duration: '8:24',
    ),
    HomeItemsModel(
      title: 'Basic Mindfulness',
      path: 'song2.mp3',
      imagePath: Assets.imagesSound2,
      duration: '8:24',
    ),
    HomeItemsModel(
      title: 'Basic Mindfulness',
      path: 'song3.mp3',
      imagePath: Assets.imagesSound4,
      duration: '8:24',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 CustomAppbar(
                  popText: 'Home',
                  title: 'Soundtracks',
                  subtitle: 'Select your preferred relaxing soundtrack to listen to.',
                ),
                SizedBox(height: 20.h),
                ...sounds.map(
                  (sound) => Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: SoundtrackCard(
                      soundModel: sound,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => SongDetailsScreen(
                                  title: sound.title,
                                  audio: sound.path,
                                  backgroundImage: sound.imagePath,
                                ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
