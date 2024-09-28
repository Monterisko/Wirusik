import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TwitchBot extends StatefulWidget {
  static const String id = '/twitch';

  const TwitchBot({super.key});

  @override
  _TwitchBotState createState() => _TwitchBotState();
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

class _TwitchBotState extends State<TwitchBot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _launchUrl(Uri.parse("https://google.com"));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff9147ff)),
          child: const Text(
            'Connect to Twitch',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
