import 'package:flutter/material.dart';
import 'package:habito_2/domain/entities/habito/habito.dart';

class CustomHabitStatus extends StatefulWidget {
  const CustomHabitStatus({
    super.key,
    required this.habito,
    required this.value,
    this.focusDate,
    this.onChanged,
    this.activeColor,
    this.checkColor,
  });

  final DateTime? focusDate;
  final Habito habito;
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Color? activeColor;
  final Color? checkColor;

  @override
  State<CustomHabitStatus> createState() => _CustomHabitStatusState();
}

class _CustomHabitStatusState extends State<CustomHabitStatus> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onChanged?.call(!widget.value),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: widget.habito.frequency2(widget.focusDate!) ==
                  widget.habito.dailyRecurrence
              ? widget.activeColor
              : widget.activeColor?.withValues(alpha: .08),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Builder(builder: (context) {
          if (widget.habito.dailyRecurrence > 1) {
            if (widget.habito.frequency2(widget.focusDate!) ==
                widget.habito.dailyRecurrence) {
              return Center(
                child: Icon(
                  Icons.check,
                  size: 18,
                  color: widget.checkColor,
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: CustomPaint(
                painter: CirclePainter(
                  widget.habito.frequency2(widget.focusDate!) /
                      widget.habito.dailyRecurrence,
                  widget.activeColor ?? Colors.white,
                ),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: widget.activeColor,
                      size: 18,
                    ),
                  ),
                ),
              ),
            );
          }

          return Center(
              child: Icon(
            Icons.check,
            size: 18,
            color: !widget.value ? widget.activeColor : widget.checkColor,
          ));
        }),
      ),
    );
  }
}

// class DynamicButton extends StatefulWidget {
//   @override
//   _DynamicButtonState createState() => _DynamicButtonState();
// }

// class _DynamicButtonState extends State<DynamicButton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..repeat();

//     _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             AnimatedBuilder(
//               animation: _animation,
//               builder: (context, child) {
//                 return CustomPaint(
//                   painter: CirclePainter(_animation.value),
//                   size: const Size(60, 60),
//                 );
//               },
//             ),
//             Container(
//               width: 50,
//               height: 50,
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Center(
//                 child: Icon(Icons.add, color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CirclePainter extends CustomPainter {
  final double progress;
  final Color activeColor;

  CirclePainter(
    this.progress,
    this.activeColor,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = activeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final startAngle = -90.0 * (3.14 / 180);
    final sweepAngle = 2 * 3.14 * progress;

    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
