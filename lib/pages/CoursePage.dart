import 'package:flutter/material.dart';
import 'CourseDetailsPage.dart';

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> courses = [
      {
        'name': 'WEB AND MOBILE TECHNOLOGIES',
        'code': 'B9IS124_2324_TMD1S',
        'category': 'Course category',
        'zoomMeetingUrl':
            'https://dbs.zoom.us/rec/play/kSKCqfw-ABCVy_WwZ5ibzu0rxewy9OesmRX6_t9_03n3XA8Zfz0wHxXxzyFsUFIlg8gxclEsSRag1Nz2.TxChLi1uHHPlYa5Y',
      },
      {
        'name': 'ADVANCED DATABASES',
        'code': 'B9IS100_2324_TMD1S',
        'category': 'Course category',
        'zoomMeetingUrl':
            'https://dbs.zoom.us/rec/play/kSKCqfw-ABCVy_WwZ5ibzu0rxewy9OesmRX6_t9_03n3XA8Zfz0wHxXxzyFsUFIlg8gxclEsSRag1Nz2.TxChLi1uHHPlYa5Y',
      },
      {
        'name': 'PROGRAMMING FOR INFORMATION SYSTEMS',
        'code': 'B9IS123_2324_TMD1S',
        'category': 'Course category',
        'zoomMeetingUrl':
            'https://dbs.zoom.us/rec/play/kSKCqfw-ABCVy_WwZ5ibzu0rxewy9OesmRX6_t9_03n3XA8Zfz0wHxXxzyFsUFIlg8gxclEsSRag1Nz2.TxChLi1uHHPlYa5Y',
      },
      {
        'name': 'SOFTWARE ENGINEERING',
        'code': 'B9IS119_2324_TMD1S',
        'category': 'Course category',
        'zoomMeetingUrl':
            'https://dbs.zoom.us/rec/play/kSKCqfw-ABCVy_WwZ5ibzu0rxewy9OesmRX6_t9_03n3XA8Zfz0wHxXxzyFsUFIlg8gxclEsSRag1Nz2.TxChLi1uHHPlYa5Y',
      },
      {
        'name': 'NETWORKS AND SYSTEMS ADMINISTRATION',
        'code': 'B9IS121_2324_TMD1S',
        'category': 'Course category',
        'zoomMeetingUrl':
            'https://dbs.zoom.us/rec/play/kSKCqfw-ABCVy_WwZ5ibzu0rxewy9OesmRX6_t9_03n3XA8Zfz0wHxXxzyFsUFIlg8gxclEsSRag1Nz2.TxChLi1uHHPlYa5Y',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailsPage(
                    courseName: courses[index]['name'] ?? '',
                    courseCode: courses[index]['code'] ?? '',
                    zoomMeetingUrl: courses[index]['zoomMeetingUrl'] ?? '',
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(courses[index]['name'] ?? ''),
                subtitle: Text('Code: ${courses[index]['code'] ?? ''}'),
              ),
            ),
          );
        },
      ),
    );
  }
}

