import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  int activeIndex = 0;

  List<String> allItems = [
    "Shahzad Majid",
    "John Doe",
    "Jane Smith",
    "Flutter Development",
    "Trending Post",
    "Most Liked Post",
  ];

  List<String> filteredItems = [];

  // filter states
  String selectedGender = "All";
  String selectedLocation = "All";
  String selectedVerified = "All";
  String selectedStatus = "All";
  String selectedProfilePic = "All";

  @override
  void initState() {
    super.initState();
    filteredItems = [];
    _searchController.addListener(() {
      setState(() {}); // rebuild for clear button
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    setState(() {
      if (value.isEmpty) {
        filteredItems = [];
      } else {
        filteredItems = allItems
            .where((item) => item.toLowerCase().contains(value.toLowerCase()))
            .toList();
      }
    });
  }

  void _openFilterPopup() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Heading with back button
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text(
                        "Filter",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),

                  // Gender
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Gender"),
                    subtitle: Row(
                      children: ["All", "Female", "Male"]
                          .map(
                            (g) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              child: ChoiceChip(
                                label: Text(g),
                                selected: selectedGender == g,
                                onSelected: (_) {
                                  setModalState(() {
                                    selectedGender = g;
                                  });
                                },
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),

                  // Age (placeholder)
                  const ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text("Age"),
                    subtitle: Text("Select age range"),
                  ),

                  // Location dropdown
                  _buildDropdownTile(
                    "Locations",
                    selectedLocation,
                    ["All", "USA", "UK", "Canada"],
                    (value) => setModalState(() => selectedLocation = value!),
                  ),

                  // Verified
                  _buildDropdownTile(
                    "Verified",
                    selectedVerified,
                    ["All", "Yes", "No"],
                    (value) => setModalState(() => selectedVerified = value!),
                  ),

                  // Status
                  _buildDropdownTile(
                    "Status",
                    selectedStatus,
                    ["All", "Active", "Inactive"],
                    (value) => setModalState(() => selectedStatus = value!),
                  ),

                  // Profile Picture
                  _buildDropdownTile(
                    "Profile Picture",
                    selectedProfilePic,
                    ["All", "With Picture", "Without Picture"],
                    (value) => setModalState(() => selectedProfilePic = value!),
                  ),

                  const SizedBox(height: 16),

                  // Apply button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF022D89),
                        minimumSize: const Size.fromHeight(45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Filter applied")),
                        );
                      },
                      child: const Text(
                        "Apply Filter",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDropdownTile(
    String title,
    String selectedValue,
    List<String> options,
    ValueChanged<String?> onChanged,
  ) {
    return ListTile(
      title: Text(title),
      trailing: DropdownButton<String>(
        value: selectedValue,
        items: options
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          height: 42,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const Icon(Icons.search, color: Color(0xFF022D89)),
              const SizedBox(width: 6),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(color: Color(0xFF022D89)),
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    hintStyle: const TextStyle(color: Color(0xFF022D89)),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(
                              Icons.clear,
                              color: Color(0xFF022D89),
                            ),
                            onPressed: () {
                              setState(() {
                                _searchController.clear();
                                filteredItems = [];
                              });
                            },
                          )
                        : null,
                  ),
                  onChanged: _onSearchChanged,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_rounded),
            onPressed: _openFilterPopup,
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab row with underline
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTab("Users", 0),
                  _buildTab("Pages", 1),
                  _buildTab("Groups", 2),
                ],
              ),
              Container(height: 1, color: Colors.grey.shade300),
            ],
          ),

          // Search results or empty state
          Expanded(
            child: filteredItems.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.search),
                        title: Text(filteredItems[index]),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "You selected: ${filteredItems[index]}",
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final isActive = activeIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          activeIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isActive ? const Color(0xFF022D89) : Colors.black,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              height: 2,
              width: 40,
              color: isActive ? const Color(0xFF022D89) : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Image.asset("assets/images/search.jpg", fit: BoxFit.contain),
            const SizedBox(height: 20),
            const Text(
              "Sad no results!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 8),
            const Text(
              "We cannot find the keyword you are searching from maybe a little spelling mistake ?",
              style: TextStyle(color: Colors.grey, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF022D89),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Search Random",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
