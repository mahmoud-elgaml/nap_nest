import 'package:flutter/material.dart';

class AnalyzeThoghts3 extends StatefulWidget {

  const AnalyzeThoghts3({super.key});

  @override
  State<AnalyzeThoghts3> createState() => _AnalyzeThoghts3State();
}

class _AnalyzeThoghts3State extends State<AnalyzeThoghts3> {
  bool _isLiked = false;
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                titleSpacing: 1,
                title: Text("Analyze Thoughts", style: TextStyle(fontSize: 20)),
                leading: IconButton(
                  onPressed: () {Navigator.pop(context);},
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
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 3),
                child: Text(
                  "You can like thoughts and check it later in the “Favorites”",
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
                        "I can still function with less sleep. My body is resilient and will adapt.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Image.asset(_isLiked ?"assets/images/Heart_filled.png" : "assets/images/Frame 120.png"),
                        iconSize: 40.0,
                        onPressed: () {
                          setState(() {
                            _isLiked = ! _isLiked;
                          });
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
                    onPressed: () {},
                    child: Text("Done", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Swipe to see other analyzed thoughts of yours.',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
