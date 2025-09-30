import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../features/tariff/widgets/tariffs_modal.dart' show navigateToTariffsScreen;
import '../../../core/widgets/tariff_row.dart';
import '../../../core/theme/appcolors.dart';

class AccountChartCard extends StatelessWidget {
  final List<FlSpot> spots;

  const AccountChartCard({super.key, required this.spots});

  @override
  Widget build(BuildContext context) {
    double diff = spots.last.y - spots.first.y;
    Color lineColor;
    if (diff > 0) {
      lineColor = AppColors.iconPositiveDefault;
    } else if (diff < 0) {
      lineColor = AppColors.iconNegativeDefault;
    } else {
      lineColor = Colors.grey;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgBaseSecondary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    "15185RI112B • Название счета",
                    style: TextStyle(color: AppColors.textBaseSecondary, fontSize: 11),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.iconBrandDefault,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "иис",
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: AppColors.iconOnBrandDefault,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.opacityBase24,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "15 августа",
                  style: TextStyle(fontSize: 11, color: AppColors.textBaseSecondary),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "1 593 742,90 ₽",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textBaseDefault,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "-2947,23 ₽ (0,34%)",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textNegativeDefault,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 32),
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      lineTouchData: LineTouchData(enabled: false),
                      minX: 0,
                      maxX: 6,
                      minY: 0,
                      maxY: 30,
                      lineBarsData: [
                        LineChartBarData(
                          spots: spots,
                          isCurved: false,
                          color: lineColor,
                          dotData: FlDotData(show: false),
                          barWidth: 2,
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                lineColor.withOpacity(0.3),
                                lineColor.withOpacity(0.0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Container(
            decoration: BoxDecoration(
              color: AppColors.bgBaseTertiary,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              children: [
                TariffRow(
                  title: 'Инвестор',
                  subtitle: 'Бесплатно • с 23 дек 2023',
                  svgIcon: 'assets/icons/chart_forest.svg',
                  iconSize: 20.5,
                  gradient: const [Color(0xFFF9F9F9), Color(0xFFDFE4ED)],
                  tariffName: 'Инвестор',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
