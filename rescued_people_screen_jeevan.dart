import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RescuedPeopleScreen extends StatelessWidget {
  const RescuedPeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rescued = [
      {'name': 'Ravi Kumar', 'members': '4', 'shelter': 'Govt School'},
      {'name': 'Neha Singh', 'members': '2', 'shelter': 'Community Hall'},
      {'name': 'Aman Verma', 'members': '6', 'shelter': 'Govt School'},
      {'name': 'Priya Sharma', 'members': '3', 'shelter': 'Relief Camp A'},
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Rescued People')),
      body: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: rescued.length,
        itemBuilder: (context, index) {
          final p = rescued[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 14),
            child: ListTile(
              contentPadding: const EdgeInsets.all(18),
              leading: const CircleAvatar(
                backgroundColor: AppColors.success,
                child: Icon(Icons.check, color: Colors.white),
              ),
              title: Text(
                p['name']!,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Family Members: ${p['members']}'),
                  Text('Shelter: ${p['shelter']}'),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.call, color: AppColors.primary),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
