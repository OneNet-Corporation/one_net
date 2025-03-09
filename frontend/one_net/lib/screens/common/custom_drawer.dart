import 'package:flutter/material.dart';
import 'package:one_net/config/themes/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 50), // Space from top

          // New Post
          _buildDrawerItem(
            iconPath: "assets/images/icons/plus-square.svg",
            title: "New Post",
            onTap: () {},
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(height: 1, thickness: 1, color: Color(0xFFF2F4F7)),
          ),

          // Clips
          _buildDrawerItem(
            iconPath: "assets/images/icons/play-circle.svg",
            title: "Clips",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required String iconPath,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: SvgPicture.asset(
        iconPath,
        width: 24,
        height: 24,
        color: AppColor.primary,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'SFProText',
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 17,
          letterSpacing: 0,
        ),
      ),
      onTap: onTap,
    );
  }
}
