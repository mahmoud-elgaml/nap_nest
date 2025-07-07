import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/features/breathing/presentation/view/breathing_view.dart';

class AirflowHeader extends StatelessWidget {
  const AirflowHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Airflow',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                //
              ),
            ), //
            IconButton(
              color: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, BreathingView.routeName);
              },
              icon: Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 45.sp,
                weight: 20.0,
                //
              ),
              //
            ),
          ],
          //
        ),
      ),
    );
  }
}
