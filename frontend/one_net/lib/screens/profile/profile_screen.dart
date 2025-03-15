
//   // natasha code copied by neel to this file //
//   import 'package:flutter/material.dart';
//   import 'package:flutter_svg/svg.dart';
//   import 'package:one_net/core/constants/constants.dart';
//   import 'package:one_net/core/widgets/cards/post_card.dart';
//   import 'package:one_net/models/userModel.dart';
//   import 'package:one_net/services/profileService.dart';

//   class ProfileScreen extends StatefulWidget {
//     final String userId; // Fetch user dynamically based on ID

//     const ProfileScreen({super.key, required this.userId});

//     @override
//     _ProfileScreenState createState() => _ProfileScreenState();
//   }

//   class _ProfileScreenState extends State<ProfileScreen> {
//     UserModel? user;
//     bool isLoading = true;
//     String? errorMessage;

//     @override
//     void initState() {
//       super.initState();
//       _fetchUserProfile();
//     }

// Future<void> _fetchUserProfile() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = null;
//     });

//     try {
//       // Replace this with your actual JWT token stored in secure storage
//       String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1WEphaW5VYTR4WFNVMktEMXFpNiIsImV4cCI6MTc0MjA2NTY1OSwiaWF0IjoxNzQyMDU0ODU5fQ.g1T19F3PYlln2_6OuCbrKUkKHP5D82hrEPXWmu3Xip4";
      
//       final fetchedUser = await ProfileService.getUserProfile(widget.userId, token);
      
//       print("Fetched User Data: $fetchedUser");

//       setState(() {
//         user = fetchedUser;
//         isLoading = false;
//       });
//     } catch (e) {
//       print("Error Fetching User: $e"); // Console log error
//       setState(() {
//         errorMessage = 'Failed to load profile data. Pull to refresh.';
//         isLoading = false;
//       });
//     }
//   }

//     @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: SingleChildScrollView(
//       child: Container(
//         color: defaultBackgroundColor,
//         child: Column(
//           children: [
//             Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 Image.network(
//                   user?.avatarUrl ?? 
//                       'https://s3-alpha-sig.figma.com/img/fc14/179c/8aa27b52c55516da0bc67f5a64ac6e97?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=WOXq50gMg63RpJK-PHLmIEPDwpmMfcdXpjGWqFaEBF58r1H4Hn-v87pZbnjtT40itlP9Nf-cSGtClq4zhzlvKx1G7ZcTu03d0ts0iVCrXGFaaBoZJEsRdVPe8MwgZv1cY2aIUzwRPfMKUcdOA3BPwIHcmXIR4YlwOBRw3biGXzSND3-Ukj9xA2UGKNpkUXo~WovozCjQtBnQyYgMjHtiX~paJee3AZe5B0cijyt-AjnwVpmTA4E87iq9YiSdNtaQFTh8Z6VrtyYfnNGy0A55exVRtG-BiXPvae~lS-9MC00TrSXeH4KtDbvKD6uMbS-y9GOuy9vAj-L9VwwUbrCUbg__', // Banner image
//                   width: double.infinity,
//                   height: 146,
//                   fit: BoxFit.cover,
//                 ),
//                 Positioned(
//                   top: 86,
//                   left: 16,
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Stack(
//                         children: [
//                           CircleAvatar(
//                             radius: 60,
//                             backgroundColor: defaultBackgroundColor,
//                             child: CircleAvatar(
//                               radius: 56,
//                               backgroundImage: user?.avatarUrl != null
//                                   ? NetworkImage(user!.avatarUrl!) 
//                                   : AssetImage('assets/images/default_avatar.png') as ImageProvider, // Default avatar
//                             ),
//                           ),
//                           Positioned(
//                             bottom: 10,
//                             right: 16,
//                             child: Container(
//                               width: 16,
//                               height: 16,
//                               decoration: BoxDecoration(
//                                 color: activeColor,
//                                 shape: BoxShape.circle,
//                                 border: Border.all(
//                                   color: defaultBackgroundColor,
//                                   width: 2,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(width: 12),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: 70,
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "${user?.firstName ?? ''} ${user?.lastName ?? ''}",
//                                 style: buttonText(context)
//                                     .copyWith(fontSize: 18),
//                               ),
//                               SizedBox(
//                                 width: 46,
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   // Proceed to Edit Profile Screen
//                                 },
//                                 child: Container(
//                                   height: 32,
//                                   width: 32,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     border: Border.all(color: lightGray),
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(4.0),
//                                     child: SvgPicture.asset(
//                                       'assets/images/user_edit_icon.svg',
//                                       colorFilter: const ColorFilter.mode(
//                                           defaultTextColor, BlendMode.srcIn),
//                                       height: 15,
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             user?.bio ?? "No bio available",
//                             style: hintText(context).copyWith(fontSize: 14),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 60),
//                   Text(
//                     user?.bio ?? "🚀 Tech Enthusiast | Software Developer | Innovation",
//                     style: hintText(context).copyWith(fontSize: 14),
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: 2,
//                       ),
//                       SvgPicture.asset(
//                         'assets/images/marker_pin_icon.svg',
//                         height: 18,
//                         colorFilter:
//                             ColorFilter.mode(primaryColor, BlendMode.srcIn),
//                       ),
//                       SizedBox(
//                         width: 8,
//                       ),
//                       Text('Los Angeles, CA',
//                           style: hintText(context)
//                               .copyWith(fontSize: 14, color: darkGray)),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     children: [
//                       SvgPicture.asset(
//                         'assets/images/globe_icon.svg',
//                         height: 18,
//                         colorFilter:
//                             ColorFilter.mode(primaryColor, BlendMode.srcIn),
//                       ),
//                       SizedBox(
//                         width: 8,
//                       ),
//                       Text('www.zuhranahmad.com',
//                           style: hintText(context)
//                               .copyWith(fontSize: 14, color: darkGray)),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     'Interests',
//                     style: buttonText(context),
//                   ),
//                   SizedBox(height: 6),
//                   Text(
//                     '#TechGeek, #CodeLife, #Innovation, #Web3, #uiuxweb #lagunabeach',
//                     style: hintText(context)
//                         .copyWith(fontSize: 13, color: tagColor),
//                   ),
//                   SizedBox(height: 16),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: primaryColor,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               shadowColor: Colors.transparent),
//                           child: Text(
//                             'Follow',
//                             style: bodySmall(context).copyWith(
//                                 fontSize: 13, color: defaultBackgroundColor),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       Expanded(
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: defaultBackgroundColor,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   side: BorderSide(color: lightGray)),
//                               shadowColor: Colors.transparent),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SvgPicture.asset(
//                                   'assets/images/message_dots_circle_icon.svg'),
//                               SizedBox(
//                                 width: 4,
//                               ),
//                               Text(
//                                 'Message',
//                                 style: bodySmall(context).copyWith(
//                                     fontSize: 13, color: defaultTextColor),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       GestureDetector(
//                         onTap: () {
//                           // Proceed to Edit Profile Screen
//                         },
//                         child: Container(
//                           height: 36,
//                           width: 36,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(color: lightGray),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(4.0),
//                             child: SvgPicture.asset(
//                               'assets/images/blockchain_icon.svg',
//                               colorFilter: const ColorFilter.mode(
//                                   defaultTextColor, BlendMode.srcIn),
//                               height: 15,
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
//   }
