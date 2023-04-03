import 'package:flutter/material.dart';

class InLoader extends StatelessWidget {
  const InLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [CircularProgressIndicator(), Text("Chargement ... ")],
    );
  }
}
