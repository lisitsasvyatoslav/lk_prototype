import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../features/tariff/widgets/tariffs_modal.dart' show showTariffsModal;
import '../../../core/widgets/tariff_row.dart';

class AccountCard extends StatelessWidget {
  final List<FlSpot> spots;

  const AccountCard({super.key, required this.spots});

  @override
  Widget build(BuildContext context) {
    double diff = spots.last.y - spots.first.y;
    Color lineColor;
    if (diff > 0) {
      lineColor = Colors.greenAccent;
    } else if (diff < 0) {
      lineColor = Colors.redAccent;
    } else {
      lineColor = Colors.grey;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
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
                    style: TextStyle(color: Colors.white70, fontSize: 11),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "иис",
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2D),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "15 августа",
                  style: TextStyle(fontSize: 12, color: Colors.white70),
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
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "-2947,23 ₽ (0,34%)",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.redAccent,
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
              color: const Color(0xFF2A2A2D),
              borderRadius: BorderRadius.circular(14),
              boxShadow: const [
                BoxShadow(color: Color(0x11000000), blurRadius: 8, offset: Offset(0, 2)),
              ],
            ),
            child: Column(
              children: [
                TariffRow(
                  title: 'Инвестор',
                  subtitle: 'Текущий тариф • с 23 дек 2023',
                  icon: Icons.show_chart,
                  gradient: const [Color(0xFF9C27B0), Color(0xFFE91E63)],
                  onTap: () => showTariffsModal(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
