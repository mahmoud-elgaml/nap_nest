import 'package:flutter/material.dart';

import 'edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isNotificationEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 10, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Mohamed Ali',
              style: TextStyle(fontSize: 29.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Mohamedali@gmail.com',
              style: TextStyle(
                color: Color(0xFF414F62),
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            Divider(thickness: 1, color: Colors.grey[300]),
            SizedBox(height: 30),
            Container(
              height: 148,
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 4.0),
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      leading: Image.asset('assets/images/Frame 107.png'),
                      title: Text(
                        'Personal Information',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        print('تم الضغط على Personal Information');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(),
                          ),
                        );
                      },
                    ),
                    Divider(height: 1.0, indent: 16, endIndent: 30),
                    ListTile(
                      leading: Image.asset('assets/images/Frame 107-2.png'),
                      title: Text(
                        'My Progress',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        print('تم الضغط على My Progress');
                      },
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 25.0),
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: <Widget>[
                    Image.asset("assets/images/Frame 107-3.png"),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Notification',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Switch(
                      value: _isNotificationEnabled,activeColor: Color(0xFF74B2E7),
                      onChanged: (bool newValue) async {
                       setState(() {
                         _isNotificationEnabled = newValue;
                       });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
