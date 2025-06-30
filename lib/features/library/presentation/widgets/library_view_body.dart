import 'package:flutter/material.dart';

class LibraryViewBody extends StatelessWidget {
  const LibraryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 1,
        title: Text("Home", style: TextStyle(fontSize: 20)),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Library", style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold)),
            SizedBox(height: 3),
            Text(
              "Select your preferred relaxing soundtrack to listen  to.",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 1 / 1.1,
                children: <Widget>[
                  _buildBlock(context, 'assets/images/testing.jpg', 'Sleep Disturbances'),
                  _buildBlock(context, 'assets/images/testing.jpg', 'Sleep Disturbances'),
                  _buildBlock(context, 'assets/images/testing.jpg', 'Sleep Disturbances'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
////////

Widget _buildBlock(BuildContext context, String imagePath, String text) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Colors.transparent,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Stack(
        children: <Widget>[
          Positioned.fill(child: Image.asset(imagePath, fit: BoxFit.cover)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(color: Colors.transparent),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

