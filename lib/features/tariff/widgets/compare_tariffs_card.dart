import 'package:flutter/material.dart';

class CompareTariffsCard extends StatelessWidget {
  const CompareTariffsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF2F2F6),
            Color(0xFFFFFFFF),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFD1D5DB), width: 1),
      ),
      child: Stack(
        children: [
          // Text content (foreground)
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12), // 12px padding + 238px for larger image
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Не знаете какой тариф вам подходит?',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF303441),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Сравните условия и выберите подходящий',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF5E6472),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 8,
                    ),
                    side: BorderSide(color: const Color(0xFF9CA3AF)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Сравнить тарифы',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF303441),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Image positioned at bottom right (background layer) - no padding
          Positioned(
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
              ),
              child: Image(
                image: AssetImage('assets/images/compare_tariffs.png'),
                width: 199,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 199,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Text(
                        'Изображение не найдено',
                        style: TextStyle(color: Colors.red, fontSize: 10),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
