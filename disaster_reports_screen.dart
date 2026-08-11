import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class DisasterReportsScreen extends StatefulWidget {
  const DisasterReportsScreen({super.key});

  @override
  State<DisasterReportsScreen> createState() => _DisasterReportsScreenState();
}

class _DisasterReportsScreenState extends State<DisasterReportsScreen> {
  final _formKey = GlobalKey<FormState>();

  String? incidentType = 'Flooded Road';
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  bool shareLocation = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Disaster Report',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= INFO BANNER =================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: AppColors.primary),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Your report helps rescue teams respond faster. Please provide accurate information.',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ================= INCIDENT TYPE =================
              const Text(
                'Incident Type',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),

              const SizedBox(height: 10),

              DropdownButtonFormField<String>(
                initialValue: incidentType,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Flooded Road',
                    child: Text('Flooded Road'),
                  ),
                  DropdownMenuItem(
                    value: 'Stranded People',
                    child: Text('Stranded People'),
                  ),
                  DropdownMenuItem(
                    value: 'Medical Emergency',
                    child: Text('Medical Emergency'),
                  ),
                  DropdownMenuItem(
                    value: 'Power Failure',
                    child: Text('Power Failure'),
                  ),
                  DropdownMenuItem(
                    value: 'Food Shortage',
                    child: Text('Food Shortage'),
                  ),
                ],
                onChanged: (v) {
                  setState(() => incidentType = v);
                },
              ),

              const SizedBox(height: 22),

              // ================= DESCRIPTION =================
              const Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),

              const SizedBox(height: 10),

              TextFormField(
                controller: descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText:
                      'Describe the situation, number of people affected, water level, and any urgent needs.',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 22),

              // ================= LOCATION =================
              const Text(
                'Location',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),

              const SizedBox(height: 10),

              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  hintText: 'Ward 5, Patna, Bihar',
                  prefixIcon: const Icon(Icons.location_on),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 14),

              SwitchListTile(
                value: shareLocation,
                activeThumbColor: AppColors.primary,
                title: const Text('Share current GPS location'),
                subtitle: const Text('Improves rescue response accuracy'),
                onChanged: (v) {
                  setState(() => shareLocation = v);
                },
              ),

              const SizedBox(height: 22),

              // ================= PHOTO UPLOAD =================
              const Text(
                'Photo Evidence',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),

              const SizedBox(height: 12),

              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Image picker can be connected later'),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.camera_alt,
                        size: 48,
                        color: AppColors.primary,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Tap to upload photo',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'JPG or PNG',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ================= PRIORITY =================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.danger.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.priority_high, color: AppColors.danger),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'High priority reports are forwarded immediately to district emergency control room.',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ================= SUBMIT BUTTON =================
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('Submit Report'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _showSuccessDialog(context);
                  }
                },
              ),

              const SizedBox(height: 14),

              OutlinedButton.icon(
                icon: const Icon(Icons.save_alt),
                label: const Text('Save Offline'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Report saved for offline submission'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 36,
              backgroundColor: AppColors.success,
              child: Icon(Icons.check, color: Colors.white, size: 36),
            ),
            const SizedBox(height: 18),
            const Text(
              'Report Submitted',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
            ),
            const SizedBox(height: 10),
            const Text(
              'Emergency control room has received your report.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Reference ID: JS-2026-00421',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 22),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
