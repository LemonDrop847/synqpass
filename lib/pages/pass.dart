import 'package:flutter/material.dart';
import '../widgets/pass_card.dart';

class PassScreen extends StatelessWidget {
  final dynamic event;
  final String userId;
  final String level;
  const PassScreen({
    super.key,
    required this.event,
    required this.userId,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PassCard(
        username: 'John Doe',
        level: level,
        userId: userId,
        appendingString: event.id,
        clubName: 'Synqpass',
        eventDetails: event.name,
        logoUrl:
            'https://cdn.dribbble.com/userupload/34646523/file/original-5911b8175427de4eceb8fe8ffbed71db.jpg?resize=2048x1536&vertical=center',
      ),
    );
  }
}
