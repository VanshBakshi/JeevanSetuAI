import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false;
  bool offlineMode = true;
  bool smsMode = true;
  bool locationSharing = true;
  bool notifications = true;

  String language = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          // ================= PROFILE HEADER =================
          Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.primary,
                child: Icon(Icons.person, color: Colors.white, size: 30),
              ),
              title: const Text(
                'Vansh Bakshi',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              subtitle: const Text('Ward 5, Patna, Bihar'),
              trailing: IconButton(
                icon: const Icon(Icons.edit, color: AppColors.primary),
                onPressed: () {},
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ================= APP SETTINGS =================
          _sectionTitle('App Settings'),

          Card(
            child: Column(
              children: [
                SwitchListTile(
                  value: darkMode,
                  activeThumbColor: AppColors.primary,
                  title: const Text('Dark Mode'),
                  subtitle: const Text('Enable dark theme'),
                  secondary: const Icon(Icons.dark_mode),
                  onChanged: (v) {
                    setState(() => darkMode = v);
                  },
                ),

                const Divider(height: 1),

                SwitchListTile(
                  value: notifications,
                  activeThumbColor: AppColors.primary,
                  title: const Text('Alert Notifications'),
                  subtitle: const Text('Receive flood and rescue alerts'),
                  secondary: const Icon(Icons.notifications),
                  onChanged: (v) {
                    setState(() => notifications = v);
                  },
                ),

                const Divider(height: 1),

                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text('Language'),
                  subtitle: Text(language),
                  trailing: DropdownButton<String>(
                    value: language,
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(
                        value: 'English',
                        child: Text('English'),
                      ),
                      DropdownMenuItem(value: 'Hindi', child: Text('Hindi')),
                    ],
                    onChanged: (v) {
                      if (v != null) {
                        setState(() => language = v);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ================= EMERGENCY SETTINGS =================
          _sectionTitle('Emergency Settings'),

          Card(
            child: Column(
              children: [
                SwitchListTile(
                  value: offlineMode,
                  activeThumbColor: AppColors.primary,
                  title: const Text('Offline Mode'),
                  subtitle: const Text('Save data for no-internet areas'),
                  secondary: const Icon(Icons.offline_bolt),
                  onChanged: (v) {
                    setState(() => offlineMode = v);
                  },
                ),

                const Divider(height: 1),

                SwitchListTile(
                  value: smsMode,
                  activeThumbColor: AppColors.primary,
                  title: const Text('SMS Emergency Mode'),
                  subtitle: const Text(
                    'Send SOS through SMS if internet fails',
                  ),
                  secondary: const Icon(Icons.sms),
                  onChanged: (v) {
                    setState(() => smsMode = v);
                  },
                ),

                const Divider(height: 1),

                SwitchListTile(
                  value: locationSharing,
                  activeThumbColor: AppColors.primary,
                  title: const Text('Location Sharing'),
                  subtitle: const Text(
                    'Share live location during emergencies',
                  ),
                  secondary: const Icon(Icons.location_on),
                  onChanged: (v) {
                    setState(() => locationSharing = v);
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ================= EMERGENCY CONTACTS =================
          _sectionTitle('Emergency Contacts'),

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person, color: AppColors.primary),
                  title: const Text('Gargi'),
                  subtitle: const Text('+91 98XXXXXX45'),
                  trailing: IconButton(
                    icon: const Icon(Icons.call, color: AppColors.primary),
                    onPressed: () {},
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.person, color: AppColors.primary),
                  title: const Text('Family Contact'),
                  subtitle: const Text('+91 97XXXXXX10'),
                  trailing: IconButton(
                    icon: const Icon(Icons.call, color: AppColors.primary),
                    onPressed: () {},
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(
                    Icons.add_circle_outline,
                    color: AppColors.primary,
                  ),
                  title: const Text('Add Contact'),
                  onTap: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ================= SUPPORT & LEGAL =================
          _sectionTitle('Support & Legal'),

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.privacy_tip_outlined),
                  title: const Text('Privacy Policy'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.description_outlined),
                  title: const Text('Terms & Conditions'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.help_outline),
                  title: const Text('Help & Support'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('About JeevanSetu AI'),
                  subtitle: const Text('Version 1.0.0'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ================= EMERGENCY RESET =================
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.warning.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  color: AppColors.warning,
                  size: 40,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Emergency Reset',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Reset all emergency preferences and clear cached offline data.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textSecondary, height: 1.4),
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  icon: const Icon(Icons.restart_alt),
                  label: const Text('Reset Settings'),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // ================= LOGOUT =================
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  title: const Text('Logout'),
                  content: const Text(
                    'Are you sure you want to logout from JeevanSetu AI?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.danger,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Logged out successfully'),
                          ),
                        );
                      },
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 17,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
