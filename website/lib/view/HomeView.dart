import 'package:flutter/material.dart';
import 'package:website/view/TwitchBot.dart';

class HomeView extends StatefulWidget {
  static const String id = '/';

  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          menuButton('Twitch Bot', '/twitch'),
          menuButton('Discord Bot'),
          menuButton('Contact')
        ],
      ),
    );
  }

  SizedBox menuButton(String text, [String? route]) {
    return SizedBox(
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, route!);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: const BeveledRectangleBorder(
                  side: BorderSide(color: Colors.white))),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
