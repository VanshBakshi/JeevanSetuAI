import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'rescue_mission_screen_jeevan.dart';

class SOSRequestsScreen extends StatelessWidget {
  const SOSRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final requests = [
      {
        'name': 'Ravi Kumar',
        'location': 'Ward 5, Patna',
        'people': '4',
        'water': 'Waist Level',
        'time': '2 min ago',
        'priority': 'HIGH',
      },
      {
        'name': 'Neha Singh',
        'location': 'Sector 2, Patna',
        'people': '2',
        'water': 'Knee Level',
        'time': '8 min ago',
        'priority': 'MEDIUM',
      },
      {
        'name': 'Aman Verma',
        'location': 'Rampur Village',
        'people': '6',
        'water': 'Chest Level',
        'time': '15 min ago',
        'priority': 'HIGH',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'SOS Requests',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),

      body: Column(
        children: [
          // ================= HEADER =================
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(18, 8, 18, 12),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFF4D4F), Color(0xFFFF6B3D)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.sos, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'LIVE SOS FEED',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  '3 active rescue requests nearby',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),

          // ================= LIST =================
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              itemCount: requests.length,
              itemBuilder: (context, index) {
                final r = requests[index];
                final high = r['priority'] == 'HIGH';

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // TOP ROW
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 26,
                              backgroundColor: high
                                  ? Colors.red
                                  : Colors.orange,
                              child: const Icon(Icons.sos, color: Colors.white),
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    r['name']!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    r['time']!,
                                    style: const TextStyle(
                                      color: AppColors.textSecondary,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: high
                                    ? Colors.red.withOpacity(0.12)
                                    : Colors.orange.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                r['priority']!,
                                style: TextStyle(
                                  color: high ? Colors.red : Colors.orange,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // LOCATION
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 6),
                            Expanded(child: Text(r['location']!)),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // PEOPLE + WATER
                        Row(
                          children: [
                            const Icon(
                              Icons.groups,
                              color: AppColors.textSecondary,
                            ),
                            const SizedBox(width: 6),
                            Text('${r['people']} people'),
                            const SizedBox(width: 20),
                            const Icon(
                              Icons.water_drop,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 6),
                            Text(r['water']!),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // AI PRIORITY BOX
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: high
                                ? Colors.red.withOpacity(0.06)
                                : Colors.orange.withOpacity(0.06),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.psychology,
                                color: high ? Colors.red : Colors.orange,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  high
                                      ? 'AI recommends immediate rescue'
                                      : 'Monitor and respond within 30 minutes',
                                  style: TextStyle(
                                    color: high ? Colors.red : Colors.orange,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 18),

                        // ACTION BUTTONS
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                icon: const Icon(Icons.call),
                                label: const Text('Call'),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Calling ${r['name']}...'),
                                    ),
                                  );
                                },
                              ),
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              flex: 2,
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.navigation),
                                label: const Text('Accept Mission'),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => RescueMissionScreen(
                                        citizenName: r['name']!,
                                        location: r['location']!,
                                      ),
                                    ),
                                  );
                                },
                              ),
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
}
