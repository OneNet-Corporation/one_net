// ignore: file_names
import 'package:flutter/material.dart';
import 'package:one_net/config/themes/theme.dart';

class StoriesCarousel extends StatelessWidget {
  final List<Map<String, dynamic>> stories = [
    {
      "name": "Your Story",
      "borderWidth": 1,
      "image": "assets/images/users/user1.png",
      "bgColor": Color(0xFFD1DFC3),
      "borderGradient": [
        Color(0xFFD0D5DD),
        Color(0xFFD0D5DD)
      ], // No border for "Your Story"
      "isUser": true
    },
    {
      "name": "johndoe",
      "borderWidth": 3,
      "image": "assets/images/users/JohnDoe.png",
      "bgColor": Color(0xFFD4B2AF),
      "borderGradient": [Color(0xFFE2E2E2), Color(0xFFE9E9E9)],
      "isUser": false
    },
    {
      "name": "alishaperry",
      "borderWidth": 3,
      "image": "assets/images/users/alishaperry.png",
      "bgColor": Color(0xFFDFCC9F),
      "borderGradient": [Color(0xFF0F36FF), Color(0xFF8D5DEF)],
      "isUser": false
    },
    {
      "name": "hennyjen",
      "borderWidth": 3,
      "image": "assets/images/users/hennyjen.jpg",
      "bgColor": Colors.purple.shade100,
      "borderGradient": [Color(0xFF0F36FF), Color(0xFF8D5DEF)],
      "isUser": false
    },
    {
      "name": "hennyjen",
      "borderWidth": 3,
      "image": "assets/images/users/hennyjen.jpg",
      "bgColor": Colors.purple.shade100,
      "borderGradient": [Color(0xFF0F36FF), Color(0xFF8D5DEF)],
      "isUser": false
    },
    {
      "name": "hennyjen",
      "borderWidth": 3,
      "image": "assets/images/users/hennyjen.jpg",
      "bgColor": Colors.purple.shade100,
      "borderGradient": [Color(0xFF0F36FF), Color(0xFF8D5DEF)],
      "isUser": false
    },
    {
      "name": "hennyjen",
      "borderWidth": 3,
      "image": "assets/images/users/hennyjen.jpg",
      "bgColor": Colors.purple.shade100,
      "borderGradient": [Color(0xFF0F36FF), Color(0xFF8D5DEF)],
      "isUser": false
    },
  ];

  StoriesCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          final bool isUser = story["isUser"] ?? false;
          final List<Color>? borderGradient = story["borderGradient"];

          return Padding(
            padding: EdgeInsets.only(
                left: index == 0 ? 16 : 12.29,
                right: index == stories.length - 1 ? 16 : 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CustomGradientBorder(
                      size: 84,
                      borderwidth: story["borderWidth"],
                      gradientColors: borderGradient,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: story["bgColor"],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            story["image"],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    if (isUser)
                      Positioned(
                        bottom: 0, // Move outside image with some gap
                        right: 0, // Ensure proper alignment
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child:
                                Icon(Icons.add, color: Colors.white, size: 14),
                          ),
                        ),
                      ),
                  ],
                ),
                Text(
                  story["name"],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColor.storyName,
                  ),
                ),
                SizedBox(height: 6),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Custom widget to add a **gradient border** around a circular image
class CustomGradientBorder extends StatelessWidget {
  final Widget child;
  final double size;
  final int borderwidth;
  final List<Color>? gradientColors;

  const CustomGradientBorder({
    super.key,
    required this.child,
    required this.size,
    required this.borderwidth,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    if (gradientColors == null) {
      return child; // No border if gradient is null
    }

    return CustomPaint(
      painter: GradientBorderPainter(gradientColors: gradientColors!),
      child: Container(
        width: size,
        height: size,
        padding: EdgeInsets.all(borderwidth.toDouble()), // Border width
        child: ClipOval(child: child),
      ),
    );
  }
}

/// CustomPainter to **draw a vertical gradient border**
class GradientBorderPainter extends CustomPainter {
  final List<Color> gradientColors;

  GradientBorderPainter({required this.gradientColors});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: gradientColors,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3; // Border thickness

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2;

    canvas.drawCircle(center, radius - 1.5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
