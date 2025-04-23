import 'package:flutter/material.dart';

import 'package:nap_nest/features/psqi/presentation/widgets/custom_container.dart';

class AnswersContainer extends StatelessWidget {
  const AnswersContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 428,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CustomContainer(option: '8pm : 10pm'),
            SizedBox(height: 16),
            CustomContainer(option: '10pm : 12am'),
            SizedBox(height: 16),
            CustomContainer(option: '12am : 2am'),
            SizedBox(height: 16),
            CustomContainer(option: '2am : 4am'),
          ],
        ),
      ),
    );
  }
}
