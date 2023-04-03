import 'package:flutter/material.dart';

///A container with a dropping box shadow
class BoxShadowStyle extends StatelessWidget {
  const BoxShadowStyle({Key? key, required this.ChildWidget}) : super(key: key);
  final Widget ChildWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChildWidget,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
    );
  }
}
