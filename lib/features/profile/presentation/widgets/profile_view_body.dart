import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/widgets/app_loading_indicator.dart';
import 'package:nap_nest/features/auth/cubits/profile_cubit.dart';
import 'package:nap_nest/features/auth/cubits/profile_state.dart';
import 'package:nap_nest/features/auth/data/service/profile_service.dart';
import 'package:nap_nest/features/profile/presentation/widgets/edit_profile_view_body.dart';
import 'package:nap_nest/statistics/presentation/views/statistics_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(ProfileService())..fetchProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CustomAppLoading());
          } else if (state is ProfileLoaded) {
            final user = state.profile;
            return Container(
              color: const Color(0xFFF6F7FB),
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 73.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back_ios, size: 28.sp),
                      ),
                      Text('Profile', style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w700)),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Text(user.name, style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700)),
                  SizedBox(height: 4.h),
                  Text(
                    user.email,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkGreyTxtColor,
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                    child: Divider(color: AppColors.darkGreyTxtColor, thickness: 0.2.h),
                  ),
                  _buildMenuCard([
                    _buildMenuItem(
                      icon: Icons.person_outline,
                      label: 'Personal Information',
                      onTap:
                          () => 
                          Navigator.pushNamed(
  context,
  EditProfileView.routeName,
  arguments: user, // وهو عبارة عن UserProfileModel
),

                       
                    ),
                    Divider(color: AppColors.containerColor, height: 8.h),
                    _buildMenuItem(
                      icon: Icons.insights_outlined,
                      label: 'Night Graphs',
                      onTap: () => Navigator.pushNamed(context, StatisticsView.routeName),
                    ),
                  ]),
                  SizedBox(height: 24.h),
                  _buildNotificationCard(),
                ],
              ),
            );
          } else if (state is ProfileError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildMenuCard(List<Widget> children) => Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: [
        BoxShadow(color: const Color(0x19273377), blurRadius: 20, offset: const Offset(0, 4)),
      ],
    ),
    child: Column(children: children),
  );

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Icon(icon, color: AppColors.primaryColor, size: 22.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(label, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
            ),
            Icon(Icons.arrow_forward_ios, size: 16.sp, color: AppColors.darkGreyTxtColor),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard() => Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    decoration: BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: [
        BoxShadow(color: const Color(0x19273377), blurRadius: 20, offset: const Offset(0, 3)),
      ],
    ),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Icon(Icons.notifications_none, color: AppColors.primaryColor, size: 22.sp),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Text(
            'Notification',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
        ),
        Switch(value: true, onChanged: (val) {}, activeColor: AppColors.primaryColor),
      ],
    ),
  );
}
