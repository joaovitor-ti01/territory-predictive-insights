import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const TerritoryApp());
}

const Color backgroundColor = Color(0xFF0B1220);
const Color cardColor = Color(0xFF151F30);
const Color primaryGreen = Color(0xFF36D399);
const Color secondaryText = Color(0xFF94A3B8);

class TerritoryApp extends StatelessWidget {
  const TerritoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Territory Predictive Insights',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryGreen,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

  class _DashboardPageState extends State<DashboardPage> {
    int _selectedIndex = 0;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TERRITORY',
                style: TextStyle(
                  color: primaryGreen,
                  fontSize: 11,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Predictive Insights',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: IndexedStack(
         index: _selectedIndex,
         children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'PAINEL OPERACIONAL',
                style: TextStyle(
                  color: secondaryText,
                  fontSize: 11,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Visão geral do território',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                'Acompanhe indicadores e riscos identificados.',
                style: TextStyle(color: secondaryText),
              ),
              const SizedBox(height: 24),

              // Indicador principal
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF123D36), Color(0xFF152B35)],
                  ),
                  border: Border.all(color: primaryGreen.withValues(alpha: 0.25)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.analytics_outlined, color: primaryGreen),
                        SizedBox(width: 8),
                        Text(
                            'ÍNDICE DE MONITORAMENTO',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                            color: secondaryText,
                            fontSize: 11,
                            letterSpacing: 1,
                          ),
                        
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '82',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: primaryGreen,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 9, left: 5),
                          child: Text(
                            '/100',
                            style: TextStyle(color: secondaryText),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'MONITORAMENTO ATIVO',
                          style: TextStyle(
                            color: primaryGreen,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.82,
                        minHeight: 8,
                        backgroundColor: Color(0xFF30443F),
                        valueColor: AlwaysStoppedAnimation(primaryGreen),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Indicador demonstrativo para o protótipo.',
                      style: TextStyle(color: secondaryText, fontSize: 11),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                'INDICADORES TERRITORIAIS',
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),

              const Row(
                children: [
                  Expanded(
                    child: MetricCard(
                      title: 'Regiões',
                      value: '24',
                      subtitle: 'Monitoradas',
                      icon: Icons.location_on_outlined,
                      color: Color(0xFF60A5FA),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: MetricCard(
                      title: 'Alertas',
                      value: '08',
                      subtitle: 'Identificados',
                      icon: Icons.warning_amber_rounded,
                      color: Color(0xFFFBBF24),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              const Row(
                children: [
                  Expanded(
                    child: MetricCard(
                      title: 'Risco alto',
                      value: '03',
                      subtitle: 'Regiões críticas',
                      icon: Icons.error_outline,
                      color: Color(0xFFF87171),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: MetricCard(
                      title: 'Dados',
                      value: '96%',
                      subtitle: 'Disponibilidade',
                      icon: Icons.cloud_done_outlined,
                      color: primaryGreen,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'ALERTAS PRIORITÁRIOS',
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Ver todos',
                      style: TextStyle(color: primaryGreen),
                    ),
                  ),
                ],
              ),

              const AlertCard(
                title: 'Região Norte',
                description: 'Aumento de risco identificado',
                severity: 'ALTO',
                color: Color(0xFFF87171),
                icon: Icons.trending_up,
              ),

              const SizedBox(height: 10),

              const AlertCard(
                title: 'Região Central',
                description: 'Necessita de monitoramento',
                severity: 'MÉDIO',
                color: Color(0xFFFBBF24),
                icon: Icons.visibility_outlined,
              ),

              const SizedBox(height: 24),

              const Center(
                child: Text(
                  'TERRITORY PREDICTIVE INSIGHTS • 2026',
                  style: TextStyle(
                    color: secondaryText,
                    fontSize: 10,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
            ),
    const DataDashboardPage(),
   const MapTerritorialPage(),
    const _SectionPage(
      title: 'Central de alertas',
      description: 'Acompanhe riscos, evidências e alertas identificados.',
      icon: Icons.notifications_active_outlined,
        ),
     ],
        ),
          bottomNavigationBar: NavigationBar(
          backgroundColor: cardColor,
          indicatorColor: primaryGreen.withValues(alpha: 0.15),
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.dashboard_outlined),
              label: 'Painel',
            ),
            NavigationDestination(icon: Icon(Icons.bar_chart), label: 'Dados'),
            NavigationDestination(icon: Icon(Icons.map_outlined), label: 'Mapa'),
            NavigationDestination(
              icon: Icon(Icons.notifications_outlined),
              label: 'Alertas',
            ),
          ],
        ),
      );
    }
  }



class MapTerritorialPage extends StatelessWidget {
  const MapTerritorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    
final regioes = [
  _criarMarcador(
    context,
    const LatLng(-23.5614, -46.6559),
    Colors.red,
    'Região Paulista',
    'Alto',
    'Indicador de risco elevado no cenário demonstrativo.',
  ),
  _criarMarcador(
    context,
    const LatLng(-23.5505, -46.6333),
    Colors.orange,
    'Região Central',
    'Médio',
    'Variação moderada dos indicadores monitorados.',
  ),
  _criarMarcador(
    context,
    const LatLng(-23.5666, -46.7017),
    Colors.green,
    'Região Butantã',
    'Baixo',
    'Indicadores estáveis no cenário demonstrativo.',
  ),
  _criarMarcador(
    context,
    const LatLng(-23.5235, -46.4816),
    Colors.orange,
    'Região Itaquera',
    'Médio',
    'Necessidade de acompanhamento dos indicadores.',
  ),
  _criarMarcador(
    context,
    const LatLng(-23.6528, -46.7108),
    Colors.red,
    'Região Capão Redondo',
    'Alto',
    'Indicador de atenção prioritária no cenário demonstrativo.',
  ),
];


    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mapa territorial',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Monitoramento de regiões de São Paulo',
            style: TextStyle(color: Color(0xFF94A3B8)),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(-23.5505, -46.6333),
                  initialZoom: 10.5,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName:
                        'com.joaovitor.territory.territory_predictive_insights',
                  ),
                  MarkerLayer(markers: regioes),
                ],
              ),
            ),
          ),

          const SizedBox(height: 14),
          const Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              _MapLegend(color: Colors.green, label: 'Baixo risco'),
              _MapLegend(color: Colors.orange, label: 'Médio risco'),
              _MapLegend(color: Colors.red, label: 'Alto risco'),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Marcadores demonstrativos. Não representam medições reais.',
            style: TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Mapa © OpenStreetMap contributors',
            style: TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Marker _criarMarcador(
    BuildContext context,
    LatLng ponto,
    Color cor,
    String regiao,
    String risco,
    String evidencia,
  ) {
    return Marker(
      point: ponto,
      width: 48,
      height: 48,
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: const Color(0xFF151F30),
              title: Text(
                regiao,
                style: const TextStyle(color: Colors.white),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nível de risco: $risco',
                    style: TextStyle(
                      color: cor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    evidencia,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Dados demonstrativos. A avaliação final exige validação humana.',
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Fechar'),
                ),
              ],
            ),
          );
        },
        child: Icon(
          Icons.location_on,
          color: cor,
          size: 42,
        ),
      ),
    );
  }

}

class _MapLegend extends StatelessWidget {
  final Color color;
  final String label;

  const _MapLegend({
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(radius: 5, backgroundColor: color),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

class DataDashboardPage extends StatelessWidget {
  const DataDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'INTELIGÊNCIA TERRITORIAL',
            style: TextStyle(
              color: secondaryText,
              fontSize: 11,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Análise de dados',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Acompanhe a evolução dos indicadores.',
            style: TextStyle(color: secondaryText),
          ),
          const SizedBox(height: 24),

          const Row(
            children: [
              Expanded(
                child: MetricCard(
                  title: 'Risco atual',
                  value: '68%',
                  subtitle: 'Índice demonstrativo',
                  icon: Icons.trending_up,
                  color: Color(0xFFFBBF24),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: MetricCard(
                  title: 'Variação',
                  value: '+34%',
                  subtitle: 'No período',
                  icon: Icons.show_chart,
                  color: Color(0xFFF87171),
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          const Text(
            'EVOLUÇÃO DO RISCO TERRITORIAL',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Últimos seis meses • Dados simulados',
            style: TextStyle(
              color: secondaryText,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 18),

          Container(
            height: 260,
            padding: const EdgeInsets.fromLTRB(8, 20, 16, 8),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.06),
              ),
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
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '${value.toInt()}',
                          style: const TextStyle(
                            color: secondaryText,
                            fontSize: 10,
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const months = [
                          'JUN',
                          'JUL',
                          'AGO',
                          'SET',
                          'OUT',
                          'NOV',
                        ];

                        final index = value.toInt();

                        if (index < 0 || index >= months.length) {
                          return const SizedBox.shrink();
                        }

                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            months[index],
                            style: const TextStyle(
                              color: secondaryText,
                              fontSize: 10,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                barGroups: [
                  _bar(0, 34),
                  _bar(1, 42),
                  _bar(2, 39),
                  _bar(3, 51),
                  _bar(4, 59),
                  _bar(5, 68),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          const AlertCard(
            title: 'Tendência de crescimento',
            description:
                'O índice demonstrativo apresenta aumento no período analisado.',
            severity: 'ATENÇÃO',
            color: Color(0xFFFBBF24),
            icon: Icons.trending_up,
          ),

          const SizedBox(height: 16),

          const Text(
            'Os valores apresentados são simulados para demonstração '
            'do protótipo e não representam medições reais.',
            style: TextStyle(
              color: secondaryText,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  static BarChartGroupData _bar(int x, double value) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: primaryGreen,
          width: 18,
          borderRadius: BorderRadius.circular(5),
        ),
      ],
    );
  }
}

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 14),
          Text(
            value,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 3),
          Text(
            subtitle,
            style: const TextStyle(color: secondaryText, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class AlertCard extends StatelessWidget {
  final String title;
  final String description;
  final String severity;
  final Color color;
  final IconData icon;

  const AlertCard({
    super.key,
    required this.title,
    required this.description,
    required this.severity,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 25),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(color: secondaryText, fontSize: 11),
                ),
              ],
            ),
          ),
          Text(
            severity,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionPage extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _SectionPage({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64,
              color: primaryGreen,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: secondaryText,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}