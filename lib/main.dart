import 'package:flutter/material.dart';

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
    const _SectionPage(
      title: 'Dados territoriais',
      description: 'Indicadores, estatísticas e evolução dos dados.',
      icon: Icons.bar_chart,
    ),
    const _SectionPage(
      title: 'Mapa territorial',
      description: 'Visualização das regiões monitoradas.',
      icon: Icons.map_outlined,
    ),
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