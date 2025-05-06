import 'package:flutter/material.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:svg_flutter/svg_flutter.dart';

class BreathingDetailsViewBody extends StatelessWidget {
  const BreathingDetailsViewBody({
    super.key,
    required this.title,
    required this.description,
    required this.duration,
    //
  });
  final String title;
  final String description;
  final String duration;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
 
          // Moon and clouds image overlay
          Positioned.fill(
            child: SvgPicture.asset(
             Assets.imagesBreathingBackground,
              fit: BoxFit.fill,
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 10),

                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Description
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16, height: 1.6, color: Colors.white70),
                  ),
                  const SizedBox(height: 20),

                  // Duration
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.timer, color: Colors.white70, size: 18),
                        const SizedBox(width: 8),
                        Text(duration, style: const TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ),
                  const Spacer(),

                  // Start button
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7FB7FF),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
                      ),
                      onPressed: () {
                        // Navigate to breathing timer screen
                      },
                      child: const Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
