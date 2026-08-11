import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class LiveMapScreen extends StatefulWidget {
  const LiveMapScreen({super.key});

  @override
  State<LiveMapScreen> createState() => _LiveMapScreenState();
}

class _LiveMapScreenState extends State<LiveMapScreen> {
  String selectedLayer = 'Flood';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Live Flood Map',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),

      body: Column(
        children: [
          // ================= SEARCH BAR =================
          Padding(
            padding: const EdgeInsets.all(18),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search location',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // ================= MAP LAYERS =================
          SizedBox(
            height: 44,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              children: [
                _layerChip('Flood'),
                _layerChip('Shelters'),
                _layerChip('Rescue'),
                _layerChip('Safe'),
                _layerChip('Weather'),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ================= MAP AREA =================
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade50, Colors.blue.shade100],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    // Decorative roads
                    Positioned(left: 40, top: 60, child: _road(140, true)),
                    Positioned(right: 50, top: 110, child: _road(120, false)),
                    Positioned(left: 80, bottom: 100, child: _road(160, false)),

                    // Flood zone
                    Positioned(left: 60, top: 90, child: _floodZone()),

                    // Safe zone
                    Positioned(right: 60, bottom: 120, child: _safeZone()),

                    // Shelter marker
                    Positioned(
                      left: 40,
                      bottom: 140,
                      child: _marker(
                        color: AppColors.success,
                        icon: Icons.home_work,
                        label: 'Shelter',
                      ),
                    ),

                    // Rescue team marker
                    Positioned(
                      right: 70,
                      top: 70,
                      child: _marker(
                        color: AppColors.warning,
                        icon: Icons.directions_boat,
                        label: 'Rescue',
                      ),
                    ),

                    // User location marker
                    Positioned(
                      left: 150,
                      top: 200,
                      child: _marker(
                        color: AppColors.primary,
                        icon: Icons.person_pin_circle,
                        label: 'You',
                      ),
                    ),

                    // Water level marker
                    Positioned(
                      left: 190,
                      bottom: 90,
                      child: _marker(
                        color: AppColors.danger,
                        icon: Icons.water_drop,
                        label: '4.2 ft',
                      ),
                    ),

                    // Compass
                    Positioned(
                      top: 14,
                      right: 14,
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.explore,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 18),

          // ================= LIVE STATUS =================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.timeline, color: AppColors.primary),
                      SizedBox(width: 8),
                      Text(
                        'Live Status',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  _StatusRow(
                    title: 'Flood severity',
                    value: 'High',
                    color: AppColors.danger,
                  ),
                  SizedBox(height: 10),
                  _StatusRow(
                    title: 'Nearest shelter',
                    value: '1.2 km',
                    color: AppColors.success,
                  ),
                  SizedBox(height: 10),
                  _StatusRow(
                    title: 'Rescue ETA',
                    value: '18 min',
                    color: AppColors.warning,
                  ),
                  SizedBox(height: 10),
                  _StatusRow(
                    title: 'Road condition',
                    value: 'Partially blocked',
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 18),

          // ================= ACTION BUTTONS =================
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 22),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download),
                    label: const Text('Offline Map'),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.navigation),
                    label: const Text('Safe Route'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= LAYER CHIP =================
  Widget _layerChip(String label) {
    final selected = selectedLayer == label;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) {
          setState(() => selectedLayer = label);
        },
        selectedColor: AppColors.primary,
        labelStyle: TextStyle(
          color: selected ? Colors.white : AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ================= ROAD =================
  Widget _road(double width, bool horizontal) {
    return Transform.rotate(
      angle: horizontal ? 0 : 0.4,
      child: Container(
        width: width,
        height: 10,
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  // ================= FLOOD ZONE =================
  Widget _floodZone() {
    return Container(
      width: 130,
      height: 110,
      decoration: BoxDecoration(
        color: AppColors.danger.withValues(alpha: 0.28),
        borderRadius: BorderRadius.circular(28),
      ),
      child: const Center(
        child: Text(
          'Flood Zone',
          style: TextStyle(
            color: AppColors.danger,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  // ================= SAFE ZONE =================
  Widget _safeZone() {
    return Container(
      width: 120,
      height: 90,
      decoration: BoxDecoration(
        color: AppColors.success.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Center(
        child: Text(
          'Safe Zone',
          style: TextStyle(
            color: AppColors.success,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  // ================= MAP MARKER =================
  Widget _marker({
    required Color color,
    required IconData icon,
    required String label,
  }) {
    return Column(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.35),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

// ================= STATUS ROW =================
class _StatusRow extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _StatusRow({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            value,
            style: TextStyle(color: color, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
