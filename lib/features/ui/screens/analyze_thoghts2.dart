import 'package:flutter/material.dart';
import 'package:nap_nest_test/ui/screens/analyze_thoghts3.dart';

class AnalyzeThoghts2 extends StatelessWidget {
  const AnalyzeThoghts2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xAA74B2E7),
              Color(0xAA9F8CCC),
              Color(0xAAC1A5E4),
              Color(0xAAE4EEF9),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              titleSpacing: 1,
              title: Text("Analyze Thoughts", style: TextStyle(fontSize: 20)),
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back),
              ),
              backgroundColor: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "My Thoughts",
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 110),
            Center(
              child: Container(
                height: 333,
                margin: EdgeInsets.all(16.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text(
                      "If I don’t get 8 hours of sleep, I’ll be a wreck tomorrow.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Image.asset("assets/images/Frame 119.png"),
                      iconSize: 40.0,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnalyzeThoghts3(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: SizedBox(
                width: 184,
                height: 57,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF74B2E7),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnalyzeThoghts3(),
                      ),
                    );
                  },
                  child: Text("Flip", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Swipe to see the flipped positive thoughts.',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
