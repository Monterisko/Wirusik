import 'package:flutter/material.dart';

class TwitchBot extends StatefulWidget {
  static const String id = 'TwitchBot';

  const TwitchBot({super.key});

  @override
  _TwitchBotState createState() => _TwitchBotState();
}

class _TwitchBotState extends State<TwitchBot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Color.),
          child: Text('Connect to Twitch'),
        ),
      ),
    );
  }
}
