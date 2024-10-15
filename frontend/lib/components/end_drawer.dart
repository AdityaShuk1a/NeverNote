import 'package:flutter/material.dart';

class EndDrawerBar extends StatefulWidget {
  const EndDrawerBar({super.key});

  @override
  State<EndDrawerBar> createState() => _EndDrawerBar();
}

class _EndDrawerBar extends State<EndDrawerBar> {
  final Color textColor = Color.fromARGB(255, 189, 57, 115);
  final Color headerColor = Color.fromARGB(255, 241, 243, 244);

  final TextStyle headerTextStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: Color.fromARGB(255, 241, 243, 244), // Header color
  );

  final TextStyle optionTextStyle = const TextStyle(
    fontSize: 16.0,
    color: Colors.white, // Text color for drawer options
  );
  final TextStyle footerTextStyle = const TextStyle(
    fontSize: 16.0,
    color: Colors.white, // Text color for drawer options
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 109, 151, 181),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: <Widget>[
                ListTile(
                  minVerticalPadding: 40.0,
                  // minTileHeight: 75.0,
                  title: Text(
                    'OPTIONS',
                    style: headerTextStyle,
                  ),
                ),
                Divider(
                  height: 22.0,
                  color: Colors.white,
                  thickness: 2.0,
                ),
                ListTile(
                  trailing: Icon(Icons.delete),
                  iconColor: Colors.white,
                  title: Text(
                    "DELETE",
                    style: optionTextStyle,
                  ),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ProfileCard()),
                    // );
                  },
                ),
                ListTile(
                  trailing: Icon(Icons.edit),
                  iconColor: Colors.white,
                  title: Text(
                    "EDIT",
                    style: optionTextStyle,
                  ),
                  onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => ProfileCard()),
                    //   );
                  },
                ),
                ListTile(
                  trailing: Icon(Icons.add_a_photo),
                  iconColor: Colors.white,
                  title: Text(
                    "ADD PICTURE",
                    style: optionTextStyle,
                  ),
                  onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => ProfileCard()),
                    //   );
                  },
                ),
                ListTile(
                  trailing: Icon(Icons.add_chart),
                  iconColor: Colors.white,
                  title: Text(
                    "ATTACHEMENTS",
                    style: optionTextStyle,
                  ),
                  onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => ProfileCard()),
                    //   );
                  },
                ),
              ],
            ),
          ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'NEVERNOTE',
                      style: footerTextStyle,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
