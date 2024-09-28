import 'package:flutter/material.dart';

class WirusikBotView extends StatefulWidget {
  static const String id = '/twitch-logged';
  const WirusikBotView({super.key});
  @override
  _WirusiBotViewState createState() => _WirusiBotViewState();
}

class _WirusiBotViewState extends State<WirusikBotView> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Text("ZALOGOWANY")],
    );
  }
}
