import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Light background color
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple, // Nice app bar color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),

            // Profile Card
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        'https://gcdnb.pbrd.co/images/2VRrJnnNQylQ.jpg?o=1'), // Replace with user image
                  ),
                  SizedBox(height: 10),
                  Text(
                    "John Doe",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "john.doe@example.com",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 20),

                  // Stats Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem("Posts", "34"),
                      _buildStatItem("Followers", "1.2K"),
                      _buildStatItem("Following", "250"),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // Menu Options
            _buildMenuItem(Icons.person, "Edit Profile", Colors.deepPurple, () {}),
            _buildMenuItem(Icons.settings, "Settings", Colors.blue, () {}),
            _buildMenuItem(Icons.notifications, "Notifications", Colors.orange, () {}),
            _buildMenuItem(Icons.help, "Help & Support", Colors.green, () {}),

            // Logout Button
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.logout, color: Colors.white),
                label: Text("Logout", style: TextStyle(fontSize: 16, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for profile stats
  Widget _buildStatItem(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  // Widget for menu items
  Widget _buildMenuItem(IconData icon, String title, Color iconColor, VoidCallback onTap) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
