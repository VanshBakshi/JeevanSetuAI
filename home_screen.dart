import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../risk/risk_screen.dart';
import '../shelter/shelter_screen.dart';
import '../alerts/alerts_screen.dart';
import '../offline/offline_guide_screen.dart';
import '../map/live_map_screen.dart';
import '../volunteers/volunteers_screen.dart';
import '../profile/profile_screen.dart';
import '../reports/disaster_reports_screen.dart';
import '../sos/sos_screen.dart';
import '../ai/ai_assistant_screen.dart';
import '../settings/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color bg = Color(0xFFF7F9FC);
  static const Color primary = Color(0xFF2563EB);
  static const Color textDark = Color(0xFF172033);
  static const Color textGrey = Color(0xFF667085);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundColor: primary,
              child: Icon(Icons.water_drop, color: Colors.white),
            ),
            SizedBox(width: 10),
            Text(
              'JeevanSetuAI',
              style: TextStyle(
                color: textDark,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none,
                color: textDark),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const AlertsScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_outline,
                color: textDark),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),

      // ================= BODY =================
      body: SingleChildScrollView(
        child: Column(
          children: [

            // ================= HERO IMAGE =================
            Container(
              margin: const EdgeInsets.all(16),
              height: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/images/flood_banner.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.65),
                      Colors.black.withOpacity(0.10),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomLeft,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Stay Safe, Stay Connected',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'AI-powered flood assistance for your family',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ================= LIVE ALERT CARD =================
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF4D4F), Color(0xFFFF6B3D)],
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Row(
                children: [
                  Icon(Icons.warning_amber_rounded,
                      color: Colors.white, size: 34),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Flood Risk: HIGH',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Heavy rainfall expected in the next 6 hours.',
                          style: TextStyle(
                            color: Colors.white,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // ================= LOCATION CARD =================
            _infoCard(
              icon: Icons.location_on,
              color: primary,
              title: 'Current Location',
              subtitle: 'Ward 5, Patna, Bihar',
              trailing: const Text(
                'Safe Zone',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 18),

            // ================= SAFETY MESSAGE =================
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.10),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Row(
                children: [
                  Icon(Icons.shield,
                      color: Colors.green, size: 30),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'You are connected to the district emergency control room.',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // ================= QUICK ACTIONS =================
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.02,
                children: [
                  _actionCard(
                    context,
                    icon: Icons.analytics_outlined,
                    title: 'Risk Analysis',
                    subtitle: 'AI flood prediction',
                    color: Colors.red,
                    screen: const RiskScreen(),
                  ),
                  _actionCard(
                    context,
                    icon: Icons.home_work_rounded,
                    title: 'Shelters',
                    subtitle: 'Find safe places',
                    color: Colors.green,
                    screen: const ShelterScreen(),
                  ),
                  _actionCard(
                    context,
                    icon:
                        Icons.notifications_active_rounded,
                    title: 'Alerts',
                    subtitle: 'Government warnings',
                    color: Colors.orange,
                    screen: const AlertsScreen(),
                  ),
                  _actionCard(
                    context,
                    icon: Icons.wifi_off_rounded,
                    title: 'Offline Guide',
                    subtitle: 'Works without internet',
                    color: Colors.deepPurple,
                    screen: const OfflineGuideScreen(),
                  ),
                  _actionCard(
                    context,
                    icon: Icons.map_rounded,
                    title: 'Live Map',
                    subtitle: 'Flood & shelter map',
                    color: Colors.blue,
                    screen: const LiveMapScreen(),
                  ),
                  _actionCard(
                    context,
                    icon:
                        Icons.volunteer_activism_rounded,
                    title: 'Volunteers',
                    subtitle: 'Nearby help',
                    color: Colors.teal,
                    screen: const VolunteersScreen(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ================= WEATHER + AI =================
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(child: _weatherCard()),
                  const SizedBox(width: 12),
                  Expanded(child: _aiCard()),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ================= SHELTER STATUS =================
            _sectionCard(
              title: 'Nearest Safe Shelters',
              children: [
                _shelterTile(
                  'Govt School Ward 5',
                  '1.2 km',
                  '120 / 200',
                ),
                const Divider(),
                _shelterTile(
                  'Community Hall Sector 3',
                  '2.5 km',
                  '180 / 180',
                ),
                const Divider(),
                _shelterTile(
                  'Relief Camp A',
                  '3.1 km',
                  '42 / 150',
                ),
              ],
            ),

            const SizedBox(height: 22),

            // ================= EMERGENCY BUTTONS =================
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const DisasterReportsScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                          Icons.report_gmailerrorred),
                      label: const Text('Report'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  const SosScreen()),
                        );
                      },
                      icon: const Icon(Icons.sos),
                      label: const Text('Emergency SOS'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // ================= EMERGENCY CONTACTS =================
            _sectionCard(
              title: 'Emergency Contacts',
              children: [
                _contactTile(Icons.local_police,
                    'Police', '112'),
                _contactTile(Icons.local_hospital,
                    'Ambulance', '108'),
                _contactTile(Icons.fire_truck,
                    'Disaster Force', '101'),
              ],
            ),

            const SizedBox(height: 22),

            // ================= RECENT ALERTS =================
            _sectionCard(
              title: 'Recent Alerts',
              children: const [
                _AlertTile(
                  icon: Icons.warning,
                  color: Colors.red,
                  title: 'Heavy rain warning',
                  time: '15 min ago',
                ),
                _AlertTile(
                  icon: Icons.flood,
                  color: Colors.orange,
                  title: 'River level rising',
                  time: '1 hour ago',
                ),
                _AlertTile(
                  icon: Icons.campaign,
                  color: Colors.blue,
                  title: 'Government advisory',
                  time: '3 hours ago',
                ),
              ],
            ),

            const SizedBox(height: 90),
          ],
        ),
      ),

      // ================= FLOATING SOS =================
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.red,
        icon: const Icon(Icons.sos),
        label: const Text('SOS'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => const SosScreen()),
          );
        },
      ),

      // ================= BOTTOM NAV =================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        const LiveMapScreen()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        const AlertsScreen()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        const ProfileScreen()),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_rounded),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_rounded),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // ================= ACTION CARD =================
  static Widget _actionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required Widget screen,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => screen),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon,
                  color: color, size: 28),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: textDark,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                color: textGrey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= WEATHER CARD =================
  Widget _weatherCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.cloud,
                  color: Colors.blue),
              SizedBox(width: 8),
              Text(
                'Weather',
                style: TextStyle(
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            '27°C',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: textDark,
            ),
          ),
          SizedBox(height: 6),
          Text('Humidity 74%',
              style: TextStyle(color: textGrey)),
          Text('Wind 18 km/h',
              style: TextStyle(color: textGrey)),
          Text('Heavy Rain',
              style: TextStyle(color: textGrey)),
        ],
      ),
    );
  }

  // ================= AI CARD =================
  Widget _aiCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.auto_awesome,
                  color: primary),
              SizedBox(width: 8),
              Text(
                'AI Risk',
                style: TextStyle(
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 96,
                height: 96,
                child: CircularProgressIndicator(
                  value: 0.72,
                  strokeWidth: 10,
                  color: primary,
                  backgroundColor:
                      primary.withOpacity(0.12),
                ),
              ),
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '72%',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'HIGH',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Flood probability in next 48 hours.',
            style: TextStyle(
              color: textDark,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // ================= INFO CARD =================
  static Widget _infoCard({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    Widget? trailing,
  }) {
    return Container(
      margin:
          const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor:
                color.withOpacity(0.12),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: textGrey,
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  // ================= SECTION CARD =================
  static Widget _sectionCard({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      margin:
          const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textDark,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  // ================= SHELTER TILE =================
  static Widget _shelterTile(
      String name, String distance, String capacity) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: primary,
          child: Icon(Icons.home_work,
              color: Colors.white),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: textDark,
                ),
              ),
              Text(
                distance,
                style:
                    const TextStyle(color: textGrey),
              ),
            ],
          ),
        ),
        Text(
          capacity,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: textDark,
          ),
        ),
      ],
    );
  }

  // ================= CONTACT TILE =================
  static Widget _contactTile(
      IconData icon, String title, String number) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
                primary.withOpacity(0.12),
            child: Icon(icon, color: primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: textDark,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= ALERT TILE =================
class _AlertTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String time;

  const _AlertTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
                color.withOpacity(0.12),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: HomeScreen.textDark,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              color: HomeScreen.textGrey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}