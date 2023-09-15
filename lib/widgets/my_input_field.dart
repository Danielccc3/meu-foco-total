import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  final bool isPasswordField;
  final String placeholder;
  final String label;
  final Function(String) onChange;
  const MyInputField({
    super.key, required this.placeholder, required this.label, this.isPasswordField = false, required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        boxShadow: [BoxShadow(blurRadius: 32, color: Colors.black12),]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          TextField(
            obscureText: isPasswordField,
            onChanged: (value) {
              this.onChange(value);
            },
            decoration: InputDecoration(
              hintText: placeholder,
              border: InputBorder.none,
            ),
          )
        ],
      ),
    );
  }
}