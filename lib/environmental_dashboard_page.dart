
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class EnvironmentalDashboardPage extends StatelessWidget {
  const EnvironmentalDashboardPage({super.key});

  static const Color background = Color(0xFF0B1220);
  static const Color card = Color(0xFF151F30);
  static const Color green = Color(0xFF36D399);
  static const Color blue = Color(0xFF38BDF8);
  static const Color yellow = Color(0xFFFBBF24);
  static const Color secondary = Color(0xFF94A3B8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: const Text('Riscos ambientais'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'MONITORAMENTO AMBIENTAL',
              style: TextStyle(
                color: secondary,
                fontSize: 11,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Indicadores ambientais',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Visão demonstrativa das condições de risco territorial.',
              style: TextStyle(color: secondary),
            ),
            const SizedBox(height: 24),

            const Row(
              children: [
                Expanded(
                  child: _EnvironmentalMetric(
                    title: 'Risco de alagamento',
                    value: '72%',
                    subtitle: 'Índice demonstrativo',
                    icon: Icons.water,
                    color: blue,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _EnvironmentalMetric(
                    title: 'Áreas de atenção',
                    value: '08',
                    subtitle: 'Regiões simuladas',
                    icon: Icons.warning_amber,
                    color: yellow,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            const Text(
              'ÍNDICE AMBIENTAL POR PERÍODO',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Últimos seis períodos • Dados simulados',
              style: TextStyle(color: secondary, fontSize: 11),
            ),
            const SizedBox(height: 18),

            Container(
              height: 260,
              padding: const EdgeInsets.fromLTRB(8, 20, 16, 8),
              decoration: BoxDecoration(
                color: card,
                borderRadius: BorderRadius.circular(18),
              ),
              child: BarChart(
                BarChartData(
                  maxY: 100,
                  minY: 0,
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                  ),
                  borderData: FlBorderData(show: false),
                  barTouchData: BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 35,
                        interval: 20,
                        getTitlesWidget: (value, meta) => Text(
                          value.toInt().toString(),
                          style: const TextStyle(
                            color: secondary,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const periods = [
                            'JUN', 'JUL', 'AGO',
                            'SET', 'OUT', 'NOV',
                          ];
                          final index = value.toInt();
                          if (index < 0 || index >= periods.length) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              periods[index],
                              style: const TextStyle(
                                color: secondary,
                                fontSize: 10,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  barGroups: [
                    _bar(0, 35),
                    _bar(1, 48),
                    _bar(2, 42),
                    _bar(3, 61),
                    _bar(4, 75),
                    _bar(5, 72),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            const _EnvironmentalInfo(
              title: 'Alagamentos',
              description:
                  'Indicador ilustrativo para identificação de regiões '
                  'que exigiriam atenção em períodos de chuva.',
              icon: Icons.flood_outlined,
              color: blue,
            ),

            const SizedBox(height: 12),

            const _EnvironmentalInfo(
              title: 'Condições climáticas',
              description:
                  'A análise real depende de dados meteorológicos '
                  'atualizados e validação das condições locais.',
              icon: Icons.cloud_outlined,
              color: yellow,
            ),

            const SizedBox(height: 20),

            const Text(
              'LIMITAÇÃO: os valores são simulados para demonstração '
              'da interface. Não representam medições ambientais, '
              'previsões meteorológicas ou alertas oficiais.',
              style: TextStyle(
                color: secondary,
                fontSize: 11,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static BarChartGroupData _bar(int x, double value) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: blue,
          width: 18,
          borderRadius: BorderRadius.circular(5),
        ),
      ],
    );
  }
}

class _EnvironmentalMetric extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _EnvironmentalMetric({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: EnvironmentalDashboardPage.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 25),
          const SizedBox(height: 14),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: const TextStyle(
              color: EnvironmentalDashboardPage.secondary,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _EnvironmentalInfo extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const _EnvironmentalInfo({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: EnvironmentalDashboardPage.card,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    color: EnvironmentalDashboardPage.secondary,
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
