import 'package:flutter/material.dart';
import 'package:nevernote/models/profile_data.dart';
import 'package:nevernote/pages/home_page.dart';
import 'package:nevernote/services/profile_data_service.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context) => Home()));
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: ProfileDataService().fetchProfileData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var profile = snapshot.data! as List<ProfileData>;
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.network(
                          "https://th.bing.com/th/id/OIP.zIWiSIkJN6_EFgJrQwyXFwHaE8?rs=1&pid=ImgDetMain",
                          height: 240,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: -50,
                          left: MediaQuery.of(context).size.width * 0.35,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 50,
                            child: const Text(
                              "A",
                              style: TextStyle(fontSize: 40.0, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 70), // Adjusted to prevent overlap
                    const Divider(color: Colors.grey, thickness: 1.5, height: 5),
                    const SizedBox(height: 20),
                    const Text(
                      "Account Info",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildProfileTile(
                            icon: Icons.person,
                            title: "UserName",
                            subtitle: profile[0].fullName!,
                          ),
                          _buildProfileTile(
                            icon: Icons.email,
                            title: "Email",
                            subtitle: profile[0].userEmail!,
                          ),
                          _buildProfileTile(
                            icon: Icons.phone,
                            title: "Phone Number",
                            subtitle: profile[0].userPhoneNumber.toString(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator(color: Colors.white));
        },
      ),
    );
  }

  Widget _buildProfileTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black87,
          ),
        ),
        tileColor: Colors.lightBlue[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // Circular border
        ),
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      ),
    );
  }
}
