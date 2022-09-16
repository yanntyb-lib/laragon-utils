import 'package:flutter/material.dart';

class SitesEnable extends StatefulWidget {
  const SitesEnable({super.key, required this.title});
  final String title;

  @override
  State<SitesEnable> createState() => _SitesEnableState();
}

class _SitesEnableState extends State<SitesEnable> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("Under construction")
      ),
    );
  }
}
