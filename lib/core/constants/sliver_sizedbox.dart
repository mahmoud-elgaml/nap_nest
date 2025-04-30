 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SliverToBoxAdapter sliverSizedBox(double height) {
  return SliverToBoxAdapter(
    child: SizedBox(
      height: height.h,
    ),
  );
}