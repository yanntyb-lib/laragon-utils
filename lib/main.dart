import 'package:flutter/material.dart';
import 'package:laragon_utils/Component/NoTransitionRoute.dart';
import 'package:laragon_utils/Page/SitesEnable.dart';

import 'Page/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Map<String,String> routes = {
    "/site_enable": "Site enable",
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laragon utils',
      theme: ThemeData(
          backgroundColor: Colors.black,
          pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.windows: NoTransitionsBuilder(),
              }
          )

      ),
      initialRoute: "/",
      routes: {
        "/": (routeContext) => HomePage(title: 'Laragon utils', routes: routes, appContext: context),
        "/site_enable": (routeContext) => const SitesEnable(title: "Site enable")
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

