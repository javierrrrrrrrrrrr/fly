import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    Key? key,
    required this.avatarRadius,
  }) : super(key: key);

  final double avatarRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey,
          )
        ],
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: avatarRadius,
      ),
    );
  }
}
