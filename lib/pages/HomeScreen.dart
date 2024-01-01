import 'package:dbsedcampus/pages/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'CoursePage.dart';
import 'AboutPage.dart';
import 'EventsPage.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DBSECampus'),
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/logdbs.jpg'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Implement the logic for the profile icon tap
              // For simplicity, I'm just printing a message to the console
              print('Tapped on profile icon');
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        children: [
          _buildMenuItem(context, 'Courses', Icons.library_books, Colors.blue, CoursePage()),
_buildMenuItem(context, 'About', Icons.info, Colors.green, AboutPage()), // Make sure to replace AboutPage with your actual about page class
_buildMenuItem(context, 'Location', Icons.location_on, Colors.orange, FlutterMapLocation()),
_buildMenuItem(context, 'Events', Icons.event, Colors.purple, EventsPage()), // Make sure to replace EventsPage with your actual events page class

        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, Color color, Widget page) {
  return InkWell(
    onTap: () {
      // Trigger haptic feedback
      HapticFeedback.mediumImpact();

      // Navigate to the specified page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    },
    child: Card(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
            color: Colors.white,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

}
