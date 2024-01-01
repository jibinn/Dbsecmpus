import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image widget for your college logo
            
            // Text widget for the first paragraph
            Text(
              'WELCOME TO DUBLIN BUSINESS SCHOOL\n\n'
              'Dublin Business School (DBS) specialises in the provision of career-focused education.'
              'We have evolved over the years, expanding our offerings to meet the demands of various sectors. '
              'Our extensive suite of programmes at DBS now includes subjects in the areas of business, law, finance, '
              'computing, media, arts, psychology and social science.',
              style: TextStyle(fontSize: 16),
            ),
            // SizedBox widget for spacing
            SizedBox(height: 32),
            // Image widget for the campus photo
            Image.asset('assets/images/dbsimg1.jpg'),
            SizedBox(height: 16),
            // Text widget for the second paragraph
            Text(
              'Whether starting off or returning to college, we at DBS understand the importance and significance of this momentous move.'
              'This is why we have a designated support infrastructure of departments and teams to help support students in every step of their application and education at DBS.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
