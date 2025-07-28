import 'package:flutter/material.dart';
import '../widgets/pass_card.dart';

class PassScreen extends StatelessWidget {
  final dynamic event;
  final String userId;
  const PassScreen({super.key, required this.event, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PassCard(
        username: 'Alex Ray', // Replace with actual username
        level: 'gold',
        userId: userId,
        appendingString: event.id,
        clubName: 'Synqpass',
        eventDetails: event.name,
        logoUrl:
            'https://thumbs.dreamstime.com/b/eagle-head-simple-logo-design-template-359138889.jpg',
      ),
    );
  }
}
