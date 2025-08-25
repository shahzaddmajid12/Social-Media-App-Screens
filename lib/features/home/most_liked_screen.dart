import 'package:flutter/material.dart';
import 'package:splash_app/features/user/view_user_screen.dart';
import 'package:splash_app/widgets/post_action_button.dart';

class MostLikedScreen extends StatefulWidget {
  const MostLikedScreen({super.key});

  @override
  State<MostLikedScreen> createState() => _MostLikedScreenState();
}

class _MostLikedScreenState extends State<MostLikedScreen> {
  bool showCommentBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Most Liked',
            style: TextStyle(fontSize: 18, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(height: 1, color: Colors.grey.shade300),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔹 Placeholder Section (No Likes Yet)
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.newspaper, size: 100, color: Color(0xFF022D89)),
                    SizedBox(height: 16),
                    Text(
                      "No Likes Yet",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30), // space before dummy post
            // 🔹 John Doe Lorem Ipsum Post
            // Padding(
            //   padding: const EdgeInsets.all(12),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       // Header row
            //       Row(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           const CircleAvatar(
            //             radius: 25,
            //             backgroundColor: Colors.white,
            //             backgroundImage: AssetImage(
            //               'assets/images/userImg1.png',
            //             ),
            //           ),
            //           const SizedBox(width: 10),
            //           Expanded(
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 GestureDetector(
            //                   onTap: () {
            //                     Navigator.push(
            //                       context,
            //                       MaterialPageRoute(
            //                         builder: (context) => const ViewUserScreen(
            //                           userName: 'John Doe',
            //                         ),
            //                       ),
            //                     );
            //                   },
            //                   child: const Text(
            //                     "John Doe",
            //                     style: TextStyle(
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 16,
            //                       // Optional: make it look clickable
            //                     ),
            //                   ),
            //                 ),
            //                 const Text("shared a post"),
            //                 Row(
            //                   children: const [
            //                     Text(
            //                       "1 Minute ago",
            //                       style: TextStyle(color: Colors.grey),
            //                     ),
            //                     SizedBox(width: 5),
            //                     Icon(
            //                       Icons.public,
            //                       size: 16,
            //                       color: Colors.grey,
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //           IconButton(
            //             icon: const Icon(
            //               Icons.more_horiz, // horizontal dots
            //               color: Colors.grey, // lighter color
            //             ),
            //             onPressed: () {
            //               // Handle menu options
            //             },
            //           ),
            //         ],
            //       ),

            //       const SizedBox(height: 12),

            //       // Post Status
            //       const Text(
            //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam.",
            //         style: TextStyle(fontSize: 15),
            //       ),

            //       const SizedBox(height: 12),

            //       // Reactions and comments count
            //       const Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text("0 Reactions", style: TextStyle(color: Colors.grey)),
            //           Text("15 Comments", style: TextStyle(color: Colors.grey)),
            //         ],
            //       ),

            //       const SizedBox(height: 10),
            //       Container(
            //         height: 1,
            //         color: Colors.grey[300],
            //       ), // separator line

            //       const SizedBox(height: 5),

            //       // Like, Comment, Share buttons
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           PostActionButton(
            //             icon: Icons.thumb_up_alt_outlined,
            //             label: "Like",
            //             onTap: () {},
            //             onLongPress: () {
            //               showDialog(
            //                 context: context,
            //                 barrierColor: Colors.transparent,
            //                 builder: (context) {
            //                   return Center(
            //                     child: Container(
            //                       padding: const EdgeInsets.symmetric(
            //                         horizontal: 20,
            //                         vertical: 10,
            //                       ),
            //                       decoration: BoxDecoration(
            //                         color: Colors.white,
            //                         borderRadius: BorderRadius.circular(30),
            //                         boxShadow: [
            //                           BoxShadow(
            //                             blurRadius: 10,
            //                             color: Colors.black26,
            //                           ),
            //                         ],
            //                       ),
            //                       child: Row(
            //                         mainAxisSize: MainAxisSize.min,
            //                         children:
            //                             [
            //                               '👍',
            //                               '❤️',
            //                               '😂',
            //                               '😢',
            //                               '😮',
            //                               '😡',
            //                             ].map((emoji) {
            //                               return GestureDetector(
            //                                 onTap: () {
            //                                   Navigator.pop(context);
            //                                   // TODO: Handle emoji reaction
            //                                 },
            //                                 child: Padding(
            //                                   padding:
            //                                       const EdgeInsets.symmetric(
            //                                         horizontal: 6,
            //                                       ),
            //                                   child: Text(
            //                                     emoji,
            //                                     style: const TextStyle(
            //                                       fontSize: 30,
            //                                     ),
            //                                   ),
            //                                 ),
            //                               );
            //                             }).toList(),
            //                       ),
            //                     ),
            //                   );
            //                 },
            //               );
            //             },
            //           ),
            //           Container(height: 20, width: 1, color: Colors.grey[300]),
            //           PostActionButton(
            //             icon: Icons.mode_comment_outlined,
            //             label: "Comment",
            //             onTap: () {
            //               setState(() {
            //                 showCommentBox = !showCommentBox;
            //               });
            //             },
            //           ),
            //           Container(height: 20, width: 1, color: Colors.grey[300]),
            //           PostActionButton(
            //             icon: Icons.share_outlined,
            //             label: "Share",
            //           ),
            //         ],
            //       ),

            //       const SizedBox(height: 5),
            //       // Container(height: 8, color: Colors.grey[200]),
            //     ],
            //   ),
            // ),
            // const Divider(
            //   // height: 40, // Total vertical space taken including padding
            //   thickness: 10, // Thickness of the line itself
            //   color: Color(0xFFF2F2F4),
            // ),
          ],
        ),
      ),
    );
  }
}
