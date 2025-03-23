import 'package:flutter/material.dart';



class ProgramViewMobile extends StatefulWidget {
  @override
  State<ProgramViewMobile> createState() => _ProgramViewMobileState();
}

class _ProgramViewMobileState extends State<ProgramViewMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_note, // Calendar-like icon
              size: 80,
              color: Colors.grey,
            ),
            SizedBox(height: 10),
            Text(
              "Coming soon",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
