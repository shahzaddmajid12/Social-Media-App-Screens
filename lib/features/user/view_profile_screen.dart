import 'package:flutter/material.dart';

class ViewProfileScreen extends StatelessWidget {
  const ViewProfileScreen({super.key});

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Wrap(
        children: const [
          ListTile(
            leading: Icon(Icons.photo_camera),
            title: Text('Edit Profile Picture'),
          ),
          ListTile(leading: Icon(Icons.image), title: Text('Edit Cover')),
          ListTile(leading: Icon(Icons.link), title: Text('Copy Link')),
          ListTile(leading: Icon(Icons.share), title: Text('Share')),
          ListTile(leading: Icon(Icons.list), title: Text('Activities')),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('View Privacy Shortcuts'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Account Settings'),
          ),
          ListTile(leading: Icon(Icons.upgrade), title: Text('Upgrade Now')),
        ],
      ),
    );
  }

  void _showPostOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Wrap(
        children: const [
          ListTile(
            leading: Icon(Icons.bookmark_border),
            title: Text('Save Post'),
          ),
          ListTile(leading: Icon(Icons.text_fields), title: Text('Copy Text')),
          ListTile(leading: Icon(Icons.link), title: Text('Copy Link')),
          ListTile(leading: Icon(Icons.report), title: Text('Report Post')),
          ListTile(leading: Icon(Icons.edit), title: Text('Edit Post')),
          ListTile(leading: Icon(Icons.trending_up), title: Text('Boost Post')),
          ListTile(
            leading: Icon(Icons.block), // ✅ Correct alternative
            title: Text('Disable Comments'),
          ),
          ListTile(
            leading: Icon(Icons.delete_outline),
            title: Text('Delete Post'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 220,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/defaultCover.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(Icons.more_horiz, color: Colors.white),
                    onPressed: () => _showMoreOptions(context),
                  ),
                ),
                Positioned(
                  bottom: -50,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/userImg1.png'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            const Center(
              child: Column(
                children: [
                  Text(
                    'Shahzad Majid',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text('@shahzaday', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Edit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.qr_code, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.more_horiz, color: Colors.grey),
                      onPressed: () => _showMoreOptions(context),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _StatColumn(count: '1.2k', label: 'Followers'),
                  _StatColumn(count: '345', label: 'Following'),
                  _StatColumn(count: '6.8k', label: 'Likes'),
                  _StatColumn(count: '1.5k', label: 'Points'),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'ABOUT',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Hi there I am using SM',
                style: TextStyle(color: Colors.black87),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                children: [
                  Icon(Icons.male, size: 20, color: Colors.blue),
                  SizedBox(width: 6),
                  Text('Male'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Activity
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          'assets/images/userImg1.png',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Shahzad Majid",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 5),
                              GestureDetector(
                                onTap: () => _showPostOptions(context),
                                child: const Icon(
                                  Icons.more_horiz,
                                  size: 20,
                                  color: Colors.black, // No grey background
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                "5 days ago",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(width: 5),
                              Icon(Icons.public, size: 16, color: Colors.grey),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'What a lovely weather',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.thumb_up_alt_outlined),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.comment_outlined),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.share_outlined),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String count;
  final String label;

  const _StatColumn({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
