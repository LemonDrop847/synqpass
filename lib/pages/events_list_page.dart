import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:synqpass/models/event.dart';
import 'package:synqpass/pages/event_details_page.dart';

class EventsListPage extends StatelessWidget {
  final List<Event> events = const [
    Event(
      id: '1',
      name: 'Flutter Forward',
      description: 'The future of Flutter.',
    ),
    Event(
      id: '2',
      name: 'Google I/O',
      description: 'Annual developer conference.',
    ),
    Event(
      id: '3',
      name: 'Dart Conf',
      description: 'All about the Dart language.',
    ),
  ];

  const EventsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    const username = 'John Doe';
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF232526), Color(0xFF414345)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 120.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Hi! $username',
                  style: GoogleFonts.orbitron(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Choose an event below.',
                  style: GoogleFonts.robotoCondensed(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final event = events[index];
                return Card(
                  color: Colors.white.withOpacity(0.1),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: ListTile(
                    title: Text(
                      event.name,
                      style: GoogleFonts.oswald(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      event.description,
                      style: GoogleFonts.robotoCondensed(color: Colors.white70),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailsPage(event: event),
                        ),
                      );
                    },
                  ),
                );
              }, childCount: events.length),
            ),
          ],
        ),
      ),
    );
  }
}
