import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  final List<_AlertItem> alerts = [
    _AlertItem(
      title: 'Government Flood Warning',
      message:
          'IMD has issued a red alert for Patna district. Heavy rainfall expected in the next 6 hours.',
      time: '2 min ago',
      priority: 'HIGH',
      color: AppColors.danger,
      icon: Icons.warning_amber_rounded,
    ),
    _AlertItem(
      title: 'AI Risk Update',
      message:
          'Flood probability increased from 78% to 92% based on live rainfall and river level data.',
      time: '10 min ago',
      priority: 'AI',
      color: Colors.deepPurple,
      icon: Icons.smart_toy,
    ),
    _AlertItem(
      title: 'Rescue Broadcast',
      message:
          'Rescue Team RT-03 is moving toward Ward 5. Keep emergency lights visible.',
      time: '18 min ago',
      priority: 'LIVE',
      color: AppColors.warning,
      icon: Icons.directions_boat,
    ),
    _AlertItem(
      title: 'Weather Update',
      message:
          'Wind speed may reach 35 km/h tonight. Avoid damaged electric poles.',
      time: '32 min ago',
      priority: 'INFO',
      color: AppColors.primary,
      icon: Icons.cloud,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Alerts Center',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('All alerts marked as read')),
              );
            },
            child: const Text('Mark all'),
          ),
        ],
      ),

      body: Column(
        children: [
          // Summary banner
          Padding(
            padding: const EdgeInsets.all(18),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.primary.withValues(alpha: 0.85),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: Icon(
                      Icons.notifications_active,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      '4 active alerts in your area',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Filter chips
          SizedBox(
            height: 44,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              children: [
                _chip('All', true),
                _chip('High', false),
                _chip('AI', false),
                _chip('Weather', false),
                _chip('Rescue', false),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Alerts list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
              itemCount: alerts.length,
              itemBuilder: (context, index) {
                final alert = alerts[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 14),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: alert.color.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Icon(alert.icon, color: alert.color),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                alert.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                            _priorityBadge(alert.priority, alert.color),
                          ],
                        ),

                        const SizedBox(height: 14),

                        Text(
                          alert.message,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            height: 1.45,
                          ),
                        ),

                        const SizedBox(height: 14),

                        Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              size: 16,
                              color: AppColors.textSecondary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              alert.time,
                              style: const TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 13,
                              ),
                            ),
                            const Spacer(),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.share, size: 18),
                              label: const Text('Share'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String text, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ChoiceChip(
        label: Text(text),
        selected: selected,
        selectedColor: AppColors.primary,
        labelStyle: TextStyle(
          color: selected ? Colors.white : AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        onSelected: (_) {},
      ),
    );
  }

  Widget _priorityBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

// =====================================================
// MODEL
// =====================================================

class _AlertItem {
  final String title;
  final String message;
  final String time;
  final String priority;
  final Color color;
  final IconData icon;

  _AlertItem({
    required this.title,
    required this.message,
    required this.time,
    required this.priority,
    required this.color,
    required this.icon,
  });
}
