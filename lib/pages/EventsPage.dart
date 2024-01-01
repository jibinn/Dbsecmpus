import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildEventCard(
            eventName: 'Christmas Event',
            eventImage: 'assets/images/nw.jpg',
            context: context,
          ),
          _buildEventCard(
            eventName: 'Newyear Event',
            eventImage: 'assets/images/tm.jpg',
            context: context,
          ),
          // Add more event cards as needed
        ],
      ),
    );
  }

  Widget _buildEventCard({
    required String eventName,
    required String eventImage,
    required BuildContext context,
  }) {
    return Card(
      elevation: 5.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            eventImage,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              eventName,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _showRegistrationForm(context, eventName);
            },
            child: Text('Register'),
          ),
        ],
      ),
    );
  }

  // Function to show the registration form
  void _showRegistrationForm(BuildContext context, String eventName) {
    String email = '';
    String admissionNumber = '';
    String name = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registration for $eventName'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Admission Number'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  admissionNumber = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_validateFields(email, admissionNumber, name)) {
                    // Add your registration logic here
                    // For simplicity, we just close the dialog in this example
                    Navigator.of(context).pop();
                    _showSuccessMessage(context);
                  } else {
                    _showValidationError(context);
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to validate email, admission number, and name
  bool _validateFields(String email, String admissionNumber, String name) {
    return _validateEmail(email) &&
        _validateAdmissionNumber(admissionNumber) &&
        name.isNotEmpty;
  }

  // Function to validate email
  bool _validateEmail(String email) {
    // You can use a regular expression for more sophisticated email validation
    return email.isNotEmpty && email.contains('@');
  }

  // Function to validate admission number (must be a digit)
  bool _validateAdmissionNumber(String admissionNumber) {
    return admissionNumber.isNotEmpty && int.tryParse(admissionNumber) != null;
  }

  // Function to show validation error message
  void _showValidationError(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Validation Error'),
          content: Text('Please enter valid values for all fields.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Function to show the success message
  void _showSuccessMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Registration Successful!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
