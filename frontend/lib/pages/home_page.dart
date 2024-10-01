import 'package:flutter/material.dart';

late Size mq;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.dehaze),
        ),
        centerTitle: true,
        title: const Text(
          'NeverNote',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        elevation: 4,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(8.0),
                itemCount: 5, // Number of chat items
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Handle chat tap
                      print('Chat ${index + 1} tapped');
                      
                    },
                    child: ListTile(
                      
                      leading: const CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Text('A'), // Placeholder for contact initial
                      ),
                      title: Text('Chat ${index + 1}'),
                      subtitle: Text('Last message preview...'),
                      trailing: Text('12:00 PM'), // Placeholder for timestamp
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
