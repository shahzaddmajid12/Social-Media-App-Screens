import 'package:flutter/material.dart';
import 'package:splash_app/widgets/post_action_button.dart';
import 'package:splash_app/features/user/view_user_screen.dart';

class HashtagPostsScreen extends StatefulWidget {
  final String hashtag;

  const HashtagPostsScreen({super.key, required this.hashtag});

  @override
  State<HashtagPostsScreen> createState() => _HashtagPostsScreenState();
}

class _HashtagPostsScreenState extends State<HashtagPostsScreen> {
  bool showCommentBox = false;

  final List<Map<String, String>> dummyPosts = [
    {
      'name': 'N Smith',
      'time': '2 hours ago',
      'image': 'assets/images/no-image.jpg',
      'link': 'https://example.com',
      'text': 'Check out this amazing post about Flutter!',
    },
    {
      'name': 'A Johnson',
      'time': '1 hour ago',
      'image': 'assets/images/no-image.jpg',
      'link': 'https://example.com',
      'text': 'Loving the features of Flutter 3!',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.hashtag,
          style: const TextStyle(
            // color: Colors.blueAccent,
            // fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: dummyPosts.length,
        itemBuilder: (context, index) {
          final post = dummyPosts[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(post['image']!),
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
                                  builder: (context) =>
                                      ViewUserScreen(userName: post['name']!),
                                ),
                              );
                            },
                            child: Text(
                              post['name']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            post['time']!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            post['text'] ?? '',
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(height: 4),
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Visit: ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                TextSpan(
                                  text: post['link'] ?? '',
                                  style: const TextStyle(
                                    color: Color(0xFF98343e),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFF98343e),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_horiz, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PostActionButton(
                    icon: Icons.thumb_up_alt_outlined,
                    label: "Like",
                    onTap: () {},
                  ),
                  PostActionButton(
                    icon: Icons.mode_comment_outlined,
                    label: "Comment",
                    onTap: () {
                      setState(() {
                        showCommentBox = !showCommentBox;
                      });
                    },
                  ),
                  PostActionButton(
                    icon: Icons.share_outlined,
                    label: "Share",
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 1, color: Color(0xFFF2F2F4)),
            ],
          );
        },
      ),
    );
  }
}
