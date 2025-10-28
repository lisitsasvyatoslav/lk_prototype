import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/appcolors.dart';

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
          color: AppColors.bgBaseDefault,
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
                       color: AppColors.iconBaseTertiary,
                       width: 4,
                     ),
                   ),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Center(
                      child: Transform.scale(
                        scale: 1, 
                        child: SvgPicture.asset(
                          'assets/icons/diamond.svg',
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                            AppColors.iconBrandDefault,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  )
                 ),
                 SizedBox(
                   width: 40,
                   height: 40,
                   child: CustomPaint(
                     painter: ProgressPainter(
                       progress: progress,
                       strokeWidth: 4,
                       color: AppColors.iconBrandDefault,
                     ),
                   ),
                 ),
               ],
             ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                'Статус "Премиум"',
                style: TextStyle(
                  color: AppColors.textBaseDefault,
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
                    color: AppColors.textBaseSecondary,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.chevron_right,
                  color: AppColors.iconBaseTertiary,
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
