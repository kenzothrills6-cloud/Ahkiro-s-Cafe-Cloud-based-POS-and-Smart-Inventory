import 'package:flutter/material.dart';

import 'settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Business Profile Section
              _buildSectionHeader(context, 'Business Profile'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.business),
                        title: const Text('Business Name'),
                        subtitle: const Text('Akhiro Cafe'),
                        trailing: const Icon(Icons.edit),
                        onTap: () {
                          // TODO: Edit business name
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Edit business name functionality')),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.location_on),
                        title: const Text('Address'),
                        subtitle: const Text('123 Coffee Street, Bean City'),
                        trailing: const Icon(Icons.edit),
                        onTap: () {
                          // TODO: Edit address
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Edit address functionality')),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.phone),
                        title: const Text('Phone'),
                        subtitle: const Text('+1 (555) 123-4567'),
                        trailing: const Icon(Icons.edit),
                        onTap: () {
                          // TODO: Edit phone
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Edit phone functionality')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Theme Settings Section
              _buildSectionHeader(context, 'Appearance'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.palette),
                        title: const Text('Theme Mode'),
                        subtitle: DropdownButton<ThemeMode>(
                          value: controller.themeMode,
                          onChanged: controller.updateThemeMode,
                          items: const [
                            DropdownMenuItem(
                              value: ThemeMode.system,
                              child: Text('System Theme'),
                            ),
                            DropdownMenuItem(
                              value: ThemeMode.light,
                              child: Text('Light Theme'),
                            ),
                            DropdownMenuItem(
                              value: ThemeMode.dark,
                              child: Text('Dark Theme'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // POS Settings Section
              _buildSectionHeader(context, 'POS Settings'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SwitchListTile(
                        secondary: const Icon(Icons.receipt),
                        title: const Text('Auto Print Receipts'),
                        subtitle: const Text('Automatically print receipts after checkout'),
                        value: true, // TODO: Connect to actual setting
                        onChanged: (value) {
                          // TODO: Toggle auto print
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Auto print ${value ? 'enabled' : 'disabled'}')),
                          );
                        },
                      ),
                      SwitchListTile(
                        secondary: const Icon(Icons.notifications),
                        title: const Text('Low Stock Alerts'),
                        subtitle: const Text('Get notified when items are running low'),
                        value: true, // TODO: Connect to actual setting
                        onChanged: (value) {
                          // TODO: Toggle notifications
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Low stock alerts ${value ? 'enabled' : 'disabled'}')),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.percent),
                        title: const Text('Tax Rate'),
                        subtitle: const Text('10%'),
                        trailing: const Icon(Icons.edit),
                        onTap: () {
                          // TODO: Edit tax rate
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Edit tax rate functionality')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Data Management Section
              _buildSectionHeader(context, 'Data Management'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.cloud_sync),
                        title: const Text('Sync Data'),
                        subtitle: const Text('Last synced: Never'),
                        trailing: const Icon(Icons.sync),
                        onTap: () {
                          // TODO: Sync data
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Data synced successfully!')),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.file_download),
                        title: const Text('Export Data'),
                        subtitle: const Text('Export sales and inventory data'),
                        trailing: const Icon(Icons.download),
                        onTap: () {
                          // TODO: Export data
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Data exported successfully!')),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.backup),
                        title: const Text('Backup Data'),
                        subtitle: const Text('Create a backup of your data'),
                        trailing: const Icon(Icons.backup),
                        onTap: () {
                          // TODO: Backup data
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Backup created successfully!')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Account Section
              _buildSectionHeader(context, 'Account'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: const Text('Profile'),
                        subtitle: const Text('Manage your account settings'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // TODO: Navigate to profile
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Profile settings functionality')),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.lock),
                        title: const Text('Change Password'),
                        subtitle: const Text('Update your password'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // TODO: Change password
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Change password functionality')),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.logout, color: Colors.red),
                        title: const Text('Logout', style: TextStyle(color: Colors.red)),
                        subtitle: const Text('Sign out of your account'),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Logout'),
                                content: const Text('Are you sure you want to logout?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: const Text('Cancel'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.pushReplacementNamed(context, '/login');
                                    },
                                    child: const Text('Logout'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // About Section
              _buildSectionHeader(context, 'About'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.info),
                        title: const Text('Version'),
                        subtitle: const Text('1.0.0'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.help),
                        title: const Text('Help & Support'),
                        subtitle: const Text('Get help with using the app'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // TODO: Show help
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Help & support functionality')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
