import 'package:flutter/material.dart';
import 'package:synqpass/pages/pass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PassScreen(event: const _DummyEvent(), userId: 'test-user-id'),
    );
  }
}

class _DummyEvent {
  final String id = 'test-event-id';
  final String name = 'Dummy Event';

  const _DummyEvent();
}
