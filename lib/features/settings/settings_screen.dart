import 'package:flutter/material.dart';
import 'package:splash_app/features/settings/go_pro_account_screen.dart';
// import 'package:splash_app/home.dart';
// import 'package:splash_app/notification_screen.dart';
// import 'package:splash_app/reels_screen.dart';
// import 'package:splash_app/trending_screen.dart';
import 'package:splash_app/features/user/view_profile_screen.dart';
import 'package:splash_app/features/settings/general_account_screen.dart';
import 'package:splash_app/features/settings/help_and_support.dart';
import 'package:splash_app/features/settings/invitation_links.dart';
import 'package:splash_app/features/settings/my_information_screen.dart';
import 'package:splash_app/features/settings/privacy_screen.dart';
import 'package:splash_app/features/settings/notifications_setting_screen.dart';
import 'package:splash_app/features/settings/earning_screen.dart';
import 'package:splash_app/features/settings/go_pro_account_screen.dart';
import 'package:splash_app/features/settings/demo_screen.dart';
import 'package:splash_app/features/settings/following_screen.dart';
import 'package:splash_app/features/notification/notification_screen.dart';
import 'package:splash_app/features/reels/reels_screen.dart';
import 'package:splash_app/features/trending/trending_screen.dart';
import 'package:splash_app/features/home/home.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔸 Add this block at the very top of the build method
    final List<Color> backgroundColors = [
      Colors.orange.shade100.withOpacity(0.4),
      Colors.purple.shade100.withOpacity(0.4),
      Colors.pink.shade100.withOpacity(0.4),
      Colors.blue.shade100.withOpacity(0.4),
      Colors.red.shade100.withOpacity(0.4),
      Colors.redAccent.shade100.withOpacity(0.4),
      Colors.indigoAccent.shade100.withOpacity(0.4),
      Colors.purpleAccent.shade100.withOpacity(0.4),

      Colors.pinkAccent.shade100.withOpacity(0.4),
      Colors.red.shade100.withOpacity(0.4),
      Colors.indigo.shade100.withOpacity(0.4),
      Colors.deepPurple.shade100.withOpacity(0.4),

      Colors.deepPurpleAccent.shade100.withOpacity(0.4),
      Colors.green.shade100.withOpacity(0.4),
      Colors.indigo.shade100.withOpacity(0.4),
      Colors.brown.shade100.withOpacity(0.4),

      Colors.tealAccent.shade100.withOpacity(0.4),
      Colors.greenAccent.shade100.withOpacity(0.4),
      Colors.pinkAccent.shade100.withOpacity(0.4),
      Colors.amber.shade100.withOpacity(0.4),

      Colors.lightBlue.shade100.withOpacity(0.4),
      Colors.red.shade100.withOpacity(0.4),
      Colors.deepOrange.shade100.withOpacity(0.4),
      Colors.deepPurpleAccent.shade100.withOpacity(0.4),
    ];

    final List<Color> iconColors = [
      Colors.orange.shade900,
      Colors.purple.shade900,
      Colors.pink.shade900,
      Colors.blue.shade900,

      Colors.red.shade900,
      Colors.redAccent.shade700,
      Colors.indigoAccent.shade700,
      Colors.purpleAccent.shade700,

      Colors.pinkAccent.shade700,
      Colors.red.shade600,
      Colors.indigo.shade900,
      Colors.deepPurple.shade900,

      Colors.deepPurpleAccent.shade400,
      Colors.green.shade900,
      Colors.indigo.shade400,
      Colors.brown.shade900,

      Colors.tealAccent.shade700,
      Colors.greenAccent.shade700,
      Colors.pinkAccent.shade400,
      Colors.amber.shade900,

      Colors.lightBlue.shade400,
      Colors.red.shade200,
      Colors.deepOrange.shade900,
      Colors.deepPurpleAccent.shade400,
    ];

    final List<Map<String, dynamic>> settingsOptions = [
      {'icon': Icons.message_outlined, 'label': 'Messages'},
      {'icon': Icons.group_outlined, 'label': 'Following'},
      {'icon': Icons.touch_app_outlined, 'label': 'Pokes'},
      {'icon': Icons.photo_album_outlined, 'label': 'Albums'},
      {'icon': Icons.image_outlined, 'label': 'My Images'},
      {'icon': Icons.videocam_outlined, 'label': 'My Videos'},
      {'icon': Icons.bookmark_outline, 'label': 'Saved Posts'},
      {'icon': Icons.groups_outlined, 'label': 'Groups'},
      {'icon': Icons.flag_outlined, 'label': 'Pages'},
      {'icon': Icons.edit_outlined, 'label': 'Articles'},
      {'icon': Icons.shopping_cart_outlined, 'label': 'Marketplace'},
      {'icon': Icons.rocket_launch_outlined, 'label': 'Boosted'},
      {'icon': Icons.whatshot_outlined, 'label': 'Popular Posts'},
      {'icon': Icons.event_outlined, 'label': 'Events'},
      {'icon': Icons.person_search_outlined, 'label': 'Find Friends'},
      {'icon': Icons.local_offer_outlined, 'label': 'Offers'},
      {'icon': Icons.movie_outlined, 'label': 'Movies'},
      {'icon': Icons.work_outline, 'label': 'Jobs'},
      {'icon': Icons.lightbulb_outline, 'label': 'Common Things'},
      {'icon': Icons.memory_outlined, 'label': 'Memories'},
      {'icon': Icons.monetization_on_outlined, 'label': 'Funding'},
      {'icon': Icons.sports_esports_outlined, 'label': 'Games'},
      {'icon': Icons.videocam_outlined, 'label': 'Live Videos'},
      {'icon': Icons.tv_outlined, 'label': 'Advertising'},
    ];

    final List<Map<String, dynamic>> otherSettings = [
      {
        'icon': Icons.manage_accounts_outlined,
        'label': 'General Account',
      }, // 👤⚙️
      {'icon': Icons.lock_outline, 'label': 'Privacy'},
      {'icon': Icons.notifications_outlined, 'label': 'Notifications'},
      {'icon': Icons.link_outlined, 'label': 'Invitation Links'},
      {'icon': Icons.info_outline, 'label': 'My Information'},
      {
        'icon': Icons.location_on_outlined,
        'label': 'My Addresses',
      }, // ℹ️ in circle
      {
        'icon': Icons.account_balance_wallet_outlined,
        'label': 'Earnings',
      }, // ✋ (hand, no $)
      {'icon': Icons.help_outline, 'label': 'Help & Support'},
      {'icon': Icons.logout_outlined, 'label': 'Logout'},
    ];

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
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add_box_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        // NEW: Wrap with scroll
        child: Column(
          children: [
            // Profile banner
            // View Profile Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ViewProfileScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/images/userImg1.png',
                        ),
                        radius: 24,
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Shahzad Majid",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "View Profile",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF022D89), // Custom blue
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Color(0xFF022D89), // Custom blue
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // GridView (in shrink-wrapped)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: settingsOptions.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final item = settingsOptions[index];
                  // 🔸 Add these two lines inside itemBuilder
                  // final bgColor = backgroundColors[index % backgroundColors.length];
                  // final iconColor = iconColors[index % iconColors.length];
                  final bgColor = backgroundColors[index]; // no modulo needed
                  final iconColor = iconColors[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const DemoScreen(), // ✅ opens DemoScreen
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(item['icon'], color: iconColor, size: 20),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item['label'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                  // return Column(
                  //   children: [
                  //     Container(
                  //       width: 44,
                  //       height: 44,
                  //       decoration: BoxDecoration(
                  //         color: bgColor,
                  //         borderRadius: BorderRadius.circular(
                  //           10,
                  //         ), // Square with rounded corners
                  //       ),
                  //       child: Icon(item['icon'], color: iconColor, size: 20),
                  //     ),
                  //     const SizedBox(height: 6),
                  //     Text(
                  //       item['label'],
                  //       textAlign: TextAlign.center,
                  //       style: const TextStyle(fontSize: 12),
                  //     ),
                  //   ],
                  // );

                  // return Column(
                  //   children: [
                  //     CircleAvatar(
                  //       radius: 22,
                  //       backgroundColor: bgColor, // use dynamic background
                  //       child: Icon(
                  //         item['icon'],
                  //         color: iconColor, // use dynamic icon color
                  //         size: 20,
                  //       ),
                  //     ),
                  //     const SizedBox(height: 6),
                  //     Text(
                  //       item['label'],
                  //       textAlign: TextAlign.center,
                  //       style: const TextStyle(fontSize: 12),
                  //     ),
                  //   ],
                  // );
                },
              ),
            ),

            // NEW: Go Pro Account button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF022D89), // navy blue
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Text('👑', style: TextStyle(fontSize: 18)),
                label: const Text(
                  'Go Pro Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GoProAccountScreen(),
                    ),
                  );
                },
              ),
            ),

            // NEW: Other Settings header
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Other Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            // NEW: Other Settings List
            // ListView.builder(
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemCount: otherSettings.length,
            //   itemBuilder: (context, index) {
            //     final item = otherSettings[index];
            //     return ListTile(
            //       leading: Icon(item['icon'], color: Color(0xFF022D89)),
            //       title: Text(item['label']),
            //       trailing: const Icon(
            //         Icons.arrow_forward_ios,
            //         size: 16,
            //         color: Color(0xFF022D89),
            //       ),
            //       onTap: () {}, // Add navigation if needed
            //     );
            //   },
            // ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: otherSettings.length,
              itemBuilder: (context, index) {
                final item = otherSettings[index];
                return ListTile(
                  leading: Icon(item['icon'], color: const Color(0xFF022D89)),
                  title: Text(item['label']),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Color(0xFF022D89),
                  ),
                  onTap: () {
                    switch (item['label']) {
                      case 'General Account':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GeneralAccountScreen(),
                          ),
                        );
                        break;
                      case 'Privacy':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrivacyScreen(),
                          ),
                        );
                        break;
                      case 'Notifications':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const NotificationsSettingScreen(),
                          ),
                        );
                        break;
                      case 'Invitation Links':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InvitationLinksScreen(),
                          ),
                        );
                        break;
                      case 'My Information':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyInformationScreen(),
                          ),
                        );
                        break;
                      case 'Earnings':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EarningScreen(),
                          ),
                        );
                        break;
                      case 'Help & Support':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HelpAndSupportScreen(),
                          ),
                        );
                        break;
                      case 'Logout':
                        // 🔹 Keep empty for now
                        break;
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: 4, // index for SettingsScreen
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
              // Already on SettingsScreen
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

          final bool isSelected = index == 4; // this screen's current index

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
}
