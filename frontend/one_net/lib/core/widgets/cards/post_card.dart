import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_net/core/constants/constants.dart';

class PostCard extends StatelessWidget {
  final String profileImageUrl;
  final String name;
  final String location;
  final String timeAgo;
  final String content;

  const PostCard({
    super.key,
    required this.profileImageUrl,
    required this.name,
    required this.location,
    required this.timeAgo,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: defaultBackgroundColor,
      shadowColor: defaultBackgroundColor,
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profileImageUrl),
                  radius: 16.0,
                ),
                Positioned(
                  bottom: 0.5,
                  right: 0.5,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: activeColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: defaultBackgroundColor,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: buttonText(context)),
                  SizedBox(
                    height: 3,
                  ),
                  Text('$location • $timeAgo',
                      style: bodySmall(context).copyWith(
                          fontWeight: FontWeight.w300, color: hintColor)),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Text(
              content,
              style: buttonText(context)
                  .copyWith(fontWeight: FontWeight.w400, color: contentColor),
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Row(
              children: [
                SizedBox(
                  width: 32,
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: tagColor,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ),
                Text(
                  '12k',
                  style: bodySmall(context)
                      .copyWith(fontSize: 13, color: tagColor),
                ),
                SizedBox(width: 16),
                GestureDetector(
                  child: SvgPicture.asset(
                      'assets/images/message_circle_icon.svg',
                      color: tagColor),
                  onTap: () {},
                ),
                SizedBox(width: 4),
                Text(
                  '10k',
                  style: bodySmall(context)
                      .copyWith(fontSize: 13, color: tagColor),
                ),
                SizedBox(width: 16),
                GestureDetector(
                  child: SvgPicture.asset(
                    'assets/images/repost_icon.svg',
                    color: tagColor,
                  ),
                  onTap: () {},
                ),
                SizedBox(width: 4),
                Text(
                  '122',
                  style: bodySmall(context)
                      .copyWith(fontSize: 13, color: tagColor),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 34,
                  child: IconButton(
                    icon: Icon(
                      Icons.bookmark_border,
                      color: tagColor,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 16),
                GestureDetector(
                  child: SvgPicture.asset(
                    'assets/images/share_icon.svg',
                    color: tagColor,
                  ),
                  onTap: () {},
                ),
                SizedBox(width: 12),
                SizedBox(
                  width: 32,
                  child: IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      color: tagColor,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
