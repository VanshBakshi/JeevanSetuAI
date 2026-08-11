import 'package:flutter/material.dart';

// ================= THEME =================
import 'theme/app_theme.dart';

// ================= CITIZEN MODULES =================
import 'screens/home/home_screen.dart';
import 'screens/risk/risk_screen.dart';
import 'screens/shelter/shelter_screen.dart';
import 'screens/alerts/alerts_screen.dart';
import 'screens/offline/offline_guide_screen.dart';
import 'screens/map/live_map_screen.dart';
import 'screens/volunteers/volunteers_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/reports/disaster_reports_screen.dart';
import 'screens/sos/sos_screen.dart';
import 'screens/ai/ai_assistant_screen.dart';
import 'screens/settings/settings_screen.dart';

// ================= RESCUE TEAM MODULES =================
import 'rescue_team/rescue_home_screen_jeevan.dart';
import 'rescue_team/sos_requests_screen_jeevan.dart';
import 'rescue_team/live_rescue_map_screen_jeevan.dart';
import 'rescue_team/rescued_people_screen_jeevan.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const JeevanSetuApp());
}

class JeevanSetuApp extends StatelessWidget {
  const JeevanSetuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JeevanSetuAI',
      debugShowCheckedModeBanner: false,

      // ================= THEME =================
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
          brightness: Brightness.light,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF172033),
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: Color(0xFF172033),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2563EB),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),

      // ================= START SCREEN =================
      home: const DashboardSelectionScreen(),

      // ================= ROUTES =================
      routes: {
        // Citizen
        '/citizen': (context) => const HomeScreen(),
        '/risk': (context) => const RiskScreen(),
        '/shelter': (context) => const ShelterScreen(),
        '/alerts': (context) => const AlertsScreen(),
        '/offline': (context) => const OfflineGuideScreen(),
        '/map': (context) => const LiveMapScreen(),
        '/volunteers': (context) => const VolunteersScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/reports': (context) => const DisasterReportsScreen(),
        '/sos': (context) => const SosScreen(),
        '/ai': (context) => const AIAssistantScreen(),
        '/settings': (context) => const SettingsScreen(),

        // Rescue
        '/rescue': (context) => const RescueHomeScreen(),
        '/rescue_sos': (context) => const SOSRequestsScreen(),
        '/rescue_map': (context) => const LiveRescueMapScreen(),
        '/rescued_people': (context) => const RescuedPeopleScreen(),
      },
    );
  }
}

// =====================================================
// DASHBOARD SELECTION SCREEN
// =====================================================
class DashboardSelectionScreen extends StatelessWidget {
  const DashboardSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Logo
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: const Color(0xFF2563EB),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Icon(
                  Icons.shield,
                  color: Colors.white,
                  size: 56,
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                'JeevanSetuAI',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF172033),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Disaster Response Intelligence Platform',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF667085),
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 42),

              // Citizen Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.person, size: 28),
                  label: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      'Citizen Dashboard',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 18),

              // Rescue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.local_police, size: 28),
                  label: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      'Rescue Team Dashboard',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RescueHomeScreen(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 34),

              // Features Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    _FeatureRow('Live Flood Alerts'),
                    SizedBox(height: 10),
                    _FeatureRow('Offline Emergency Support'),
                    SizedBox(height: 10),
                    _FeatureRow('AI Rescue Coordination'),
                    SizedBox(height: 10),
                    _FeatureRow('Shelter & Volunteer Network'),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                'Choose the mode that matches your role during an emergency.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF667085),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =====================================================
// FEATURE ROW
// =====================================================
class _FeatureRow extends StatelessWidget {
  final String text;

  const _FeatureRow(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: Colors.green, size: 20),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}