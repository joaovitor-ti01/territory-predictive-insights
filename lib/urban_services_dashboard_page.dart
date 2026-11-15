
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class UrbanServicesDashboardPage extends StatelessWidget {
  const UrbanServicesDashboardPage({super.key});

  static const Color background = Color(0xFF0B1220);
  static const Color card = Color(0xFF151F30);
  static const Color green = Color(0xFF36D399);
  static const Color orange = Color(0xFFFBBF24);
  static const Color red = Color(0xFFF87171);
  static const Color secondary = Color(0xFF94A3B8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: const Text('Serviços urbanos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'GESTÃO DE SERVIÇOS PÚBLICOS',
              style: TextStyle(
                color: secondary,
                fontSize: 11,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Operação urbana',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Indicadores demonstrativos de serviços e manutenção.',
              style: TextStyle(color: secondary),
            ),
            const SizedBox(height: 24),

            const Row(
              children: [
                Expanded(
                  child: _ServiceMetric(
                    title: 'Manutenção',
                    value: '64%',
                    subtitle: 'Índice demonstrativo',
                    icon: Icons.handyman_outlined,
                    color: green,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _ServiceMetric(
                    title: 'Pendências',
                    value: '23',
                    subtitle: 'Registros simulados',
                    icon: Icons.pending_actions_outlined,
                    color: orange,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            const Text(
              'DISTRIBUIÇÃO DOS SERVIÇOS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Quantidade de registros por categoria • Simulado',
              style: TextStyle(color: secondary, fontSize: 11),
            ),
            const SizedBox(height: 18),

            Container(
              height: 280,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: card,
                borderRadius: BorderRadius.circular(18),
              ),
              child: BarChart(
                BarChartData(
                  maxY: 50,
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
                        reservedSize: 30,
                        interval: 10,
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
                          const categories = [
                            'Luz',
                            'Resíduos',
                            'Reparo',
                            'Outros',
                          ];
                          final index = value.toInt();

                          if (index < 0 ||
                              index >= categories.length) {
                            return const SizedBox.shrink();
                          }

                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              categories[index],
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
                    _bar(0, 32, green),
                    _bar(1, 44, orange),
                    _bar(2, 27, red),
                    _bar(3, 15, secondary),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'CATEGORIAS MONITORADAS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 14),

            const _ServiceInfo(
              title: 'Iluminação pública',
              description:
                  'Acompanhamento demonstrativo de pontos que '
                  'necessitam de manutenção na iluminação.',
              icon: Icons.lightbulb_outline,
              color: orange,
            ),

            const SizedBox(height: 12),

            const _ServiceInfo(
              title: 'Coleta de resíduos',
              description:
                  'Organização de registros relacionados ao descarte '
                  'e à limpeza urbana.',
              icon: Icons.delete_outline,
              color: green,
            ),

            const SizedBox(height: 12),

            const _ServiceInfo(
              title: 'Manutenção urbana',
              description:
                  'Identificação de demandas de reparo em estruturas '
                  'e equipamentos públicos.',
              icon: Icons.construction_outlined,
              color: red,
            ),

            const SizedBox(height: 20),

            const Text(
              'LIMITAÇÃO: os indicadores e quantidades são simulados. '
              'Não representam ordens de serviço reais nem dados '
              'oficiais de órgãos públicos.',
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

  static BarChartGroupData _bar(
    int x,
    double value,
    Color color,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 24,
          borderRadius: BorderRadius.circular(5),
        ),
      ],
    );
  }
}

class _ServiceMetric extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _ServiceMetric({
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
        color: UrbanServicesDashboardPage.card,
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
              color: UrbanServicesDashboardPage.secondary,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceInfo extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const _ServiceInfo({
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
        color: UrbanServicesDashboardPage.card,
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
                    color: UrbanServicesDashboardPage.secondary,
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
