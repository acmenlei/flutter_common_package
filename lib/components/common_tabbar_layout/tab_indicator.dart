import 'package:flutter/material.dart';
import 'package:codefather_app/utils/index.dart';

/// 自定义 TabBar 选中的效果
class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter();
  }
}

class _CustomPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint();
    paint.color = getPrimaryColor();
    paint.style = PaintingStyle.fill;

    const double indicatorWidth = 20;
    const double indicatorHeight = 4;
    const double borderRadius = 4; // Adjust the radius for rounded corners
    final double dx = (configuration.size!.width - indicatorWidth) / 2;
    final double dy = configuration.size!.height - indicatorHeight * 3;

    final RRect rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
          offset.dx + dx, offset.dy + dy, indicatorWidth, indicatorHeight),
      const Radius.circular(borderRadius),
    );

    canvas.drawRRect(rrect, paint);
  }
}
