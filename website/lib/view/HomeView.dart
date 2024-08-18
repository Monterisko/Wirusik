import 'package:flutter/material.dart';
import 'package:website/view/TwitchBot.dart';

class HomeView extends StatefulWidget {
  static const String id = 'home';

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
          menuButton('Twitch Bot'),
          menuButton('Discord Bot'),
          menuButton('Contact')
        ],
      ),
    );
  }

  SizedBox menuButton(String text) {
    return SizedBox(
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TwitchBot()));
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
