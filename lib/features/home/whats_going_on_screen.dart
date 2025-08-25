import 'package:flutter/material.dart';

class WhatsGoingOnScreen extends StatefulWidget {
  const WhatsGoingOnScreen({super.key});

  @override
  State<WhatsGoingOnScreen> createState() => _WhatsGoingOnScreenState();
}

class _WhatsGoingOnScreenState extends State<WhatsGoingOnScreen> {
  String _privacy = "Everyone";
  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0, // match PopularPostScreen
          title: const Text(
            'Add Post',
            style: TextStyle(fontSize: 18, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                // handle submit
                // print("Post: ${_postController.text}, Privacy: $_privacy");
              },
              child: const Text(
                'Post',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(height: 1, color: Colors.grey.shade300),
          ),
        ),
      ),
      body: Container(
        color: Colors.white, // ensure body is pure white
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile + Privacy row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage("assets/images/userImg1.png"),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    "Shahzad Majid",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Container(
                  height: 36,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _privacy,
                      dropdownColor: Colors.white,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: "Everyone",
                          child: Text("Everyone"),
                        ),
                        DropdownMenuItem(
                          value: "Only Friends",
                          child: Text("Only Friends"),
                        ),
                      ],
                      onChanged: (v) => setState(() => _privacy = v!),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Composer
            Expanded(
              child: TextField(
                controller: _postController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: "whats going on? #hash @mention",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
