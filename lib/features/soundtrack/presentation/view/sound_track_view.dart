import 'package:flutter/material.dart';
import 'package:nap_nest/features/soundtrack/presentation/widgets/sound_track_view_body.dart';
import 'package:nap_nest/home_layout.dart';

class SoundTrackView extends StatelessWidget {
  const SoundTrackView({super.key});
static const routeName = 'soundTrack';
  @override
  Widget build(BuildContext context) {
    return  HomeLayout(
      currentIndex: 2,
      screen: SoundTrackViewBody(),
      //
    );
  }
}