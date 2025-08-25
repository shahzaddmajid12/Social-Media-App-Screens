import 'package:flutter/material.dart';
// import 'package:splash_app/home.dart';
// import 'package:splash_app/reels_screen.dart';
// import 'package:splash_app/settings_screen.dart';
// import 'package:splash_app/trending_screen.dart';
import 'package:splash_app/features/home/home.dart';
import 'package:splash_app/features/reels/reels_screen.dart';
import 'package:splash_app/features/trending/trending_screen.dart';
import 'package:splash_app/features/settings/settings_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int selectedTabIndex = 0;

  // Sample data
  final List<Map<String, dynamic>> allNotifications = [
    {
      'name': 'John Doe',
      'activity': 'followed you',
      'time': '8 hours ago',
      'image': 'assets/images/no-image.jpg',
    },
    {
      'name': 'Alice',
      'activity': 'liked your post',
      'time': '1 day ago',
      'image': 'assets/images/no-image.jpg',
    },
  ];

  final List<Map<String, dynamic>> lastActivities =
      []; // empty → no notifications
  final List<Map<String, dynamic>> friendsBirthdays = [
    {
      'name': 'Mike Ross',
      'activity': 'has a birthday today 🎉',
      'time': '',
      'image': 'assets/images/no-image.jpg',
    },
  ];

  List<Map<String, dynamic>> _getSelectedList() {
    switch (selectedTabIndex) {
      case 1:
        return lastActivities;
      case 2:
        return friendsBirthdays;
      default:
        return allNotifications;
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedList = _getSelectedList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
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
            onPressed: () {},
          ),
          // IconButton(
          //   icon: const Icon(Icons.chat_bubble_outline, color: Colors.black),
          //   onPressed: () {},
          // ),
          IconButton(
            icon: const Icon(Icons.add_box_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tab Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                _buildTabButton("All", 0),
                const SizedBox(width: 10),
                _buildTabButton("Last Activities", 1),
                const SizedBox(width: 10),
                _buildTabButton("Friends Birthday", 2),
              ],
            ),
          ),
          const Divider(color: Color(0xFFF2F2F4)),
          // const Divider(thickness: 10, color: Color(0xFFF2F2F4)),

          // Notification content
          Expanded(
            child: selectedList.isEmpty
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 40),
                          Image.asset(
                            "assets/images/notification.jpg",
                            width: double.infinity,
                            height: 250, // adjust height as needed
                            fit: BoxFit
                                .cover, // makes image cover available space
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "No Notifications Yet",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Stay tuned! notifications about your activity will show up here.",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: selectedList.length,
                    itemBuilder: (context, index) {
                      final notification = selectedList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                notification['image'],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: notification['name'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        const TextSpan(text: ' '),
                                        TextSpan(
                                          text: notification['activity'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (notification['time'] != "")
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Text(
                                        notification['time'],
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: 1, // index for NotificationScreen
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 26,
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
              break;
            case 1:
              // Already on NotificationScreen
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

          final bool isSelected = index == 1; // this screen's current index

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
                const SizedBox(height: 2), // <-- Gap between icon and underline
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

  Widget _buildTabButton(String title, int index) {
    final bool selected = selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
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
}
