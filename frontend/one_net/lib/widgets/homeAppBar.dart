import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_net/config/themes/theme.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0, // Prevents color change on scroll
      title: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Image.asset(
                "assets/images/one-net-logo-big.png",
                height: 20,
              ),
            ),
            // Notification & Search Icons
            Row(
              children: [
                _buildIconWithBadge("assets/images/icons/bell-02.svg", 12),
                const SizedBox(width: 8),
                _buildIconWithBadge(
                    "assets/images/icons/message-dots-circle.svg", 12),
                const SizedBox(width: 8),
                _buildIcon("assets/images/icons/search-lg.svg"),
              ],
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          width: double.infinity,
          height: 1,
          color: AppColor.appBardivider,
        ),
      ),
    );
  }

  Widget _buildIconWithBadge(String iconPath, int count,
      {VoidCallback? onPressed}) {
    return Stack(
      children: [
        _buildIcon(iconPath, onPressed: onPressed),
        Positioned(
          right: 4.4,
          top: 6.67,
          child: Container(
            width: 14.44,
            height: 14.44,
            decoration: const BoxDecoration(
              color: AppColor.appBarIconBadgeBack,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "$count",
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'SFProText',
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIcon(String iconPath, {VoidCallback? onPressed}) {
    return SizedBox(
      width: 40, // Forces exact size in all modes
      height: 40,
      child: Material(
        color: Colors.transparent, // Keeps ripple effect visible
        child: InkWell(
          borderRadius:
              BorderRadius.circular(20), // Ensures proper touch behavior
          onTap: onPressed,
          child: Container(
            width: 40, // Ensures fixed size
            height: 40,
            decoration: BoxDecoration(
              color: AppColor.appBarIconBack, // Background color
              shape: BoxShape.circle, // Circular background
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: 22, // Ensures icon size stays correct
                height: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(59);
}
