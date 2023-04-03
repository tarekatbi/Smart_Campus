import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: iconsColor);
    final styleHint = TextStyle(color: iconsColor);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Scaffold(
      body: Container(
        height: 42,
        margin: const EdgeInsets.fromLTRB(35, 35, 35, 35),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(color: Colors.black26),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            icon: Icon(Icons.search, color: style.color),
            suffixIcon: widget.text.isNotEmpty
                ? GestureDetector(
                    child: Icon(Icons.close, color: style.color),
                    onTap: () {
                      controller.clear();
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  )
                : null,
            hintText: widget.hintText,
            hintStyle: style,
            border: InputBorder.none,
          ),
          style: style,
        ),
      ),
    );
  }
}
