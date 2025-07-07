import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nap_nest/features/home/presentation/view/home_view.dart';

class PsqiResultViewBody extends StatelessWidget {
  const PsqiResultViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sleep Index Result',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(13), // 0.05 opacity converted to alpha
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          PieChart(
                            PieChartData(
                              sectionsSpace: 0,
                              centerSpaceRadius: 30,
                              sections: [
                                PieChartSectionData(
                                  value: 11,
                                  color: const Color(0xFF4A90E2),
                                  radius: 10,
                                  showTitle: false,
                                ),
                                PieChartSectionData(
                                  value: 10,
                                  color: const Color(0xFFE0E0E0),
                                  radius: 10,
                                  showTitle: false,
                                ),
                              ],
                              startDegreeOffset: 270,
                            ),
                          ),
                          const Text(
                            '11/21',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Moderate',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Worem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit, aliquet odio mattis.',
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(13), // 0.05 opacity converted to alpha
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildProgressItem('Sleep Quality', 0.8, const Color(0xFF4CAF50)),
                    _buildProgressItem('Sleep Latency', 0.3, const Color(0xFFFFA726)),
                    _buildProgressItem('Sleep Duration', 0.7, const Color(0xFF4CAF50)),
                    _buildProgressItem('Sleep Efficiency', 0.9, const Color(0xFF4CAF50)),
                    _buildProgressItem('Sleep Disturbances', 0.3, const Color(0xFFFFA726)),
                    _buildProgressItem('Use of Sleep Medications', 0.2, const Color(0xFF4CAF50)),
                    _buildProgressItem('Daytime Dysfunction', 0.4, const Color(0xFFFFA726)),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeView.routeName,
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A90E2),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressItem(String title, double value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
              const Icon(Icons.info_outline, color: Colors.grey, size: 20),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: value,
              backgroundColor: Colors.grey[200],
              color: color,
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
