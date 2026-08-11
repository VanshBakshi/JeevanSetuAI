import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RescueMissionScreen extends StatefulWidget {
  final String citizenName;
  final String location;

  const RescueMissionScreen({
    super.key,
    required this.citizenName,
    required this.location,
  });

  @override
  State<RescueMissionScreen> createState() => _RescueMissionScreenState();
}

class _RescueMissionScreenState extends State<RescueMissionScreen> {
  String status = 'Assigned';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Rescue Mission',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // ================= PERSON CARD =================
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 42,
                      backgroundColor: AppColors.primary.withOpacity(0.12),
                      child: const Icon(
                        Icons.person,
                        size: 42,
                        color: AppColors.primary,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Text(
                      widget.citizenName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_on, color: AppColors.primary),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            widget.location,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: _statusColor(status).withOpacity(0.12),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: _statusColor(status),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            // ================= MISSION DETAILS =================
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    _infoRow('Mission ID', 'JS-RES-1042'),
                    const Divider(),
                    _infoRow('Rescue Team', 'RT-03'),
                    const Divider(),
                    _infoRow('Rescue Boat', 'RB-12'),
                    const Divider(),
                    _infoRow('Assigned Time', '01:18 AM'),
                    const Divider(),
                    _infoRow('Estimated Arrival', '18 min'),
                    const Divider(),
                    _infoRow('Priority', 'HIGH'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            // ================= LIVE TRACKER =================
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Live Rescue Progress',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 14),

                    const LinearProgressIndicator(value: 0.72, minHeight: 10),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Base Camp'),
                        Text('72%'),
                        Text('Citizen'),
                      ],
                    ),

                    const SizedBox(height: 14),

                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.success.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.info_outline, color: AppColors.success),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Team leader confirmed safe route through Main Bridge.',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ================= ACTION BUTTONS =================
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.navigation),
                label: const Text('Navigate to Location'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Opening navigation...')),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success,
                ),
                icon: const Icon(Icons.check_circle),
                label: const Text('Mark as Rescued'),
                onPressed: () {
                  setState(() => status = 'Rescued');

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Mission completed')),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.call),
                label: const Text('Call Citizen'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Calling citizen...')),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.message),
                label: const Text('Send SMS'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('SMS sent successfully')),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ================= STATUS COLOR =================
  Color _statusColor(String value) {
    switch (value) {
      case 'Rescued':
        return AppColors.success;
      case 'Assigned':
        return Colors.orange;
      default:
        return AppColors.primary;
    }
  }

  // ================= INFO ROW =================
  Widget _infoRow(String title, String value) {
    return Row(
      children: [
        Expanded(child: Text(title)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w700)),
      ],
    );
  }
}
