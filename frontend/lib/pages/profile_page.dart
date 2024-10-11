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
        leading: IconButton(onPressed: () {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => Home() )
          );
        }, icon: Icon(Icons.arrow_back_ios_rounded)),
        title: Text("Profile",
        style: TextStyle(
          color: Colors.black,
        ),),
      ),
      body: FutureBuilder(
        future: ProfileDataService().fetchProfileData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var profile = snapshot.data! as List<ProfileData>;
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 100,
                        child: Text(
                          "A",
                          style: TextStyle(fontSize: 40.0, color: Colors.black),
                        ),
                      ),
                      // const SizedBox(height: 20.0),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1.5,
                        height: 5,
                      ),
                      // const SizedBox(height: 20.0),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white70),
                        ),
                        child: Column(
                          children: [
                            Text(
                              profile[0].fullName!,
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(color: Colors.black54, offset: Offset(1, 1), blurRadius: 4),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              profile[0].userEmail!,
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.white70,
                                shadows: [
                                  Shadow(color: Colors.black54, offset: Offset(1, 1), blurRadius: 4),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              profile[0].userPhoneNumber.toString(),
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.white70,
                                shadows: [
                                  Shadow(color: Colors.black54, offset: Offset(1, 1), blurRadius: 4),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
}
  

