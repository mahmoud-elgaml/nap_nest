import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SongDetailsScreen extends StatefulWidget {
  final String title;
  final String audio;
  final String backgroundImage;

  const SongDetailsScreen({
    super.key,
    required this.title,
    required this.audio,
    required this.backgroundImage,
  });

  @override
  State<SongDetailsScreen> createState() => _SongDetailsScreenState();
}

class _SongDetailsScreenState extends State<SongDetailsScreen> {
late AudioPlayer _player;
  StreamSubscription<Duration>? _posSub;
  StreamSubscription<Duration>? _durSub;


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
    await _player.setSource(AssetSource('audio/${widget.audio}'));

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
    _posSub?.cancel();
    _durSub?.cancel();
    _player.stop();
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
            widget.backgroundImage,
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
                   SizedBox(height: 20.h),
                  Text(
                    widget.title,
                    style:  TextStyle(
                      fontSize: 24.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: IconButton(
                      iconSize: 64.sp,
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
