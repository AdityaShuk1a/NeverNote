import 'package:flutter/material.dart';
import 'package:nevernote/components/drawer.dart';

late Size mq;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Sample list of user data
  final List<Map<String, String>> users = [
    {"name": "Alice", "initial": "A"},
    {"name": "Bob", "initial": "B"},
    {"name": "Charlie", "initial": "C"},
  ];

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size; // Store screen size
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white), // Custom icon
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open drawer on click
              },
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          'NeverNote',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 4,
      ),
      drawer: const DrawerBar(), // Use your custom drawer
      body: ListView.builder(
        itemCount: users.length, // Number of list items
        itemBuilder: (context, index) {
          final user = users[index]; // Get user data
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Rounded corners
              ),
              elevation: 3,
              child: Column(
                children: [
                  Container(
                    child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent, // Avatar background
                  child: Text(
                    user['initial']!, // Initial of user
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  user['name']!, // Username
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                
                onTap: () {
                  _showUserDetails(user['name']!); // Handle tap
                },
                
              ),
                  )
                  
                ],

              )
              

            ),
          );
        },
      ),
    );
  }

  // Method to display a user's details
  void _showUserDetails(String name) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('User: $name'),
          content: const Text('This is the user\'s detail page.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
