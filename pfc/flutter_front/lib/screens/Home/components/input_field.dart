import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/Campus_library/components/one_page_details.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField({
    Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
              height: 52,
              margin: EdgeInsets.only(top: 8.0),
              padding: EdgeInsets.only(left: 14.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    readOnly: widget == null ? false : true,
                    autofocus: false,
                    cursorColor: Colors.grey,
                    controller: controller,
                    style: subTitleStyle,
                    decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: hintStyle,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                          width: 0,
                        )),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                          width: 0,
                        ))),
                  )),
                  widget == null ? Container() : Container(child: widget),
                ],
              ))
        ],
      ),
    );
  }
}

TextStyle get titleStyle {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xFF1f2f49),
  );
}

TextStyle get hintStyle {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );
}

TextStyle get subTitleStyle {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
}
