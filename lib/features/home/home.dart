import 'package:flutter/material.dart';
import 'package:splash_app/widgets/post_action_button.dart';
import 'package:splash_app/features/notification/notification_screen.dart';
import 'package:splash_app/features/reels/reels_screen.dart';
import 'package:splash_app/features/trending/trending_screen.dart';
import 'package:splash_app/features/settings/settings_screen.dart';
import 'package:splash_app/features/user/view_user_screen.dart';
// import 'package:splash_app/most_liked_screen.dart';
// import 'package:splash_app/features/home/most_liked_screen.dart';
import 'package:splash_app/features/home/most_liked_screen.dart';
import 'package:splash_app/features/home/popular_post_screen.dart';
import 'package:splash_app/features/home/search_screen.dart';
import 'package:splash_app/features/home/chats_screen.dart';
import 'package:splash_app/features/home/whats_going_on_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showCommentBox = false;
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _showCreatePopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 8),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.photo_outlined, color: Color(0xFF022D89)),
            title: const Text('Create Post'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.create_outlined,
              color: Color(0xFF022D89),
            ),
            title: const Text('Create Ad'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.event, color: Color(0xFF022D89)),
            title: const Text('Create Event'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.add_box_outlined,
              color: Color(0xFF022D89),
            ),
            title: const Text('Create New Product'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.note_add_outlined,
              color: Color(0xFF022D89),
            ),
            title: const Text('Create New Page'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.group_outlined, color: Color(0xFF022D89)),
            title: const Text('Create New Group'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.play_circle_outline,
              color: Color(0xFF022D89),
            ),
            title: const Text('Create Reel Video'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReelsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        // elevation: 1,
        title: const Text(
          'SM',
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatsScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_box_outlined, color: Colors.black),
            onPressed: () => _showCreatePopup(context),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tab Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  _buildTabButton("News", true),
                  const SizedBox(width: 10),
                  _buildTabButton("Popular Posts", false),
                  const SizedBox(width: 10),
                  _buildTabButton("Most Liked", false),
                ],
              ),
            ),

            // const Divider(),
            // Post Creation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          'assets/images/userImg1.png',
                        ), // replace with your asset
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const WhatsGoingOnScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "What's going on? #Hashtag.. @Mention",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.photo_library, color: Colors.lightGreen),
                          SizedBox(width: 4),
                          Text(
                            "Gallery",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.person_add_alt_1,
                            color: Colors.lightBlueAccent,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Tag",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.emoji_emotions, color: Colors.yellow),
                          SizedBox(width: 4),
                          Text(
                            "Feeling",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.videocam, color: Colors.redAccent),
                          SizedBox(width: 4),
                          Text(
                            "Live",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(
              // height: 40, // Total vertical space taken including padding
              thickness: 10, // Thickness of the line itself
              color: Color(0xFFF2F2F4),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 8.0,
              ),
              child: SizedBox(
                height: 170, // <-- Increased from 100 to 200
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildStoryItem(
                      image: 'assets/images/userImg1.png',
                      label: 'Your Story',
                    ),
                    _buildStoryItem(
                      image: 'assets/images/no-image.png',
                      label: 'John Bedard',
                    ),
                  ],
                ),
              ),
            ),

            const Divider(
              // height: 40, // Total vertical space taken including padding
              thickness: 10, // Thickness of the line itself
              color: Color(0xFFF2F2F4),
            ),
            // Sample Post
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          'assets/images/userImg1.png',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Shahzad Majid",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const Text("shared a post"),
                            Row(
                              children: const [
                                Text(
                                  "1 Minute ago",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.public,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.more_horiz, // horizontal dots
                          color: Colors.grey, // lighter color
                        ),
                        onPressed: () {
                          // Handle menu options
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Post Status
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam.",
                    style: TextStyle(fontSize: 15),
                  ),

                  const SizedBox(height: 12),

                  // Reactions and comments count
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "120 Reactions",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text("15 Comments", style: TextStyle(color: Colors.grey)),
                    ],
                  ),

                  const SizedBox(height: 10),
                  Container(
                    height: 1,
                    color: Colors.grey[300],
                  ), // separator line

                  const SizedBox(height: 5),

                  // Like, Comment, Share buttons with separators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PostActionButton(
                        icon: Icons.thumb_up_alt_outlined,
                        label: "Like",
                        onTap: () {
                          // Normal tap logic (like toggle or highlight)
                        },

                        onLongPress: () {
                          showDialog(
                            context: context,
                            barrierColor:
                                Colors.transparent, // No dark background
                            builder: (context) {
                              return Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10,
                                        color: Colors.black26,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children:
                                        [
                                          '👍',
                                          '❤️',
                                          '😂',
                                          '😢',
                                          '😮',
                                          '😡',
                                        ].map((emoji) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                              // TODO: Handle emoji reaction
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 6,
                                                  ),
                                              child: Text(
                                                emoji,
                                                style: const TextStyle(
                                                  fontSize: 30,
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),

                      // PostActionButton(
                      //   icon: Icons.thumb_up_alt_outlined,
                      //   label: "Like",
                      // ),
                      Container(height: 20, width: 1, color: Colors.grey[300]),
                      PostActionButton(
                        icon: Icons.mode_comment_outlined,
                        label: "Comment",
                        onTap: () {
                          setState(() {
                            showCommentBox = !showCommentBox;
                          });
                        },
                      ),
                      Container(height: 20, width: 1, color: Colors.grey[300]),
                      PostActionButton(
                        icon: Icons.share_outlined,
                        label: "Share",
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),
                  // Container(
                  //   height: 8,
                  //   color: Colors.grey[200],
                  // ), // soft section bottom line
                ],
              ),
            ),
            if (showCommentBox)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                            'assets/images/userImg1.png',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _commentController,
                            decoration: InputDecoration(
                              hintText: "Write a comment...",
                              filled: true,
                              fillColor: Colors.grey[100],
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () {
                            // Handle sending the comment
                            final comment = _commentController.text.trim();
                            if (comment.isNotEmpty) {
                              // Save comment logic here
                              _commentController.clear();
                              FocusScope.of(context).unfocus();
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            // const Divider(),
            const Divider(
              // height: 40, // Total vertical space taken including padding
              thickness: 10, // Thickness of the line itself
              color: Color(0xFFF2F2F4),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          'assets/images/no-image.jpg',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ViewUserScreen(
                                      userName: 'John Doe',
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                "John Doe",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  // Optional: make it look clickable
                                ),
                              ),
                            ),
                            const Text("shared a post"),
                            Row(
                              children: const [
                                Text(
                                  "1 Minute ago",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.public,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.more_horiz, // horizontal dots
                          color: Colors.grey, // lighter color
                        ),
                        onPressed: () {
                          // Handle menu options
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Post Status
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam.",
                    style: TextStyle(fontSize: 15),
                  ),

                  const SizedBox(height: 12),

                  // Reactions and comments count
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("0 Reactions", style: TextStyle(color: Colors.grey)),
                      Text("15 Comments", style: TextStyle(color: Colors.grey)),
                    ],
                  ),

                  const SizedBox(height: 10),
                  Container(
                    height: 1,
                    color: Colors.grey[300],
                  ), // separator line

                  const SizedBox(height: 5),

                  // Like, Comment, Share buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PostActionButton(
                        icon: Icons.thumb_up_alt_outlined,
                        label: "Like",
                        onTap: () {},
                        onLongPress: () {
                          showDialog(
                            context: context,
                            barrierColor: Colors.transparent,
                            builder: (context) {
                              return Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10,
                                        color: Colors.black26,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children:
                                        [
                                          '👍',
                                          '❤️',
                                          '😂',
                                          '😢',
                                          '😮',
                                          '😡',
                                        ].map((emoji) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                              // TODO: Handle emoji reaction
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 6,
                                                  ),
                                              child: Text(
                                                emoji,
                                                style: const TextStyle(
                                                  fontSize: 30,
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Container(height: 20, width: 1, color: Colors.grey[300]),
                      PostActionButton(
                        icon: Icons.mode_comment_outlined,
                        label: "Comment",
                        onTap: () {
                          setState(() {
                            showCommentBox = !showCommentBox;
                          });
                        },
                      ),
                      Container(height: 20, width: 1, color: Colors.grey[300]),
                      PostActionButton(
                        icon: Icons.share_outlined,
                        label: "Share",
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),
                  // Container(height: 8, color: Colors.grey[200]),
                ],
              ),
            ),
            const Divider(
              // height: 40, // Total vertical space taken including padding
              thickness: 10, // Thickness of the line itself
              color: Color(0xFFF2F2F4),
            ),
            if (showCommentBox)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                            'assets/images/userImg1.png',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _commentController,
                            decoration: InputDecoration(
                              hintText: "Write a comment...",
                              filled: true,
                              fillColor: Colors.grey[100],
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () {
                            final comment = _commentController.text.trim();
                            if (comment.isNotEmpty) {
                              _commentController.clear();
                              FocusScope.of(context).unfocus();
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          'assets/images/userImg1.png',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Shahzad Majid",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const Text("changed profile picture"),
                            Row(
                              children: const [
                                Text(
                                  "1 Minute ago",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.public,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.more_horiz, // horizontal dots
                          color: Colors.grey, // lighter color
                        ),
                        onPressed: () {
                          // Handle menu options
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  Image.asset(
                    'assets/images/userImg1.png',
                    width: double.infinity,
                    height: 200,
                  ),
                  const SizedBox(height: 8),

                  // Reaction and comment count
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "120 Reactions",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text("15 Comments", style: TextStyle(color: Colors.grey)),
                    ],
                  ),

                  const Divider(),

                  // Action Buttons: Like, Comment, Share
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PostActionButton(
                        icon: Icons.thumb_up_alt_outlined,
                        label: "Like",
                        onTap: () {
                          // Normal tap logic (like toggle or highlight)
                        },

                        onLongPress: () {
                          showDialog(
                            context: context,
                            barrierColor:
                                Colors.transparent, // No dark background
                            builder: (context) {
                              return Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10,
                                        color: Colors.black26,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children:
                                        [
                                          '👍',
                                          '❤️',
                                          '😂',
                                          '😢',
                                          '😮',
                                          '😡',
                                        ].map((emoji) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                              // TODO: Handle emoji reaction
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 6,
                                                  ),
                                              child: Text(
                                                emoji,
                                                style: const TextStyle(
                                                  fontSize: 30,
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),

                      // PostActionButton(
                      //   icon: Icons.thumb_up_alt_outlined,
                      //   label: "Like",
                      // ),
                      Container(height: 20, width: 1, color: Colors.grey[300]),
                      PostActionButton(
                        icon: Icons.mode_comment_outlined,
                        label: "Comment",
                        onTap: () {
                          setState(() {
                            showCommentBox = !showCommentBox;
                          });
                        },
                      ),
                      Container(height: 20, width: 1, color: Colors.grey[300]),
                      PostActionButton(
                        icon: Icons.share_outlined,
                        label: "Share",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (showCommentBox)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                            'assets/images/userImg1.png',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _commentController,
                            decoration: InputDecoration(
                              hintText: "Write a comment...",
                              filled: true,
                              fillColor: Colors.grey[100],
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () {
                            // Handle sending the comment
                            final comment = _commentController.text.trim();
                            if (comment.isNotEmpty) {
                              // Save comment logic here
                              _commentController.clear();
                              FocusScope.of(context).unfocus();
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            const Divider(
              // height: 40, // Total vertical space taken including padding
              thickness: 10, // Thickness of the line itself
              color: Color(0xFFF2F2F4),
            ),
          ],
        ),
      ),

      // Bottom Nav
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: 0, // index for HomeScreen
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 26,
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              // Already on HomeScreen
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const NotificationScreen()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const ReelsScreen()),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const TrendingScreen()),
              );
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
              break;
          }
        },
        items: List.generate(5, (index) {
          IconData iconData;
          switch (index) {
            case 0:
              iconData = Icons.home_outlined;
              break;
            case 1:
              iconData = Icons.notifications_outlined;
              break;
            case 2:
              iconData = Icons.play_circle_outline;
              break;
            case 3:
              iconData = Icons.local_fire_department_outlined;
              break;
            case 4:
            default:
              iconData = Icons.settings_outlined;
              break;
          }

          final bool isSelected = index == 0; // this screen's current index

          return BottomNavigationBarItem(
            label: "",
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  iconData,
                  color: isSelected ? Colors.blue.shade900 : Colors.grey,
                  size: 26,
                ),
                const SizedBox(height: 2),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 4,
                  width: isSelected ? 10 : 0,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // Widget _buildTabButton(String title, bool selected) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
  //     decoration: BoxDecoration(
  //       color: selected ? const Color(0xFF333333) : Colors.grey[200],
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     child: Text(
  //       title,
  //       style: TextStyle(
  //         color: selected ? Colors.white : Colors.black,
  //         fontWeight: FontWeight.w500,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildTabButton(String title, bool selected) {
    return GestureDetector(
      onTap: () {
        if (title == "Most Liked") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MostLikedScreen()),
          );
        } else if (title == "Popular Posts") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PopularPostScreen()),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF333333) : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildStoryItem({required String image, required String label}) {
    final bool isYourStory = label == "Your Story";
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 100,
        height: screenHeight / 3.5, // Increased height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                ),
              ),
            ),
            Positioned(
              bottom: 6,
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage(image),
                      ),
                      if (isYourStory)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 14,
                              color: Color.fromARGB(255, 94, 105, 123),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
