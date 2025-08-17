import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/order.dart';
import '../models/product.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = Order.getMockOrders();
    final products = Product.getMockProducts();

    // Calculate metrics
    final todaySales = orders.fold<double>(0, (sum, order) => sum + order.total);
    final totalOrders = orders.length;
    final totalItems = orders.fold<int>(0, (sum, order) => sum + order.totalItems);
    final averageOrderValue = totalOrders > 0 ? todaySales / totalOrders : 0.0;

    // Top selling products (mock data)
    final topProducts = products.take(4).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Refresh data
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Data refreshed!')),
              );
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome section
            Text(
              'Welcome back!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Here\'s what\'s happening in your cafe today',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),

            // Metrics cards
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: _buildMetricCard(
                      context,
                      'Today\'s Sales',
                      'Php ${todaySales.toStringAsFixed(2)}',
                      Icons.attach_money,
                      Colors.green,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildMetricCard(
                      context,
                      'Total Orders',
                      totalOrders.toString(),
                      Icons.receipt,
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildMetricCard(
                      context,
                      'Items Sold',
                      totalItems.toString(),
                      Icons.shopping_cart,
                      Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildMetricCard(
                      context,
                      'Average Order',
                      'Php ${averageOrderValue.toStringAsFixed(2)}',
                      Icons.trending_up,
                      Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Charts and top products
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  // Sales chart
                  Expanded(
                    flex: 2,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sales Overview',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Expanded(
                              child: LineChart(
                                _buildSalesChart(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Top products
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Top Products',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Expanded(
                              child: ListView.builder(
                                itemCount: topProducts.length,
                                itemBuilder: (context, index) {
                                  final product = topProducts[index];
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Theme.of(context).primaryColor,
                                      child: Text(
                                        '${index + 1}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    title: Text(product.name),
                                    subtitle: Text(product.category),
                                    trailing: Text(
                                      'Php ${product.price.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  LineChartData _buildSalesChart() {
    // Mock data for the chart
    return LineChartData(
      gridData: const FlGridData(show: true),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
              if (value.toInt() >= 0 && value.toInt() < days.length) {
                return Text(days[value.toInt()]);
              }
              return const Text('');
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return Text('Php ${value.toInt()}');
            },
          ),
        ),
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: FlBorderData(show: true),
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 120),
            FlSpot(1, 150),
            FlSpot(2, 180),
            FlSpot(3, 140),
            FlSpot(4, 200),
            FlSpot(5, 250),
            FlSpot(6, 180),
          ],
          isCurved: true,
          color: Colors.blue,
          barWidth: 3,
          belowBarData: BarAreaData(
            show: true,
            color: Colors.blue.withOpacity(0.1),
          ),
        ),
      ],
    );
  }
}
