import 'package:flutter/material.dart';

class VerticalDiscontinuosLine extends StatelessWidget {
  const VerticalDiscontinuosLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomPaint(
      painter: _HeaderPaintDiagonal(),
      child: SizedBox(
        width: size.width * 0.001,
        height: size.height * 0.10,
        //color: Colors.red,
      ),
    );
  }
}

class _HeaderPaintDiagonal extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..style =
          PaintingStyle.stroke //una vez dibujado cambiar por .fill //streoke
      ..strokeWidth = 3;
    final path = Path();

    path.lineTo(0, size.height * 0.1);
    path.moveTo(0, size.height * 0.2);
    path.lineTo(0, size.height * 0.3);
    path.moveTo(0, size.height * 0.4);
    path.lineTo(0, size.height * 0.5);
    path.moveTo(0, size.height * 0.6);
    path.lineTo(0, size.height * 0.7);
    path.moveTo(0, size.height * 0.8);
    path.lineTo(0, size.height * 0.9);
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 1.1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
