import 'package:flutter/material.dart';
import '../screens/pos_screen.dart';
import '../screens/inventory_screen.dart';
import '../screens/orders_screen.dart';
import '../screens/dashboard_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const routeName = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const PosScreen(),
    const InventoryScreen(),
    const OrdersScreen(),
  ];

  final List<NavigationDestination> _destinations = [
    const NavigationDestination(
      icon: Icon(Icons.dashboard),
      label: 'Dashboard',
    ),
    const NavigationDestination(
      icon: Icon(Icons.point_of_sale),
      label: 'POS',
    ),
    const NavigationDestination(
      icon: Icon(Icons.inventory),
      label: 'Inventory',
    ),
    const NavigationDestination(
      icon: Icon(Icons.receipt),
      label: 'Orders',
    ),
  ];

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showSettingsScreen() {
    Navigator.pushNamed(context, '/settings');
  }

  void _showLogoutDialog() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Navigation Rail for landscape mode
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
            leading: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Icon(
                    Icons.local_cafe,
                    size: 32,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Akhiro\nCafe',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            trailing: Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: _showSettingsScreen,
                        icon: const Icon(Icons.settings),
                        tooltip: 'Settings',
                      ),
                      const SizedBox(height: 8),
                      IconButton(
                        onPressed: _showLogoutDialog,
                        icon: const Icon(Icons.logout),
                        tooltip: 'Logout',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            destinations: _destinations.map((destination) {
              return NavigationRailDestination(
                icon: destination.icon,
                label: Text(destination.label),
              );
            }).toList(),
          ),
          
          // Divider
          const VerticalDivider(thickness: 1, width: 1),
          
          // Main content area
          Expanded(
            child: _screens[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
