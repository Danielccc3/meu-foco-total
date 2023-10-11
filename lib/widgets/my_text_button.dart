import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String label;
  final void Function() onTap;
  const MyTextButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            )),
        child: Center(
            child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        )),
      ),
    );
  }
}
