import 'package:flutter/material.dart';
import 'package:nevernote/models/profile_data.dart';
import 'package:nevernote/services/profile_data_service.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard({super.key});
  
  final check = ProfileDataService().fetchProfileData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_rounded)),
        title: Text("Profile"),
      ),
      body: FutureBuilder (
        future: ProfileDataService().fetchProfileData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var profile = snapshot.data! as List<ProfileData>; // Change this to ProfileData instead of List<ProfileData>
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Text("A"),
                    ),
                    const SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile[0].fullName!, // Ensure profile is not null
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(profile[0].userEmail!),
                        Text(profile[0].userPhoneNumber.toString()),
                      ],
                    ),
                      ]
                      
                      ),
                    ),
                    
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          // Display a loading indicator while fetching data
          return const Center(child: CircularProgressIndicator(color: Colors.black));
        },
      ),
    );
  }
}

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("data"),
//         actions: [
//           IconButton(onPressed: (){
//             return print(check);
//           }, icon: Icon(Icons.refresh))
//         ],
//       ),
      
      
//     );
// }
// }