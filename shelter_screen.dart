import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class ShelterScreen extends StatelessWidget {
  const ShelterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Shelters & Safe Routes',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      // ================= BODY =================
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            // Search box
            TextField(
              decoration: InputDecoration(
                hintText: 'Search shelter or location',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 18),

            // ================= MAP PLACEHOLDER =================
            Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.10),
                    AppColors.primary.withValues(alpha: 0.20),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  const Center(
                    child: Icon(Icons.map, size: 120, color: AppColors.primary),
                  ),
                  Positioned(top: 50, left: 70, child: _pin(Colors.green)),
                  Positioned(
                    bottom: 40,
                    right: 80,
                    child: _pin(AppColors.danger),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // ================= SECTION TITLE =================
            const Text(
              'Nearby Shelters',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),

            const SizedBox(height: 16),

            // Shelter cards
            _shelterTile(
              name: 'Govt School Ward 5',
              distance: '1.2 km',
              capacity: '120 / 200',
              available: true,
            ),

            _shelterTile(
              name: 'Community Hall Sector 3',
              distance: '2.5 km',
              capacity: '180 / 180',
              available: false,
            ),

            _shelterTile(
              name: 'Relief Camp Patna High School',
              distance: '3.1 km',
              capacity: '95 / 250',
              available: true,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ===========================================================
  // SHELTER TILE
  // ===========================================================

  Widget _shelterTile({
    required String name,
    required String distance,
    required String capacity,
    required bool available,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 12),

            // Distance
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: AppColors.primary,
                  size: 18,
                ),
                const SizedBox(width: 6),
                Text(
                  distance,
                  style: const TextStyle(color: AppColors.textSecondary),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Capacity
            Row(
              children: [
                const Icon(Icons.groups, color: AppColors.primary, size: 18),
                const SizedBox(width: 6),
                Text(
                  'Capacity: $capacity',
                  style: const TextStyle(color: AppColors.textSecondary),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Status badge only
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: available
                      ? AppColors.success.withValues(alpha: 0.12)
                      : AppColors.danger.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  available ? 'Available' : 'Full',
                  style: TextStyle(
                    color: available ? AppColors.success : AppColors.danger,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===========================================================
  // MAP PIN
  // ===========================================================

  static Widget _pin(Color color) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.35),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
    );
  }
}
