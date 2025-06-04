import 'package:flutter/material.dart';

class Articles extends StatelessWidget {
  const Articles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 1,
        title: Text("Library", style: TextStyle(fontSize: 20)),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sleep Disturbances",
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3),
            Text(
              "Select your preferred relaxing soundtrack to listen  to.",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 50,),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  String fixedImagePath = 'assets/images/Frame 82.png';
                  String fixedText = 'Challenge Negative Thoughts';

                  return _buildAdviceBlock(fixedImagePath, fixedText);
                },
              ),
            )

          ],
        ),
      ),
    );
  }
  ///////

  Widget _buildAdviceBlock(String imagePath, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xAACDB8EB),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 56.0, // عرض الصورة
            height: 56.0, // ارتفاع الصورة
            fit: BoxFit.contain, // طريقة عرض الصورة داخل المساحة المحددة
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }

}
