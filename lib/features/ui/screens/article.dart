import 'package:flutter/material.dart';

class Article extends StatelessWidget {
  const Article({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment:
                  Alignment.topCenter, // عشان نرتب العناصر من أعلى ومنتصف الـ Stack
              children: <Widget>[
                Image.asset(
                  'assets/images/IMG_1560.JPG', // حط مسار الصورة هنا
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                AppBar(
                  titleSpacing: 1,
                  title: Text(
                    "Sleep Disturbances",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back,color: Colors.white,),
                    onPressed: () {
                      // كود الرجوع
                    },
                  ),
                  backgroundColor: Colors.transparent, // عشان الـ AppBar يكون شفاف
                  elevation: 0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    90.0,
                    16.0,
                    0,
                  ), // مسافة من أعلى عشان ننزل العنوان تحت الـ AppBar
                  child: Text(
                    'Challenge Negative Thoughts',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(16.0), // مسافة حوالين الكونتينر
              padding: EdgeInsets.all(16.0), // مسافة داخل الكونتينر بين النص والحواف
              decoration: BoxDecoration(
                color: Colors.white, // لون خلفية الكونتينر
                borderRadius: BorderRadius.circular(10.0), // عشان الأطراف تكون مدورة شوية
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), // لون الظل وشفافيته
                    spreadRadius: 2, // مدى انتشار الظل
                    blurRadius: 5, // مدى ضبابية الظل
                    offset: Offset(0, 3), // إزاحة الظل (أفقي, رأسي) - هنا هيكون نازل لتحت شوية
                  ),
                ],
              ),
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Jorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisi, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Donec ut rhoncus ex. Suspendisse ac rhoncus nisi, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Curabitur tempor quis eros tempus lacinia. Nam bibendum pellentesque quam a convallis. Sed ut bibendum tellus. Integer in felis sed leo vestibulum semper. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
