// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_net/config/themes/theme.dart';
import 'package:video_player/video_player.dart';

class PostCard extends StatelessWidget {
  final String profileImage;
  final Color avatarBackColor;
  final String username;
  final String location;
  final String timeAgo;
  final String postText;
  final String? mediaUrl; 
  final MediaType mediaType; 
  final int likes;
  final int comments;
  final int shares;
  final bool isOnline;

  const PostCard({
    super.key,
    required this.profileImage,
    required this.avatarBackColor,
    required this.username,
    required this.location,
    required this.timeAgo,
    required this.postText,
    this.mediaUrl,
    this.mediaType = MediaType.none,
    required this.likes,
    required this.comments,
    required this.shares,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Color(0xFFF4F4F4),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Info Row
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: avatarBackColor,
                        radius: 16,
                        backgroundImage: AssetImage(profileImage),
                      ),
                      if (isOnline)
                        Positioned(
                          bottom: -0.5,
                          right: -0.5,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 1.5),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: const TextStyle(
                          color: Color(0xFF101828),
                          fontSize: 14,
                          fontFamily: 'SFProText',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "$location • $timeAgo",
                        style: const TextStyle(
                            fontSize: 12, color: Color(0xFF98A2B3)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Follow Button
                  SizedBox(
                    height: 29,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFFF4F5FA),
                        backgroundColor: const Color(0xFFF4F5FA),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                      ),
                      child: const Text(
                        "+ Follow",
                        style: TextStyle(
                          fontFamily: 'SFProText',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Post Text
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  postText,
                  style: const TextStyle(fontSize: 14, height: 1.5),
                ),
              ),
              const SizedBox(height: 8),
              // Media (Image/Video)
              if (mediaUrl != null) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: mediaType == MediaType.image
                        ? Image.asset(mediaUrl!,
                            fit: BoxFit.cover, width: double.infinity)
                        : VideoPlayerWidget(videoUrl: mediaUrl!),
                  ),
                ),
                const SizedBox(height: 12),
              ],
              // Interaction Row (Like, Comment, Share)
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIconText("assets/images/icons/heart.svg", likes),
                    _buildIconText(
                        "assets/images/icons/message-circle-01.svg", comments),
                    _buildIconText("assets/images/icons/refresh.svg", shares),
                    _buildIconText("assets/images/icons/bookmark.svg", 0),
                    _buildIconText("assets/images/icons/forward.svg", 0),
                    _buildIconText(
                        "assets/images/icons/dots-horizontal.svg", 0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconText(String iconPath, int count, {VoidCallback? onPressed}) {
    return Row(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: SvgPicture.asset(
            iconPath,
            width: 20,
            height: 20,
            color: Colors.grey[700],
          ),
        ),
        if (count > 0) ...[
          const SizedBox(width: 4),
          Text(
            count > 1000 ? '${(count / 1000).floor()}k' : count.toString(),
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ],
      ],
    );
  }
}

/// Enum for Media Type
enum MediaType { none, image, video }

/// Video Player Widget
class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  // ignore: library_private_types_in_public_api
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        IconButton(
          icon: Icon(
              isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
              color: Colors.white,
              size: 50),
          onPressed: () {
            setState(() {
              isPlaying ? _controller.pause() : _controller.play();
              isPlaying = !isPlaying;
            });
          },
        ),
      ],
    );
  }
}
