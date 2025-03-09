import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_net/config/themes/theme.dart';

class BottomMenuBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomMenuBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  // ignore: library_private_types_in_public_api
  _BottomMenuBarState createState() => _BottomMenuBarState();
}

class _BottomMenuBarState extends State<BottomMenuBar> {
  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [
      "assets/images/icons/home-smile.svg",
      "assets/images/icons/block-chain.svg",
      "assets/images/icons/plus-square.svg",
      "assets/images/icons/users-01.svg",
      "assets/images/icons/user-01.svg"
    ];

    List<String> labels = ["Home", "Chain", "New", "Community", "Profile"];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFF2F4F7),
            width: 1.0,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Row(
        children: List.generate(imagePaths.length, (index) {
          return Expanded(
            child: _buildTabItem(index, imagePaths[index], labels[index]),
          );
        }),
      ),
    );
  }

  Widget _buildTabItem(int index, String imagePath, String label) {
    bool isSelected = widget.currentIndex == index;

    return GestureDetector(
      onTap: () => widget.onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            imagePath,
            width: 24,
            height: 24,
            color: isSelected ? AppColor.primary : AppColor.inactive,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
                fontWeight: FontWeight.w400,
              color: isSelected ? AppColor.primary : AppColor.inactive,
            ),
          ),
        ],
      ),
    );
  }
}
