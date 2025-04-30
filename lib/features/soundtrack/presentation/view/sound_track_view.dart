import 'package:flutter/material.dart';
import 'package:nap_nest/features/soundtrack/presentation/view/widgets/sound_track_view_body.dart';

class SoundTrackView extends StatelessWidget {
  const SoundTrackView({super.key});
static const routeName = 'soundTrack';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SoundTrackViewBody(),
      ),
    );
  }
}