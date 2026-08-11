import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class OfflineGuideScreen extends StatelessWidget {
  const OfflineGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tips = [
      'Move to higher ground immediately.',
      'Keep emergency documents in a waterproof bag.',
      'Do not walk through fast-moving water.',
      'Switch off electricity if water enters the house.',
      'Carry drinking water and essential medicines.',
      'Use SMS if internet is unavailable.',
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Offline Safety Guide',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Row(
              children: [
                Icon(Icons.offline_bolt, color: AppColors.primary),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'This guide is available without internet connection.',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          const Text(
            'Flood Safety Tips',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),

          const SizedBox(height: 16),

          ...tips.map(
            (tip) => Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: const Icon(
                  Icons.check_circle,
                  color: AppColors.success,
                ),
                title: Text(tip),
              ),
            ),
          ),

          const SizedBox(height: 24),

          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.medical_services),
            label: const Text('First Aid Guide'),
          ),

          const SizedBox(height: 14),

          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download),
            label: const Text('Download Offline PDF'),
          ),
        ],
      ),
    );
  }
}
