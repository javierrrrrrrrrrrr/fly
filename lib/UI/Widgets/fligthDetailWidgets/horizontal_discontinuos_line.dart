import 'package:flutter/material.dart';

class HorizontalDiscontinuosLine extends StatelessWidget {
  const HorizontalDiscontinuosLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomPaint(
      painter: _HeaderPaintDiagonal(),
      child: SizedBox(
        //color: Colors.red,
        width: size.width,
        height: size.height * 0.015,
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
      ..strokeWidth = 1;
    final path = Path();

    double paso = 0;
    for (int index = 0; index < 40; index++) {
      paso = paso + 0.025;
      if (index % 2 == 0) {
        path.moveTo(size.width * (paso), 0);
      } else {
        path.lineTo(size.width * (paso), 0);
      }
    }

    // path.lineTo(size.width * 0.025, 0);
    // path.moveTo(size.width * 0.050, 0);
    // path.lineTo(size.width * 0.075, 0);
    // path.moveTo(size.width * 0.100, 0);
    // path.lineTo(size.width * 0.125, 0);
    // path.moveTo(size.width * 0.150, 0);
    // path.lineTo(size.width * 0.175, 0);
    // path.moveTo(size.width * 0.200, 0);
    // path.lineTo(size.width * 0.225, 0);
    // path.moveTo(size.width * 0.250, 0);
    // path.lineTo(size.width * 0.2750, 0);
    // path.moveTo(size.width * 0.300, 0);
    // //
    // path.lineTo(size.width * 0.325, 0);
    // path.moveTo(size.width * 0.350, 0);
    // path.lineTo(size.width * 0.375, 0);
    // path.moveTo(size.width * 0.400, 0);
    // path.lineTo(size.width * 0.425, 0);
    // path.moveTo(size.width * 0.450, 0);
    // path.lineTo(size.width * 0.475, 0);
    // path.moveTo(size.width * 0.500, 0);
    // path.lineTo(size.width * 0.525, 0);
    // path.moveTo(size.width * 0.550, 0);
    // path.lineTo(size.width * 0.575, 0);
    // path.moveTo(size.width * 0.600, 0);

    // //
    // path.lineTo(size.width * 0.625, 0);
    // path.moveTo(size.width * 0.650, 0);
    // path.lineTo(size.width * 0.675, 0);
    // path.moveTo(size.width * 0.700, 0);
    // path.lineTo(size.width * 0.725, 0);
    // path.moveTo(size.width * 0.750, 0);
    // path.lineTo(size.width * 0.775, 0);
    // path.moveTo(size.width * 0.800, 0);
    // path.lineTo(size.width * 0.825, 0);
    // path.moveTo(size.width * 0.850, 0);
    // path.lineTo(size.width * 0.875, 0);
    // path.moveTo(size.width * 0.900, 0);

    // path.lineTo(size.width * 0.925, 0);
    // path.moveTo(size.width * 0.950, 0);
    // path.lineTo(size.width * 0.975, 0);
    // path.moveTo(size.width * 0.100, 0);

    // path.lineTo(size.width * 1.1, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
