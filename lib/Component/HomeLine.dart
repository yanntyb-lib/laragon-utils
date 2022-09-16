import 'package:flutter/material.dart';

class HomeLinkLine extends StatelessWidget{
  const HomeLinkLine({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

}