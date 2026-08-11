import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class RiskScreen extends StatelessWidget {
  const RiskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Risk Prediction',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      // ================= BODY =================
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= RISK GAUGE =================
              Center(
                child: SizedBox(
                  width: 280,
                  height: 280,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Background Circle
                      SizedBox(
                        width: 250,
                        height: 250,
                        child: CircularProgressIndicator(
                          value: 1,
                          strokeWidth: 16,
                          backgroundColor: Colors.red.withValues(alpha: 0.08),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.red.withValues(alpha: 0.15),
                          ),
                        ),
                      ),

                      // Progress Circle
                      SizedBox(
                        width: 250,
                        height: 250,
                        child: CircularProgressIndicator(
                          value: 0.92,
                          strokeWidth: 16,
                          strokeCap: StrokeCap.round,
                          backgroundColor: Colors.transparent,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.danger,
                          ),
                        ),
                      ),

                      // Center Content
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'RISK LEVEL',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'HIGH',
                            style: TextStyle(
                              color: AppColors.danger,
                              fontSize: 38,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '82%',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 48,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Probability',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // ================= WHY HIGH RISK =================
              Text(
                'Why High Risk?',
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const SizedBox(height: 18),

              const _RiskReason(
                icon: Icons.cloud,
                text: 'Heavy rainfall predicted',
              ),

              const _RiskReason(
                icon: Icons.water_drop,
                text: 'Water level rising fast',
              ),

              const _RiskReason(icon: Icons.landscape, text: 'Low-lying area'),

              const _RiskReason(
                icon: Icons.warning_amber_rounded,
                text: 'High drainage blockage',
              ),

              const SizedBox(height: 26),

              // ================= SAFETY NOTE =================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: AppColors.primary),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Stay in a safe place and follow official instructions from local authorities.',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ================= ACTION BUTTON =================
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(28),
                        ),
                      ),
                      builder: (_) => Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Detailed Risk Report',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text('• Flood probability: 92%'),
                            SizedBox(height: 8),
                            Text('• Rainfall intensity: Very High'),
                            SizedBox(height: 8),
                            Text('• River overflow risk: High'),
                            SizedBox(height: 8),
                            Text(
                              '• Recommended evacuation time: Within 90 minutes',
                            ),
                            SizedBox(height: 8),
                            Text('• Nearest safe shelter: Govt School Ward 5'),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text('View Details', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ===========================================================
// RISK REASON TILE
// ===========================================================

class _RiskReason extends StatelessWidget {
  final IconData icon;
  final String text;

  const _RiskReason({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
