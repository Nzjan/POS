import 'package:flutter/material.dart';


class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // Top border (dashed)
    _drawDashedLine(canvas, paint, Offset(0, 0), Offset(size.width, 0));

    // Bottom border (dashed)
    _drawDashedLine(canvas, paint, Offset(0, size.height), Offset(size.width, size.height));
  }

  // Helper method to draw a dashed line horizontally
  void _drawDashedLine(Canvas canvas, Paint paint, Offset start, Offset end) {
    const dashWidth = 5.0;  // Length of each dash
    const dashSpace = 3.0;  // Space between each dash

    double distance = (end - start).distance; // Total length of the line
    double dashCount = distance / (dashWidth + dashSpace); // Number of dashes we need to draw

    for (double i = 0; i < dashCount; i++) {
      double startX = start.dx + (i * (dashWidth + dashSpace));
      double startY = start.dy;

      double endX = startX + dashWidth; // Each dash has a width of `dashWidth`
      double endY = startY;

      if (endX > end.dx) endX = end.dx;  // Ensure the dash does not go beyond the end of the line

      // Draw the dash
      canvas.drawLine(
        Offset(startX, startY),
        Offset(endX, endY),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint since the dashed border is static
  }
}
