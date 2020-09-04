
class CustomCardShapeBorder extends ShapeBorder {
  final double borderWidth;
  final BorderRadius borderRadius;
  final double profileRadius;

  CustomCardShapeBorder({
    this.borderWidth: 0.0,
    this.borderRadius: BorderRadius.zero,
    this.profileRadius: 149.0,
  }) : assert(borderRadius != null);

  @override
  EdgeInsetsGeometry get dimensions {
    return new EdgeInsets.all(borderWidth);
  }

  @override
  ShapeBorder scale(double t) {
    return new CustomCardShapeBorder(
      borderWidth: borderWidth * (t),
      borderRadius: borderRadius * (t),
    );
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // Path path = new Path();
    // path.moveTo(0.0, 0.0);
    // path.lineTo(400.0, 0.0);
    // path.lineTo(400, 600);
    // path.lineTo(0.0, 600.0);
    // path.lineTo(0.0, 0.0);

    // path.close();
    return null;
  }

  Path customPath() {
    Path path = new Path();
    path.moveTo(20.0, 0.0);
    path.lineTo((400 / 2) - (profileRadius / 2), 0.0);
    path.arcToPoint(
      Offset((400 / 2) + (profileRadius / 2), 0.0),
      radius: Radius.circular(profileRadius / 2),
      rotation: 200.0,
    );
    path.lineTo(380.0, 0.0);
    path.conicTo(400.0, 0.0, 400, 20.0, 1);
    path.lineTo(400, 580);
    path.conicTo(400.0, 600.0, 380, 600, 1);
    path.lineTo(20.0, 600.0);
    path.conicTo(0.0, 600.0, 0.0, 580, 1);
    path.lineTo(0.0, 20.0);
    path.conicTo(0.0, 0.0, 20.0, 0.0, 1);

    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    Path path = new Path();
    path.moveTo(20.0, 0.0);
    path.lineTo((400 / 2) - (profileRadius / 2), 0.0);
    path.arcToPoint(
      Offset((400 / 2) + (profileRadius / 2), 0.0),
      radius: Radius.circular(profileRadius / 2),
      rotation: 200.0,
    );
    path.lineTo(380.0, 0.0);
    path.conicTo(400.0, 0.0, 400, 20.0, 1);
    path.lineTo(400, 580);
    path.conicTo(400.0, 600.0, 380, 600, 1);
    path.lineTo(20.0, 600.0);
    path.conicTo(0.0, 600.0, 0.0, 580, 1);
    path.lineTo(0.0, 20.0);
    path.conicTo(0.0, 0.0, 20.0, 0.0, 1);

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    Paint paint;
    paint = new Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    canvas.drawPath(customPath(), paint);
  }
}
