// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:nap_nest/core/utils/app_images.dart';
// import 'package:svg_flutter/svg.dart';




// class SongDetailScreen extends StatefulWidget {
//   final String title;
//   final String audioAsset;
//   final String backgroundAsset;
//   const SongDetailScreen({super.key, required this.title, required this.audioAsset, required this.backgroundAsset});

//   @override
//   State<SongDetailScreen> createState() => _SongDetailScreenState();
// }

// class _SongDetailScreenState extends State<SongDetailScreen> {
//   late AudioPlayer _player;
//   bool isPlaying = false;
//   Duration current = Duration.zero;
//   Duration total = Duration.zero;

//   @override
//   void initState() {
//     super.initState();
//     _player = AudioPlayer();
//     _initAudio();
//   }

//   Future<void> _initAudio() async {
//     await _player.setSource(AssetSource('audio/${widget.audioAsset}')); 
//     _player.onPositionChanged.listen((pos) {
//       setState(() => current = pos);
//     });
//     _player.onDurationChanged.listen((dur) {
//       setState(() => total = dur);
//     });
//     await _player.resume();
//     setState(() => isPlaying = true);
//   }

//   void togglePlayPause() async {
//     if (isPlaying) {
//       await _player.pause();
//     } else {
//       await _player.resume();
//     }
//     setState(() => isPlaying = !isPlaying);
//   }

//   @override
//   void dispose() {
//     _player.dispose();
//     super.dispose();
//   }

//   String formatTime(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));
//     return '$minutes:$seconds';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//        SvgPicture.asset(
//             widget.backgroundAsset,
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const BackButton(color: Colors.white),
//                   const SizedBox(height: 20),
//                   Text(
//                     widget.title,
//                     style: const TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const Spacer(),
//                   Center(
//                     child: IconButton(
//                       iconSize: 64,
//                       icon: Icon(
//                         isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
//                         color: Colors.white,
//                       ),
//                       onPressed: togglePlayPause,
//                     ),
//                   ),
//                   Slider(
//                     value:
//                         total.inSeconds > 0
//                             ? current.inSeconds.clamp(0, total.inSeconds).toDouble()
//                             : 0,
//                     max: total.inSeconds.toDouble() > 0 ? total.inSeconds.toDouble() : 1,
//                     onChanged: (value) async {
//                       await _player.seek(Duration(seconds: value.toInt()));
//                     },
//                     activeColor: Colors.white,
//                     inactiveColor: Colors.white54,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(formatTime(current), style: const TextStyle(color: Colors.white)),
//                       Text(formatTime(total), style: const TextStyle(color: Colors.white)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SongDetailScreen extends StatefulWidget {
  final String title;
  final String audioAsset;
  final String backgroundAsset;

  const SongDetailScreen({
    super.key,
    required this.title,
    required this.audioAsset,
    required this.backgroundAsset,
  });

  @override
  State<SongDetailScreen> createState() => _SongDetailScreenState();
}

class _SongDetailScreenState extends State<SongDetailScreen> {
  late AudioPlayer _player;
  late StreamSubscription<Duration> _posSub;
  late StreamSubscription<Duration> _durSub;

  bool isPlaying = false;
  Duration current = Duration.zero;
  Duration total = Duration.zero;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _initAudio();
  }

  Future<void> _initAudio() async {
    await _player.setSource(AssetSource('audio/${widget.audioAsset}'));

    _posSub = _player.onPositionChanged.listen((pos) {
      if (mounted) setState(() => current = pos);
    });

    _durSub = _player.onDurationChanged.listen((dur) {
      if (mounted) setState(() => total = dur);
    });

    await _player.resume();
    if (mounted) setState(() => isPlaying = true);
  }

  void togglePlayPause() async {
    if (isPlaying) {
      await _player.pause();
    } else {
      await _player.resume();
    }
    if (mounted) setState(() => isPlaying = !isPlaying);
  }

  @override
  void dispose() {
    _posSub.cancel();
    _durSub.cancel();
    _player.stop(); // يوقف الصوت عند pop
    _player.dispose();
    super.dispose();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            widget.backgroundAsset,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(
                    color: Colors.white,
                    onPressed: () {
                      _player.stop();
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: IconButton(
                      iconSize: 64,
                      icon: Icon(
                        isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                        color: Colors.white,
                      ),
                      onPressed: togglePlayPause,
                    ),
                  ),
                  Slider(
                    value:
                        total.inSeconds > 0
                            ? current.inSeconds.clamp(0, total.inSeconds).toDouble()
                            : 0,
                    max: total.inSeconds.toDouble() > 0 ? total.inSeconds.toDouble() : 1,
                    onChanged: (value) async {
                      await _player.seek(Duration(seconds: value.toInt()));
                    },
                    activeColor: Colors.white,
                    inactiveColor: Colors.white54,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(current), style: const TextStyle(color: Colors.white)),
                      Text(formatTime(total), style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
