import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/features/profile/presentation/widgets/edit_profile_view_body.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6F7FB),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile',
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF111111),
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'Mohamed Ali',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF111111),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Mohamedali@gmail.com',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF414E61),
            ),
          ),
          SizedBox(height: 32.h),

          /// Card: Personal Info & Progress
          _buildMenuCard([
            _buildMenuItem(
              icon: Icons.person_outline,
              label: 'Personal Information',
              onTap: () => Navigator.pushNamed(context, EditProfileView.routeName),
            ),
            Divider(color: const Color(0xFFE2E4E8), height: 1.h),
            _buildMenuItem(
              icon: Icons.insights_outlined,
              label: 'My Progress',
              onTap: () {}, // TODO: Add navigation
            ),
          ]),
          SizedBox(height: 24.h),

          /// Card: Notification toggle
          _buildNotificationCard(),
        ],
      ),
    );
  }

  Widget _buildMenuCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7FB),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(color: const Color(0x19273377), blurRadius: 20, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(children: children),
    );
  }

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
                color: const Color(0xFFD3E5F8),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Icon(icon, color: Colors.blue, size: 20.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF111111),
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16.sp, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7FB),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(color: const Color(0x19273377), blurRadius: 20, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: const Color(0xFFD3E5F8),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Icon(Icons.notifications_none, color: Colors.blue, size: 20.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              'Notification',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF111111),
              ),
            ),
          ),
          Switch(value: true, onChanged: (val) {}, activeColor: const Color(0xFF74B2E7)),
        ],
      ),
    );
  }
}
