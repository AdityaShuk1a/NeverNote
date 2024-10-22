import 'package:flutter/material.dart';
import 'package:nevernote/components/drawer.dart';
import 'package:nevernote/helpers/user_data.dart';

late Size mq;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Sample user and notes data
  final String username = UserData.username.toString();
  final List<Map<String, String>> users = [
    {
      "name": "Alice",
      "initial": "A",
      "noteHead": "Flutter Tips",
      "noteBody": "Use StatelessWidget whenever possible.",
    },
    {
      "name": "Bob",
      "initial": "B",
      "noteHead": "Django Intro",
      "noteBody": "Django simplifies backend development.",
    },
    {
      "name": "Charlie",
      "initial": "C",
      "noteHead": "Coding Fun",
      "noteBody": "Always comment your code properly!",
    },
  ];

  // Colors
  final Color avatarBackgroundColor = Colors.blueAccent;
  final Color appBarBackgroundColor = const Color.fromARGB(255, 0, 0, 0);
  final Color noteHeadBackgroundColor = Colors.blue[200]!;
  final Color noteBodyBackgroundColor = const Color.fromARGB(255, 146, 143, 244);

  // Text Styles
  final TextStyle appBarTitleStyle = const TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  final TextStyle avatarTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  final TextStyle usernameTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  final TextStyle noteHeadTextStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  final TextStyle noteBodyTextStyle = const TextStyle(
    fontSize: 14,
  );

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
        title:  Text('NeverNote', style: TextStyle(color: Colors.white)),
        backgroundColor: appBarBackgroundColor,
        elevation: 4,
      ),
      drawer: const DrawerBar(), // Use your custom drawer

      // List of users with their notes
      body: ListView.builder(
        itemCount: users.length, // Number of items
        itemBuilder: (context, index) {
          final user = users[index]; // Fetch user data

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Rounded corners
              ),
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User Tile with Avatar and Username
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: avatarBackgroundColor,
                      child: Text(
                        user['initial']!,
                        style: avatarTextStyle,
                      ),
                    ),
                    title: Text(
                      user['name']!,
                      style: usernameTextStyle,
                    ),
                    onTap: () {
                      _showUserDetails(user['name']!);
                    },
                  ),

                  // Note Heading Container
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    color: noteHeadBackgroundColor,
                    child: Text(
                      user['noteHead']!,
                      style: noteHeadTextStyle,
                    ),
                  ),

                  // Note Body Container
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    color: noteBodyBackgroundColor,
                    child: Text(
                      user['noteBody']!,
                      style: noteBodyTextStyle,
                    ),
                  ),
                ],
              ),
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
