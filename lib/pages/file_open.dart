import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileManagerExample extends StatelessWidget {
  const FileManagerExample({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Manager Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            openFileManager();
          },
          child: const Text('Open File Manager'),
        ),
      ),
    );
  }
}