import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _selectedTab = 0; // 0 = Chats, 1 = Group, 2 = Archive
  int _selectedBottomIndex = 0;

  final List<String> _tabs = ["Chats", "Group", "Archive"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Chats",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 15),
          Icon(Icons.location_on_outlined, color: Colors.black),
          SizedBox(width: 15),
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 10),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[100], // light grey background
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: List.generate(_tabs.length, (index) {
                  bool isActive = _selectedTab == index;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTab = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: isActive
                              ? const Color(0xFF022D89)
                              : Colors.grey[100], // active/inactive
                          borderRadius: BorderRadius.circular(25),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          _tabs[index],
                          style: TextStyle(
                            color: isActive ? Colors.white : Colors.grey[500],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _selectedTab == 0
                  ? Icons.message_outlined
                  : _selectedTab == 1
                  ? Icons.people_outline
                  : Icons.archive_outlined,
              size: 50,
              color: const Color(0xFF022D89),
            ),
            const SizedBox(height: 15),
            Text(
              _selectedTab == 0
                  ? "No more messages"
                  : _selectedTab == 1
                  ? "There are no groups"
                  : "No Archived chats",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            if (_selectedTab == 0) ...[
              const Text(
                "Start new conversations by going to >>",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 5),
              const Text(
                "Contacts",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ] else if (_selectedTab == 1) ...[
              const Text(
                "Start adding new groups",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedBottomIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color(0xFF022D89),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedBottomIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 32),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
