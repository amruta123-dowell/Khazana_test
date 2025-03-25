import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String) onChanged;
  const CustomTextField({
    super.key,
    required this.textEditingController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: "Gilroy",
      ),
      keyboardType: TextInputType.phone,
      cursorColor: Colors.blue,
      controller: textEditingController,

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        fillColor: Color(0XFF262626),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF5D5D5D)),
        ),
        focusColor: Colors.blue,
        filled: true,
        errorBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        prefix: Text(
          " + 91 ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: "Gilroy",
          ),
        ),
      ),
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
