import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Link extends StatefulWidget{

  Link({
    super.key,
    required this.icon,
    required this.path,
    required this.color,
    required this.tooltip,
    this.rounded = false,
  });

  final String path;
  final IconData? icon;
  final Color color;
  final String tooltip;
  final bool rounded;

  @override
  State<StatefulWidget> createState() => _LinkSate();
}

class _LinkSate extends State<Link> with SingleTickerProviderStateMixin{

  late double offset = 0;
  final double maxOffset = 10;
  late bool pushed = false;
  late double size;
  late bool showTooltip = false;

  final Duration animationDuration = const Duration(milliseconds: 100);

  void setSize(buildContext){
    setState(() {
      size = MediaQuery.of(buildContext).size.height / 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    setSize(context);
    return GestureDetector(
      onTapDown: (context) {
        HapticFeedback.lightImpact();
        setState(() {
          offset = maxOffset;
          pushed = true;
        });
      },
      onTapUp: (gestureContext) {
        setState(() {
          offset = 0;
          pushed = false;
          showTooltip = false;
        });
        Navigator.pushNamed(context, widget.path);
      },
      onLongPress: (){
        setState(() {
          showTooltip = true;
        });
      },
      onLongPressEnd: (gestureContext){
        setState(() {
          offset = 0;
          pushed = false;
          showTooltip = false;
        });
        Navigator.pushNamed(context, widget.path);
      },
      child: AnimatedContainer(
          margin: const EdgeInsets.only(
            top: 60,
          ),
          duration: animationDuration,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(pushed ? 10 : 0),
            boxShadow: [
              BoxShadow(
                  color: widget.color.withOpacity(0.3),
                  offset: Offset(maxOffset, maxOffset),
                  blurRadius: 2,
              ),
              BoxShadow(
                color: widget.color,
                spreadRadius: 0.01,
                offset: Offset(offset, offset),
              ),
            ],
          ),
          curve: Curves.easeIn,
        child: SizedBox(
            width: size,
            height: size,
            child: Stack(
              children: [
                AnimatedPositioned(
                    left: offset + (size / 2.5),
                    top: offset + (size / 2.5),
                    duration: animationDuration,
                    child: Text(widget.tooltip),
                  ),
                // Text(showTooltip ? widget.tooltip : ""),
              ],
            )
        ),
      ),
    );
  }
}