import 'package:flutter/material.dart';
import 'package:splash_app/features/trending/hashtag_posts_screen.dart';
// import 'package:splash_app/home.dart';
// import 'package:splash_app/notification_screen.dart';
// import 'package:splash_app/reels_screen.dart';
// import 'package:splash_app/settings_screen.dart';
import 'package:splash_app/features/notification/notification_screen.dart';
import 'package:splash_app/features/reels/reels_screen.dart';
import 'package:splash_app/features/settings/settings_screen.dart';
import 'package:splash_app/features/home/home.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
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
            icon: const Icon(Icons.add_box_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ PRO USERS section with padding
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PRO USERS',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Stack(
                        children: [
                          // Outer white border
                          Container(
                            padding: const EdgeInsets.all(
                              2,
                            ), // white border thickness
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white, // white border color
                            ),
                            child: CircleAvatar(
                              backgroundImage: const AssetImage(
                                'assets/images/userImg1.png',
                              ),
                              radius: 28,
                            ),
                          ),
                          // Orange plus icon
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors
                                      .white, // tiny white border around plus
                                  width: 1.5,
                                ),
                              ),
                              padding: const EdgeInsets.all(2),
                              child: const Icon(
                                Icons.add,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      // Second avatar with white border
                      Stack(
                        children: [
                          // Outer white border
                          Container(
                            padding: const EdgeInsets.all(
                              2,
                            ), // white border thickness
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white, // white border color
                            ),
                            child: CircleAvatar(
                              backgroundImage: const AssetImage(
                                'assets/images/johndoe.png',
                              ),
                              radius: 28,
                            ),
                          ),
                          // Orange plus icon
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFF724C),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors
                                      .white, // tiny white border around plus
                                  width: 1.5,
                                ),
                              ),
                              padding: const EdgeInsets.all(2),
                              child: const Icon(
                                Icons.rocket_launch,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),
            // ❌ No padding around divider
            const Divider(thickness: 10, color: Color(0xFFF2F2F4)),
            const SizedBox(height: 15),

            // ✅ Trending Hashtags with padding
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'TRENDING HASHTAGS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(
                          color: Color(0xFF022D89),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildHashtagTile(context, '#casino', '38 Post'),
                  _buildHashtagTile(context, '#shower', '12 Post'),
                  _buildHashtagTile(context, '#delta', '5 Post'),
                  _buildHashtagTile(context, '#vape', '3 Post'),
                  _buildHashtagTile(context, '#gift', '2 Post'),
                ],
              ),
            ),

            const Divider(thickness: 10, color: Color(0xFFF2F2F4)),

            // ✅ Weather section stays full width (no extra padding)
            _buildWeatherSection(),
            const Divider(thickness: 10, color: Color(0xFFF2F2F4)),

            // ✅ Last Blogs section with padding
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'LAST BLOGS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(
                          color: Color(0xFF022D89),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildBlogCard(
                    title: 'Latest Free Movies To Watch This Week',
                    category: 'Cars and Vehicles',
                  ),
                  const SizedBox(height: 12),
                  _buildBlogCard(
                    title: 'Top-Rated Authorized Free Movie Sites',
                    category: 'Cars and Vehicles',
                  ),
                  const SizedBox(height: 12),
                  _buildBlogCard(
                    title: 'Stream High-Quality Free Movies Without Signup',
                    category: 'Gaming',
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: 3, // index for TrendingScreen
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
              // Already on TrendingScreen
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

          final bool isSelected = index == 3; // this screen's current index

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

  // Hashtag tile with color updates
  static Widget _buildHashtagTile(
    BuildContext context,
    String tag,
    String subtitle,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(tag, style: const TextStyle(color: Color(0xFF022D89))),
      subtitle: Text(subtitle),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Color(0xFF022D89),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => HashtagPostsScreen(hashtag: tag)),
        );
      },
    );
  }

  // Blog card
  // Blog card
  static Widget _buildBlogCard({
    required String title,
    required String category,
  }) {
    return Container(
      height: 180, // ✅ fixed height so 3 fit in one phone screen
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey, // ✅ grey background
        // borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            category,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),

          const SizedBox(height: 8),
          // Small button
          SizedBox(
            height: 30,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                textStyle: const TextStyle(fontSize: 12),
              ),
              onPressed: () {},
              child: const Text("⚡ Read"),
            ),
          ),
        ],
      ),
    );
  }

  // Weather section widget
  static Widget _buildWeatherSection() {
    return Container(
      width: double.infinity, // ✅ full width
      height: 550, // ✅ set desired height (adjust as needed)
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/weather.png'),
          fit: BoxFit.cover, // ✅ cover whole container
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 15),

          const Text(
            'Weather',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.wb_sunny, color: Colors.white, size: 48),
              SizedBox(width: 10),
              Text(
                '24°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 80,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            'Alberta, Canada',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 15),

          const Text(
            'Partly cloudy',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _WeatherInfo(icon: Icons.air, label: 'Wind', value: '6 mph'),
              _WeatherInfo(icon: Icons.water_drop, label: 'Rain', value: '0 %'),
              _WeatherInfo(
                icon: Icons.opacity,
                label: 'Humidity',
                value: '44 %',
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 16),

          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                _HourlyForecast(
                  time: '2:00 PM',
                  icon: Icons.nightlight_round,
                  temp: '14.8°',
                ),
                _HourlyForecast(
                  time: '6:00 PM',
                  icon: Icons.wb_sunny,
                  temp: '13.7°',
                ),
                _HourlyForecast(
                  time: '10:00 PM',
                  icon: Icons.wb_sunny,
                  temp: '21.9°',
                ),
                _HourlyForecast(
                  time: '2:00 AM',
                  icon: Icons.wb_sunny,
                  temp: '24.6°',
                ),
                _HourlyForecast(
                  time: '6:00 AM',
                  icon: Icons.cloud,
                  temp: '23.1°',
                ),
                _HourlyForecast(
                  time: '9:00 AM',
                  icon: Icons.cloud,
                  temp: '17°',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Weather info widget
class _WeatherInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _WeatherInfo({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            // fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }
}

// Hourly forecast widget
class _HourlyForecast extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temp;

  const _HourlyForecast({
    required this.time,
    required this.icon,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: const TextStyle(color: Colors.white, fontSize: 12)),
          const SizedBox(height: 4),
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(height: 4),
          Text(temp, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
