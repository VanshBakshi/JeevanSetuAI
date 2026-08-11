import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LiveRescueMapScreen extends StatelessWidget {
  const LiveRescueMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Live Rescue Map')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade50, Colors.blue.shade100],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 70,
                      top: 120,
                      child: _marker(
                        color: Colors.red,
                        icon: Icons.sos,
                        label: 'SOS',
                      ),
                    ),

                    Positioned(
                      right: 80,
                      top: 80,
                      child: _marker(
                        color: Colors.orange,
                        icon: Icons.sos,
                        label: 'SOS',
                      ),
                    ),

                    Positioned(
                      left: 160,
                      bottom: 120,
                      child: _marker(
                        color: Colors.green,
                        icon: Icons.directions_boat,
                        label: 'Team',
                      ),
                    ),

                    Positioned(
                      right: 120,
                      bottom: 90,
                      child: _marker(
                        color: AppColors.primary,
                        icon: Icons.home_work,
                        label: 'Shelter',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: const [
                    _LegendRow(color: Colors.red, label: 'Critical SOS'),
                    SizedBox(height: 10),
                    _LegendRow(color: Colors.orange, label: 'Medium SOS'),
                    SizedBox(height: 10),
                    _LegendRow(color: Colors.green, label: 'Rescue Team'),
                    SizedBox(height: 10),
                    _LegendRow(color: AppColors.primary, label: 'Shelter'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _marker({
    required Color color,
    required IconData icon,
    required String label,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(label),
        ),
      ],
    );
  }
}

class _LegendRow extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendRow({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 8, backgroundColor: color),
        const SizedBox(width: 10),
        Text(label),
      ],
    );
  }
}
