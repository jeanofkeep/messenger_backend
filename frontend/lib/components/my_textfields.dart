import 'package:flutter/material.dart';

class MyTextfields extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const MyTextfields(
      {Key? key,
      required this.hintText,
      required this.obscureText,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SizedBox(
          height: 50,
          width: 400,
          child: TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                  borderRadius: BorderRadius.circular(20),
                ),
                fillColor: Color.fromARGB(255, 255, 255, 255),
                filled: true,
                hintText: hintText,
                hintStyle: TextStyle(color: Color.fromARGB(255, 44, 43, 43))),
          )),
    );
  }
}
