import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WirusikBotView extends StatefulWidget {
  static const String id = '/twitch-logged';

  const WirusikBotView({super.key});
  @override
  _WirusiBotViewState createState() => _WirusiBotViewState();
}

Future<String> getBearerCode() async {
  final response = await http.post(
    Uri.parse('https://id.twitch.tv/oauth2/token'),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    encoding: Encoding.getByName('utf-8'),
    body: {
      "client_id": "title",
      "client_secret": "",
      "code": "",
      "grant_type": "authorization_code",
      "redirect_uri": ""
    },
  );
  return response.body;
}

class _WirusiBotViewState extends State<WirusikBotView> {
  @override
  Widget build(BuildContext context) {
    final queryParams = ModalRoute.of(context)!.settings.arguments as String?;
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
}
