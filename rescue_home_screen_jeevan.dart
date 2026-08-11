import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'sos_requests_screen_jeevan.dart';
import 'live_rescue_map_screen_jeevan.dart';
import 'rescued_people_screen_jeevan.dart';

class RescueHomeScreen extends StatelessWidget {
  const RescueHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'JeevanSetu Rescue',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w800,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_active,
              color: AppColors.primary,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SOSRequestsScreen()),
              );
            },
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          // ================= HERO ALERT =================
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0F172A), Color(0xFF1E3A8A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'LIVE EMERGENCY STATUS',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                const Text(
                  'Flood Risk: HIGH',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Rescue teams are active in Ward 5, Patna. Citizens are being evacuated to safe shelters.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 18),

                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.15)),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.shield, color: Colors.greenAccent),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Connected to district emergency control room.',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: Colors.white70,
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'Updated 01:42 AM',
                      style: TextStyle(color: Colors.white70),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.network_check,
                            color: Colors.greenAccent,
                            size: 16,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'ONLINE',
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ================= STATS =================
          Row(
            children: const [
              Expanded(
                child: _StatCard(
                  title: 'Active SOS',
                  value: '12',
                  icon: Icons.sos,
                  color: Colors.red,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  title: 'Teams Active',
                  value: '08',
                  icon: Icons.groups,
                  color: Colors.green,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: const [
              Expanded(
                child: _StatCard(
                  title: 'People Rescued',
                  value: '47',
                  icon: Icons.check_circle,
                  color: Colors.blue,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  title: 'Pending',
                  value: '05',
                  icon: Icons.pending_actions,
                  color: Colors.orange,
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          // ================= QUICK ACTIONS =================
          const Text(
            'Rescue Operations',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          ),

          const SizedBox(height: 16),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.08,
            children: [
              _ActionCard(
                icon: Icons.sos,
                title: 'SOS Requests',
                subtitle: '12 waiting',
                color: Colors.red,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SOSRequestsScreen(),
                    ),
                  );
                },
              ),

              _ActionCard(
                icon: Icons.map,
                title: 'Live Map',
                subtitle: 'Real-time view',
                color: Colors.blue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LiveRescueMapScreen(),
                    ),
                  );
                },
              ),

              _ActionCard(
                icon: Icons.groups,
                title: 'Rescued',
                subtitle: '47 safe',
                color: Colors.green,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RescuedPeopleScreen(),
                    ),
                  );
                },
              ),

              _ActionCard(
                icon: Icons.campaign,
                title: 'Broadcast',
                subtitle: 'Send public alert',
                color: Colors.orange,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Emergency broadcast sent to citizens'),
                    ),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 28),

          // ================= ACTIVE MISSION =================
          _sectionCard(
            title: 'Active Rescue Mission',
            child: Column(
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: AppColors.primary,
                      child: Icon(Icons.directions_boat, color: Colors.white),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Mission RT-03',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Text(
                      'ETA 18 min',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                const LinearProgressIndicator(value: 0.72, minHeight: 8),

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Base Camp'),
                    Text('72%'),
                    Text('Ward 5'),
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

          const SizedBox(height: 18),

          // ================= WEATHER =================
          _sectionCard(
            title: 'Weather & River Update',
            child: Column(
              children: const [
                _InfoRow(
                  icon: Icons.cloud,
                  color: Colors.blue,
                  text: 'Heavy rainfall expected for next 6 hours',
                ),

                SizedBox(height: 10),

                _InfoRow(
                  icon: Icons.water_drop,
                  color: AppColors.primary,
                  text: 'River level rising by 0.4 ft/hour',
                ),

                SizedBox(height: 10),

                _InfoRow(
                  icon: Icons.thermostat,
                  color: Colors.orange,
                  text: 'Temperature 27°C',
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // ================= HOTLINES =================
          _sectionCard(
            title: 'Emergency Hotlines',
            child: Column(
              children: [
                _HotlineButton(
                  icon: Icons.local_police,
                  label: 'District Control Room',
                  number: '1077',
                  color: AppColors.primary,
                ),

                const SizedBox(height: 12),

                _HotlineButton(
                  icon: Icons.local_hospital,
                  label: 'Medical Emergency',
                  number: '108',
                  color: Colors.red,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ================= SAFETY MESSAGE =================
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.10),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              children: const [
                Icon(Icons.favorite, color: Colors.green, size: 34),
                SizedBox(height: 10),
                Text(
                  'You Are Not Alone',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Rescue teams, medical services, and shelters are connected through JeevanSetu AI. Stay calm and follow official instructions.',
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 1.5),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(icon: Icon(Icons.map), label: 'Map'),
          NavigationDestination(icon: Icon(Icons.sos), label: 'SOS'),
          NavigationDestination(icon: Icon(Icons.groups), label: 'Rescued'),
        ],
        onDestinationSelected: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LiveRescueMapScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SOSRequestsScreen()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const RescuedPeopleScreen()),
            );
          }
        },
      ),
    );
  }

  Widget _sectionCard({required String title, required Widget child}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
            ),
            const SizedBox(height: 14),
            child,
          ],
        ),
      ),
    );
  }
}

// ================= SUPPORT WIDGETS =================

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: color.withOpacity(0.12),
              child: Icon(icon, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 6),
            Text(title),
          ],
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color.withOpacity(0.12),
              child: Icon(icon, color: color, size: 30),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _InfoRow({required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 10),
        Expanded(child: Text(text)),
      ],
    );
  }
}

class _HotlineButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String number;
  final Color color;

  const _HotlineButton({
    required this.icon,
    required this.label,
    required this.number,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      icon: Icon(icon),
      label: Text('$label • $number'),
      onPressed: () {},
    );
  }
}
