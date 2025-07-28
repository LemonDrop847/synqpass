import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:synqpass/models/event.dart';
import 'package:synqpass/pages/pass.dart';

class EventDetailsPage extends StatefulWidget {
  final Event event;

  const EventDetailsPage({super.key, required this.event});

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  String _selectedTier = 'Silver';
  final List<String> _tiers = ['Silver', 'Gold', 'Platinum'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF232526), Color(0xFF414345)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            widget.event.name,
            style: GoogleFonts.orbitron(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ), // To offset content from under appbar
              Text(
                widget.event.description,
                style: GoogleFonts.robotoCondensed(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedTier,
                items:
                    _tiers.map((String tier) {
                      return DropdownMenuItem<String>(
                        value: tier,
                        child: Text(
                          tier,
                          style: GoogleFonts.robotoCondensed(fontSize: 18),
                        ),
                      );
                    }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedTier = newValue!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Select Pass Tier for the Event',
                  labelStyle: GoogleFonts.robotoCondensed(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                dropdownColor: const Color(0xFF414345),
                style: GoogleFonts.robotoCondensed(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF232526),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    textStyle: GoogleFonts.orbitron(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => PassScreen(
                              event: widget.event,
                              userId: 'test-user-id',
                              level: _selectedTier,
                            ),
                      ),
                    );
                  },
                  child: const Text('Pay to Confirm'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
