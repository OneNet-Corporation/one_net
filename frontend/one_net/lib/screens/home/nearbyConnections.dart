// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_net/config/themes/theme.dart';

class NearbyConnections extends StatefulWidget {
  const NearbyConnections({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NearbyConnectionsState createState() => _NearbyConnectionsState();
}

class _NearbyConnectionsState extends State<NearbyConnections> {
  int selectedIndex = 0; // 0 = "For You", 1 = "Nearby Connections"

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        children: [
          // Blue top indicator
          Container(
            width: double.infinity,
            height: 1,
            color: const Color(0xFFF9F9F9),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Grouped Tabs: "For You" and "Nearby Connections"
                Row(
                  children: [
                    _buildTab("For You", 0),
                    _buildTab("Nearby Connections", 1),
                  ],
                ),
                // Settings Icon in center of 32x32 px circle with border
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFF4F5FA),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: SvgPicture.asset(
                        'assets/images/icons/settings-04.svg',
                        color: Colors.black,
                        height: 20.57,
                        width: 20.57,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index; 
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF89898F),
            fontSize: 14,
            fontFamily: 'SFProText',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
