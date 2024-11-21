import 'package:flutter/material.dart';
import 'package:website/view/wirusik_bot_view.dart';

Route<dynamic> generateRoute(
    RouteSettings settings, GlobalKey<NavigatorState> navigatorKey) {
  Map? queryParameters;
  if (settings.name != null) {
    var uriData = Uri.parse(settings.name!);
    queryParameters = uriData.queryParameters;
  }
  var message = '$queryParameters';
  WidgetsBinding.instance.addPostFrameCallback((_) {
    navigatorKey.currentState?.pushReplacementNamed(
      '/twitch-logged',
      arguments: message,
    );
  });
  return MaterialPageRoute(
    builder: (context) {
      return WirusikBotView(
        query: message,
      );
    },
    settings: settings,
  );
}
