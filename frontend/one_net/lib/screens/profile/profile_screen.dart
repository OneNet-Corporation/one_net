import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_net/core/constants/constants.dart';
import 'package:one_net/core/widgets/cards/post_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: defaultBackgroundColor,
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.network(
                    'https://s3-alpha-sig.figma.com/img/fc14/179c/8aa27b52c55516da0bc67f5a64ac6e97?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=WOXq50gMg63RpJK-PHLmIEPDwpmMfcdXpjGWqFaEBF58r1H4Hn-v87pZbnjtT40itlP9Nf-cSGtClq4zhzlvKx1G7ZcTu03d0ts0iVCrXGFaaBoZJEsRdVPe8MwgZv1cY2aIUzwRPfMKUcdOA3BPwIHcmXIR4YlwOBRw3biGXzSND3-Ukj9xA2UGKNpkUXo~WovozCjQtBnQyYgMjHtiX~paJee3AZe5B0cijyt-AjnwVpmTA4E87iq9YiSdNtaQFTh8Z6VrtyYfnNGy0A55exVRtG-BiXPvae~lS-9MC00TrSXeH4KtDbvKD6uMbS-y9GOuy9vAj-L9VwwUbrCUbg__', // Banner image
                    width: double.infinity,
                    height: 146,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 86,
                    left: 16,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: defaultBackgroundColor,
                              child: CircleAvatar(
                                radius: 56,
                                backgroundImage: NetworkImage(
                                    'https://outgrid.uicore.co/creative-agency/wp-content/uploads/sites/22/2023/08/Creative-Agency-About-Team-Image-1.webp'), // Profile picture
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 16,
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: activeColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: defaultBackgroundColor,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Zuhran Ahmad',
                                  style: buttonText(context)
                                      .copyWith(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 46,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Proceed to Edit Profile Screen
                                  },
                                  child: Container(
                                    height: 32,
                                    width: 32,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: lightGray),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: SvgPicture.asset(
                                        'assets/images/user_edit_icon.svg',
                                        color: defaultTextColor,
                                        height: 15,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  '221',
                                  style: profileStat(context),
                                ),
                                Text(
                                  ' Followers',
                                  style:
                                      hintText(context).copyWith(fontSize: 13),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  '117',
                                  style: profileStat(context),
                                ),
                                Text(
                                  ' Mutual',
                                  style:
                                      hintText(context).copyWith(fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60),
                    Text(
                      '🚀 Tech Enthusiast | Software Developer | Innovation',
                      style: hintText(context).copyWith(fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SizedBox(
                          width: 2,
                        ),
                        SvgPicture.asset(
                          'assets/images/marker_pin_icon.svg',
                          height: 18,
                          color: primaryColor,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Los Angeles, CA',
                            style: hintText(context)
                                .copyWith(fontSize: 14, color: darkGray)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/globe_icon.svg',
                          height: 18,
                          color: primaryColor,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text('www.zuhranahmad.com',
                            style: hintText(context)
                                .copyWith(fontSize: 14, color: darkGray)),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Interests',
                      style: buttonText(context),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '#TechGeek, #CodeLife, #Innovation, #Web3, #uiuxweb #lagunabeach',
                      style: hintText(context)
                          .copyWith(fontSize: 13, color: tagColor),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                shadowColor: Colors.transparent),
                            child: Text(
                              'Follow',
                              style: bodySmall(context).copyWith(
                                  fontSize: 13, color: defaultBackgroundColor),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: defaultBackgroundColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: BorderSide(color: lightGray)),
                                shadowColor: Colors.transparent),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    'assets/images/message_dots_circle_icon.svg'),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Message',
                                  style: bodySmall(context).copyWith(
                                      fontSize: 13, color: defaultTextColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            // Proceed to Edit Profile Screen
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: lightGray),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.asset(
                                'assets/images/blockchain_icon.svg',
                                color: defaultTextColor,
                                height: 15,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    TabBar(
                      labelStyle:
                          buttonText(context).copyWith(color: defaultTextColor),
                      unselectedLabelStyle:
                          buttonText(context).copyWith(color: defaultTextColor),
                      unselectedLabelColor: defaultTextColor,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      dividerColor: Color(0xFFF9FAFB),
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      labelPadding: EdgeInsets.symmetric(horizontal: 22),
                      tabs: [
                        Tab(text: 'Posts'),
                        Tab(text: 'Photos'),
                        Tab(text: 'Videos'),
                        Tab(text: 'Clips'),
                      ],
                    ),
                    SizedBox(
                      height: 400, // Height of the TabBarView
                      child: TabBarView(
                        children: [
                          Column(
                            children: [
                              Expanded(
                                child: ListView(
                                  children: [
                                    PostCard(
                                        profileImageUrl:
                                            'https://outgrid.uicore.co/creative-agency/wp-content/uploads/sites/22/2023/08/Creative-Agency-About-Team-Image-1.webp',
                                        name: 'Zuhran Ahmad',
                                        location: 'Los Angeles, CA',
                                        timeAgo: '20h ago',
                                        content:
                                            'Lorem ipsum dolor sit amet. Ut molestiaetio in dignissimos et iste dicta aut dolores veniam At one maxime fugiat. Ut internos toquiered consequatur in omnis of esse sed tempore odit ut optio enim!'),
                                    PostCard(
                                        profileImageUrl:
                                            'https://outgrid.uicore.co/creative-agency/wp-content/uploads/sites/22/2023/08/Creative-Agency-About-Team-Image-1.webp',
                                        name: 'Zuhran Ahmad',
                                        location: 'Los Angeles, CA',
                                        timeAgo: '20h ago',
                                        content:
                                            'Lorem ipsum dolor sit amet. Ut molestiaetio in dignissimos et iste dicta aut dolores veniam At one maxime fugiat. Ut internos toquiered consequatur in omnis of esse sed tempore odit ut optio enim!'),
                                    PostCard(
                                        profileImageUrl:
                                            'https://outgrid.uicore.co/creative-agency/wp-content/uploads/sites/22/2023/08/Creative-Agency-About-Team-Image-1.webp',
                                        name: 'Zuhran Ahmad',
                                        location: 'Los Angeles, CA',
                                        timeAgo: '20h ago',
                                        content:
                                            'Lorem ipsum dolor sit amet. Ut molestiaetio in dignissimos et iste dicta aut dolores veniam At one maxime fugiat. Ut internos toquiered consequatur in omnis of esse sed tempore odit ut optio enim!'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Center(child: Text('Photos Placeholder')),
                          Center(child: Text('Videos Placeholder')),
                          Center(child: Text('Clips Placeholder')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
