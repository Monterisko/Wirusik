import 'package:flutter/material.dart';
import 'package:website/view/home_view.dart';
import 'package:website/view/twitch_bot_view.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:website/view/wirusik_bot_view.dart';

void main() async {
  usePathUrlStrategy();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Wirusik Website',
        debugShowCheckedModeBanner: false,
        initialRoute: HomeView.id,
        routes: {
          HomeView.id: (context) => const HomeView(),
          TwitchBot.id: (context) => const TwitchBot(),
          WirusikBotView.id: (context) => const WirusikBotView()
        });
  }
}
