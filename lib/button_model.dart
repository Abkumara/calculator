import 'package:flutter/material.dart';

class ButtonModel extends StatelessWidget {
  const ButtonModel({
    super.key,
    required this.colors,
    required this.buttonName,
    required this.function,
  });
  final String buttonName;
  final VoidCallback function;
  final Color colors;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: FloatingActionButton(
        onPressed: function,
        backgroundColor: colors,
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 30,
            color:
                (colors == Colors.grey.shade50) ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
