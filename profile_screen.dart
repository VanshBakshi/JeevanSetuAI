import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: AppColors.primary),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Edit profile coming soon')),
              );
            },
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          // ================= PROFILE HEADER =================
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.primary.withValues(alpha: 0.85),
                ],
              ),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 46,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 54, color: AppColors.primary),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Vansh Bakshi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Ward 5, Patna, Bihar',
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 18),
                Row(
                  children: const [
                    Expanded(
                      child: _HeaderStat(value: 'B+', label: 'Blood'),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _HeaderStat(value: '2', label: 'Contacts'),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _HeaderStat(value: 'Safe', label: 'Status'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // ================= PERSONAL INFO =================
          _sectionCard(
            title: 'Personal Information',
            children: const [
              _InfoTile(
                icon: Icons.phone,
                title: 'Phone',
                value: '+91 98XXXXXX12',
              ),
              Divider(),
              _InfoTile(
                icon: Icons.email,
                title: 'Email',
                value: 'vansh@example.com',
              ),
              Divider(),
              _InfoTile(icon: Icons.cake, title: 'Age', value: '19 years'),
              Divider(),
              _InfoTile(
                icon: Icons.badge,
                title: 'Citizen ID',
                value: 'JS-IND-2026-1042',
              ),
            ],
          ),

          const SizedBox(height: 18),

          // ================= MEDICAL INFO =================
          _sectionCard(
            title: 'Medical Information',
            children: const [
              _InfoTile(
                icon: Icons.bloodtype,
                title: 'Blood Group',
                value: 'B+',
              ),
              Divider(),
              _InfoTile(
                icon: Icons.medication,
                title: 'Allergies',
                value: 'None',
              ),
              Divider(),
              _InfoTile(
                icon: Icons.monitor_heart,
                title: 'Medical Conditions',
                value: 'No chronic conditions',
              ),
            ],
          ),

          const SizedBox(height: 18),

          // ================= EMERGENCY CONTACTS =================
          _sectionCard(
            title: 'Emergency Contacts',
            children: [
              _contactTile(
                name: 'Gargi',
                relation: 'Emergency Contact',
                phone: '+91 98XXXXXX45',
              ),
              const Divider(),
              _contactTile(
                name: 'Family Contact',
                relation: 'Parent',
                phone: '+91 97XXXXXX10',
              ),
            ],
          ),

          const SizedBox(height: 18),

          // ================= FAMILY MEMBERS =================
          _sectionCard(
            title: 'Family Members',
            children: const [
              _FamilyTile(name: 'Father', status: 'Safe'),
              Divider(),
              _FamilyTile(name: 'Mother', status: 'Safe'),
              Divider(),
              _FamilyTile(name: 'Sibling', status: 'Safe'),
            ],
          ),

          const SizedBox(height: 18),

          // ================= ADDRESS =================
          _sectionCard(
            title: 'Registered Address',
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'House No. 21, Ward 5,\nPatna, Bihar - 800001',
                  style: TextStyle(color: AppColors.textPrimary, height: 1.5),
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          // ================= EMERGENCY ID CARD =================
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.textPrimary,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Row(
                  children: [
                    Icon(Icons.verified_user, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Emergency ID Card',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Name: Vansh Bakshi',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 8),
                Text('Blood Group: B+', style: TextStyle(color: Colors.white)),
                SizedBox(height: 8),
                Text(
                  'Emergency Contact: +91 98XXXXXX45',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  'Citizen ID: JS-IND-2026-1042',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download),
            label: const Text('Download Emergency ID'),
          ),

          const SizedBox(height: 12),

          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.share),
            label: const Text('Share Emergency ID'),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _sectionCard({required String title, required List<Widget> children}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 14),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _contactTile({
    required String name,
    required String relation,
    required String phone,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        backgroundColor: AppColors.primary,
        child: Icon(Icons.person, color: Colors.white),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.w700)),
      subtitle: Text(relation),
      trailing: IconButton(
        icon: const Icon(Icons.call, color: AppColors.primary),
        onPressed: () {},
      ),
    );
  }
}

// =====================================================
// HEADER STAT
// =====================================================

class _HeaderStat extends StatelessWidget {
  final String value;
  final String label;

  const _HeaderStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// INFO TILE
// =====================================================

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title),
      subtitle: Text(value),
    );
  }
}

// =====================================================
// FAMILY TILE
// =====================================================

class _FamilyTile extends StatelessWidget {
  final String name;
  final String status;

  const _FamilyTile({required this.name, required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.primary,
          child: Icon(Icons.person, size: 18, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(name)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.success.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            status,
            style: const TextStyle(
              color: AppColors.success,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
