import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_net/config/themes/theme.dart';

class ChainSuggestions extends StatelessWidget {
  final List<Map<String, String>> users;

  const ChainSuggestions({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      color: const Color(0xFFF9FAFB), // Light background color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row with Icon
          Row(
            children: [
              Container(
                width: 24, // Increased size for proper spacing
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  shape: BoxShape.circle, // Circular shape
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/icons/block-chain.svg",
                    width: 14.4,
                    height: 14.4,
                    color: AppColor.primary,
                  ),
                ),
              ), // Chain icon
              const SizedBox(width: 8),
              const Text(
                "Chain Suggestions",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'SFProText',
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF000000),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Horizontal Scrolling ListView
          SizedBox(
            height: 180, // Set height for cards
            child: ListView.builder(
              scrollDirection:
                  Axis.horizontal, // Enables horizontal scrolling ✅
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return _buildUserCard(
                  profileImage: user["profileImage"]!,
                  backColor: Color(int.parse(user["backColor"]!)),
                  name: user["name"]!,
                  username: user["username"]!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserCard({
    required String profileImage,
    required Color backColor,
    required String name,
    required String username,
  }) {
    return Container(
      width: 140, // Fixed width for each card
      margin: const EdgeInsets.only(right: 12), // Spacing between cards
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Image with Background
          CircleAvatar(
            radius: 36,
            backgroundColor: backColor, // Background color
            backgroundImage: AssetImage(profileImage),
          ),
          const SizedBox(height: 8),
          // Name
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF101828),
            ),
          ),
          // Username
          Text(
            "@$username",
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF98A2B3),
            ),
          ),
          const SizedBox(height: 7),
          // Follow Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary, // Button background color
              foregroundColor: Colors.white, // Text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size(90, 24), // Ensures fixed size
              maximumSize:
                  const Size(90, 24), // Prevents expansion in release mode
              tapTargetSize: MaterialTapTargetSize
                  .shrinkWrap, // Removes extra touch padding
              elevation: 0, // Prevents unwanted shadows
            ),
            child: const Text(
              "Follow",
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'SFProText',
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
