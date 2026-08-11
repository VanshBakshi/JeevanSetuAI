import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class VolunteersScreen extends StatelessWidget {
  const VolunteersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Volunteer Network',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        onPressed: () {
          _showVolunteerDialog(context);
        },
        icon: const Icon(Icons.volunteer_activism),
        label: const Text('Join'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          // ================= SUMMARY CARD =================
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.success,
                  AppColors.success.withValues(alpha: 0.85),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Volunteer Support Active',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '24 volunteers are available within 5 km of your location.',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 14),
                Row(
                  children: [
                    _MiniStat(value: '24', label: 'Available'),
                    SizedBox(width: 12),
                    _MiniStat(value: '11', label: 'Medical'),
                    SizedBox(width: 12),
                    _MiniStat(value: '8', label: 'Rescue'),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // ================= REQUEST HELP =================
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Volunteer help request sent')),
              );
            },
            icon: const Icon(Icons.handshake),
            label: const Text('Request Volunteer Help'),
          ),

          const SizedBox(height: 26),

          const Text(
            'Nearby Volunteers',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 16),

          _volunteerCard(
            name: 'Ravi Kumar',
            role: 'Medical Volunteer',
            distance: '1.1 km',
            availability: 'Available',
            color: AppColors.success,
            icon: Icons.medical_services,
          ),

          _volunteerCard(
            name: 'Neha Singh',
            role: 'Food Distribution',
            distance: '1.8 km',
            availability: 'Available',
            color: AppColors.primary,
            icon: Icons.restaurant,
          ),

          _volunteerCard(
            name: 'Aman Verma',
            role: 'Rescue Volunteer',
            distance: '2.3 km',
            availability: 'On Duty',
            color: AppColors.warning,
            icon: Icons.directions_boat,
          ),

          _volunteerCard(
            name: 'Priya Sharma',
            role: 'Shelter Support',
            distance: '3.0 km',
            availability: 'Available',
            color: Colors.deepPurple,
            icon: Icons.home_work,
          ),

          const SizedBox(height: 24),

          // ================= COMMUNITY SUPPORT =================
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Community Support',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  SizedBox(height: 14),
                  _SupportRow(
                    icon: Icons.water_drop,
                    text: 'Drinking water available at Relief Camp A',
                  ),
                  SizedBox(height: 12),
                  _SupportRow(
                    icon: Icons.restaurant,
                    text: 'Free meals from 8:00 AM to 6:00 PM',
                  ),
                  SizedBox(height: 12),
                  _SupportRow(
                    icon: Icons.medical_services,
                    text: 'Medical check-up camp active near Ward 5',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _volunteerCard({
    required String name,
    required String role,
    required String distance,
    required String availability,
    required Color color,
    required IconData icon,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 28,
              backgroundColor: color.withValues(alpha: 0.12),
              child: Icon(icon, color: color),
            ),

            const SizedBox(width: 14),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    role,
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(distance),
                    ],
                  ),
                ],
              ),
            ),

            // Action
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    availability,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                IconButton(
                  icon: const Icon(Icons.call, color: AppColors.primary),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showVolunteerDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Become a Volunteer',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),

            const SizedBox(height: 18),

            TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 14),

            TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),

            const SizedBox(height: 14),

            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'Medical', child: Text('Medical')),
                DropdownMenuItem(
                  value: 'Food',
                  child: Text('Food Distribution'),
                ),
                DropdownMenuItem(
                  value: 'Rescue',
                  child: Text('Rescue Support'),
                ),
                DropdownMenuItem(
                  value: 'Shelter',
                  child: Text('Shelter Support'),
                ),
              ],
              onChanged: (_) {},
              decoration: InputDecoration(
                labelText: 'Volunteer Type',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 22),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Volunteer registration submitted'),
                  ),
                );
              },
              child: const Text('Submit'),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// MINI STAT
// =====================================================

class _MiniStat extends StatelessWidget {
  final String value;
  final String label;

  const _MiniStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.16),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// SUPPORT ROW
// =====================================================

class _SupportRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _SupportRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: AppColors.textPrimary, height: 1.4),
          ),
        ),
      ],
    );
  }
}
