import 'package:flutter/material.dart';
import 'package:website/view/home_view.dart';
import 'package:website/view/twitch_bot_view.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:website/view/wirusik_bot_view.dart';

import 'router/router_query.dart';

void main() async {
  usePathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wirusik Website',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.id,
      navigatorKey: navigatorKey,
      routes: {
        HomeView.id: (context) => const HomeView(),
        TwitchBot.id: (context) => const TwitchBot(),
        WirusikBotView.id: (context) => const WirusikBotView(query: "")
      },
      onGenerateRoute: (settings) => generateRoute(settings, navigatorKey),
    );
  }
}
