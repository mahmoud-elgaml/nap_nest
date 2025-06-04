import 'package:flutter/material.dart';
import 'package:nap_nest_test/ui/widget/thought_choice.dart';

class AnalyzeThoghts extends StatefulWidget {
  const AnalyzeThoghts({super.key});

  @override
  State<AnalyzeThoghts> createState() => _AnalyzeThoghtsState();
}

class _AnalyzeThoghtsState extends State<AnalyzeThoghts> {
  String? _selectedThought;

  void _handleThoughtChanged(String? value) {
    setState(() {
      _selectedThought = value;
    });
    print('تم اختيار: $_selectedThought');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 1,
        title: Text("My Plan", style: TextStyle(fontSize: 20)),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Analyze Thoughts",
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 45),
            Text(
              "What thoughts had come to your mind today?",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 45),
            ThoughtChoice(
              // استخدام الـ ThoughtChoice Widget
              text:
                  'Many people struggle with sleep at times. I\'m not alone, and I can learn to improve my sleep.',
              value: 'thought1',
              groupValue: _selectedThought,
              onChanged: _handleThoughtChanged,
            ),
            ThoughtChoice(
              // استخدام تاني للـ ThoughtChoice Widget
              text:
                  'If I don\'t get 8 hours of sleep, I\'ll be a wreck tomorrow.',
              value: 'thought2',
              groupValue: _selectedThought,
              onChanged: _handleThoughtChanged,
            ),
            ThoughtChoice(
              // استخدام تالت للـ ThoughtChoice Widget
              text:
                  'Everyone else sleeps perfectly; I must be doing something wrong.',
              value: 'thought3',
              groupValue: _selectedThought,
              onChanged: _handleThoughtChanged,
            ),
            Spacer(),
            Center(
              child: SizedBox(
                width: 184,
                height: 57,
                child: ElevatedButton(
                  onPressed:
                      _selectedThought != null
                          ? () {
                            print(
                              'تم الضغط على التالي والاختيار هو: $_selectedThought',
                            );
                          }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xAA74B2E7),
                  ),
                  child: Text('Next', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
