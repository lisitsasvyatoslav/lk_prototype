import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';

class PremiumStatusCard extends StatelessWidget {
  final double progress;
  final VoidCallback? onTap;

  const PremiumStatusCard({
    super.key,
    this.progress = 0.25,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
             Stack(
               children: [
                 Container(
                   width: 40,
                   height: 40,
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     border: Border.all(
                       color: Colors.grey[800]!,
                       width: 4,
                     ),
                   ),
                   child: const Icon(
                     Icons.diamond,
                     color: Colors.white,
                     size: 20,
                   ),
                 ),
                 SizedBox(
                   width: 40,
                   height: 40,
                   child: CustomPaint(
                     painter: ProgressPainter(
                       progress: progress,
                       strokeWidth: 4,
                       color: const Color(0xFFF9E595),
                     ),
                   ),
                 ),
               ],
             ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                'Статус "Премиум"',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${(progress * 100).toInt()}%',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey[400],
                  size: 24,
                ),
              ],
            ),
          ],
        ),
      ),
         );
   }
 }

class ProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color color;

  ProgressPainter({
    required this.progress,
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round 
      ..style = PaintingStyle.stroke;
    
    final startAngle = -90 * (3.14159 / 180); 
    final sweepAngle = progress * 2 * 3.14159;
    
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
