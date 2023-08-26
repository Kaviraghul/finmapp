import 'package:flutter/material.dart';

class UserResponseScreen extends StatelessWidget {
  final List<Map<String, String>> userResponses;

  UserResponseScreen({required this.userResponses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Responses'),
      ),
      body: ListView.builder(
        itemCount: userResponses.length,
        itemBuilder: (context, index) {
          final response = userResponses[index];
          final List<Widget> responseWidgets = [];
          response.forEach((key, value) {
            responseWidgets.add(
              ListTile(
                title: Text('$key :'),
                subtitle: Text('Answer : $value'),
              ),
            );
          });

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: responseWidgets,
          );
        },
      ),
    );
  }
}
