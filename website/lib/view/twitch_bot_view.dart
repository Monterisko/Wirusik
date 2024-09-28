import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TwitchBot extends StatefulWidget {
  static const String id = '/twitch';

  const TwitchBot({super.key});

  @override
  _TwitchBotState createState() => _TwitchBotState();
}

Future<void> _launchUrl(Uri url, bool isNewTab) async {
  if (!await launchUrl(url, webOnlyWindowName: isNewTab ? '_blank' : '_self')) {
    throw Exception('Could not launch $url');
  }
}

class _TwitchBotState extends State<TwitchBot> {
  final String clientId = dotenv.get('TWITCH_CLIENT_ID');
  Uri uri = Uri.base;

  @override
  void initState() {
    String query = Uri.base.query;
    print('query:$query');
    if (query != "") {
      Navigator.pushNamed(context, '/twitch-logged');
    } else {
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            uri = Uri.parse(
                "https://id.twitch.tv/oauth2/authorize?response_type=code&client_id=$clientId&redirect_uri=http://localhost:3000/twitch");
            _launchUrl(uri, false);
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
