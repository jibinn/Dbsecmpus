import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';

class CourseDetailsPage extends StatelessWidget {
  final String courseName;
  final String courseCode;
  final String zoomMeetingUrl;

  CourseDetailsPage({
    required this.courseName,
    required this.courseCode,
    required this.zoomMeetingUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Course Code: $courseCode'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _launchZoomMeeting(zoomMeetingUrl);
              },
              child: Text('Join Live Class'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await openFileManager();
              },
              child: Text('Submit Assignment'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchZoomMeeting(String url) async {
    try {
      await launch(url);
    } catch (e) {
      print('Error launching Zoom meeting: $e');
    }
  }

  Future<void> openFileManager() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Do something with the picked file(s)
      print('Picked file(s): ${result.files}');
    } else {
      // User canceled the file picking
      print('File picking canceled.');
    }
  }

}