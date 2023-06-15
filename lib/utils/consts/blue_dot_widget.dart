import 'package:flutter/material.dart';

class BlueDotWidget extends StatelessWidget {
  const BlueDotWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.blue.shade400),
    );
  }
}
