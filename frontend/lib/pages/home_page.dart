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
          onPressed: () {
            
          },
          icon: const Icon(Icons.dehaze),
          color: Colors.white,
        ),
        centerTitle: true,
        title: const Text(
          'NeverNote',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 4,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          children: [
            const Divider(
              height: 10.0,
              color: Colors.white,
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(8.0),
                itemCount: 15, // Number of chat items
                separatorBuilder: (context, index) => const Divider(
                  height: 20,
                thickness: 2,
                indent: 20,
                endIndent: 0,
                color: Colors.white,
                    ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Handle chat tap
                      print('Chat ${index + 1} tapped');
                      
                    },
                    child: ListTile(
                      
                      leading: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text(
                          'A',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ), // Placeholder for contact initial
                      ),
                      title: Text(
                        'Chat ${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      
                      ),
                      subtitle: const Text(
                        'Previous typed msg....',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      ),
                      trailing: const Text(
                        '12:00 PM',
                        style: TextStyle(
                          color: Colors.grey,
                        ),), // Placeholder for timestamp
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
