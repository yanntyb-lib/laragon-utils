import 'dart:math';

import 'package:flutter/material.dart';
import 'package:laragon_utils/Component/HomeLine.dart';
import 'package:laragon_utils/Component/Link.dart';

class HomePage extends StatefulWidget {

  const HomePage({
    super.key,
    required this.title,
    required this.routes,
    required this.appContext
  });

  final String title;
  final Map<String,String> routes;
  final BuildContext appContext;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> routes = [];

  int defineLinkRow(){
    return sqrt(routes.length).floor();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox.expand(
        child:  Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.spaceAround,
          spacing: 40,
          children: [
            for(var name in widget.routes.keys) Link(tooltip: widget.routes[name].toString(),path: name, icon: null, color: Colors.greenAccent),
          ],
        ),
      ),
    );
  }
}
