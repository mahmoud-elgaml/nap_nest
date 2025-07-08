// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/features/attachDevice/presentation/view/attach_device_view.dart';
import 'package:nap_nest/features/nestTime/presentation/widgets/alarm_setting_view.dart';
import 'package:nap_nest/home__items_model.dart';
class NestTimeViewBody extends StatelessWidget {

  
final List<HomeItemsModel> sounds = [
  HomeItemsModel(
    title: 'Basic Mindfulness',
    path: 'song2.mp3',
    imagePath: Assets.imagesSound4,
    duration: '8:24 min',
  ),
  HomeItemsModel(
    title: 'Airflow',
    path: '',
    imagePath: Assets.imagesAirflow2,
    duration: '3:05 min',
  ),
  HomeItemsModel(
    title: 'Sleeping',
    path: '',
    imagePath: Assets.imagesLibrary2,
    duration: '7:11 min',
  ),
];

  NestTimeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 60.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          Text('Nest Time', style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 8.h),
          Text(
            'Set up your bed and get ready to sleep.',
            style: TextStyle(fontSize: 15.sp, color: AppColors.darkGreyTxtColor),
          ),
          SizedBox(height: 40.h),

          _OptionTile(
            icon: Icons.alarm,
            label: 'Set alarm',
            trailing: '8:00 am',
            onTap: () => Navigator.pushNamed(context, AlarmView.routeName),
          ),
          SizedBox(height: 14.h),
          _OptionTile(
            icon: Icons.watch,
            label: 'Connect your band',
            onTap: () => Navigator.pushNamed(context, AttachDeviceView.routeName),
          ),

          SizedBox(height: 40.h),
          Text('Recommended', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
          SizedBox(height: 14.h),

          SizedBox(
            height: 160.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: sounds.length,
              separatorBuilder: (_, __) => SizedBox(width: 14.w),
              itemBuilder: (context, index) {
                final item = sounds[index];
                return _SoundCard(item: item);
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
class _OptionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? trailing;
  final VoidCallback? onTap;

  const _OptionTile({Key? key, required this.icon, required this.label, this.trailing, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.orangeColor),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(label, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
            ),
            if (trailing != null)
              Text(trailing!, style: TextStyle(fontSize: 16.sp, color: AppColors.darkGreyTxtColor)),
            Icon(Icons.arrow_forward_ios, size: 16.sp, color: AppColors.darkGreyTxtColor),
          ],
        ),
      ),
    );
  }
}

class _SoundCard extends StatelessWidget {
  final HomeItemsModel item;

  const _SoundCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: SvgPicture.asset(
              item.imagePath,
              height: 80.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.h),
          Text(item.title, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
          SizedBox(height: 4.h),
          Text(item.duration, style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
        ],
      ),
    );
  }
}
