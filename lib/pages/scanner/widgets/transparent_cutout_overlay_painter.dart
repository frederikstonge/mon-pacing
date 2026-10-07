import 'package:material_ui/material_ui.dart';

class TransparentCutoutOverlayPainter extends CustomPainter {
  final Rect scanWindow;
  final double borderRadius;
  final double borderWidth;
  final Color? borderColor;
  final Color? backgroundColor;

  TransparentCutoutOverlayPainter({
    required this.scanWindow,
    this.borderRadius = 16.0, // Soft corner rounding
    this.borderWidth = 3.0, // Default border width
    this.borderColor,
    this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Create a heavily darkened paint strategy for high scanning contrast
    final backgroundPaint = Paint()
      ..color =
          backgroundColor ??
          Colors.black.withValues(alpha: 0.85) // High opacity darker background
      ..style = PaintingStyle.fill;

    // 2. Use EvenOdd rule to cleanly cut the rectangle out of the dark backdrop path
    final pathWithTransparentHole = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height)) // Canvas bounds
      ..addRRect(
        RRect.fromRectAndRadius(scanWindow, Radius.circular(borderRadius)), // Scanner bounds
      )
      ..fillType = PathFillType.evenOdd; // This achieves the transparent window cutout

    canvas.drawPath(pathWithTransparentHole, backgroundPaint);

    // 3. Paint a sharp, clean white border directly around the target hole boundaries
    final borderPaint = Paint()
      ..color = borderColor ?? Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawRRect(RRect.fromRectAndRadius(scanWindow, Radius.circular(borderRadius)), borderPaint);
  }

  @override
  bool shouldRepaint(covariant TransparentCutoutOverlayPainter oldDelegate) {
    // Only repaint if the scan window dimension shifts
    return oldDelegate.scanWindow != scanWindow;
  }
}
