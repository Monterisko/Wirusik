import 'dart:convert';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class WirusikBotView extends StatefulWidget {
  static const String id = '/twitch-logged';
  final String query;

  const WirusikBotView({required this.query, super.key});
  @override
  _WirusiBotViewState createState() => _WirusiBotViewState();
}

Future<String> getBearerCode(String code) async {
  final String clientId = dotenv.get('TWITCH_CLIENT_ID');
  final String secret = dotenv.get('TWITCH_SECRET');
  final String redirectUri = dotenv.get('TWITCH_REDIRECT_URI');
  final response = await http.post(
    Uri.parse('https://id.twitch.tv/oauth2/token'),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    encoding: Encoding.getByName('utf-8'),
    body: {
      "client_id": clientId,
      "client_secret": secret,
      "code": code,
      "grant_type": "authorization_code",
      "redirect_uri": redirectUri
    },
  );
  print(response.body);
  return response.body;
}

void saveToken(String token) {
  html.window.localStorage['token'] = token;
}

class _WirusiBotViewState extends State<WirusikBotView> {
  @override
  void initState() {
    if (widget.query != "") {
      RegExp regExp = RegExp(r'code:\s*([^,]+)');
      Match? match = regExp.firstMatch(widget.query);
      String? codeValue = match?.group(1)?.trim();
      getBearerCode(codeValue!).then((String response_body) {
        saveToken(response_body);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? queryParams = ModalRoute.of(context)!.settings.arguments as String?;
    if (queryParams != null) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "ZALOGOWANY!",
                style: TextStyle(color: Colors.black),
              ),
            ],
          )
        ],
      );
    }
    return Column();
  }
}
