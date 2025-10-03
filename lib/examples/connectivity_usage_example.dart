// Example of how to use the connectivity system in different parts of the app

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/connectivity_controller.dart';
import '../widgets/connectivity_status_widget.dart';

// Example 1: Simple connectivity-aware screen
class ConnectivityAwareScreen extends StatelessWidget {
  const ConnectivityAwareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connectivity Example'),
        actions: [
          // Show connectivity status in app bar
          const ConnectivityStatusWidget(iconSize: 20),
        ],
      ),
      body: ConnectivityListener(
        showBanner: true, // Show banner when offline
        showFloatingIndicator: false,
        child: Column(
          children: [
            // Content that requires internet
            Expanded(
              child: Obx(() {
                final connectivityController = Get.find<ConnectivityController>();
                
                if (!connectivityController.isConnected) {
                  return const Center(
                    child: Text('This content requires internet connection'),
                  );
                }
                
                return const Center(
                  child: Text('Online content loaded successfully!'),
                );
              }),
            ),
            
            // Always show connectivity status
            const Padding(
              padding: EdgeInsets.all(16),
              child: ConnectivityStatusWidget(
                showText: true,
                iconSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Example 2: Custom connectivity handling
class CustomConnectivityHandling extends StatelessWidget {
  const CustomConnectivityHandling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Handling')),
      body: Obx(() {
        final connectivityController = Get.find<ConnectivityController>();
        
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Connection status card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Connection Status',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            connectivityController.getConnectionIcon(),
                            color: connectivityController.getConnectionColor(),
                          ),
                          const SizedBox(width: 8),
                          Text(connectivityController.getConnectionMessage()),
                        ],
                      ),
                      if (!connectivityController.isConnected) ...[
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: connectivityController.isChecking
                              ? null
                              : () => connectivityController.retryConnection(),
                          child: connectivityController.isChecking
                              ? const Text('Checking...')
                              : const Text('Retry Connection'),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Connection type details
              if (connectivityController.isConnected) ...[
                Text(
                  'Connection Details:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text('Type: ${connectivityController.connectionType}'),
                Text('Status: Connected'),
              ],
              
              const SizedBox(height: 20),
              
              // Manual connectivity actions
              Wrap(
                spacing: 8,
                children: [
                  ElevatedButton(
                    onPressed: () => connectivityController.retryConnection(),
                    child: const Text('Check Connection'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Example of showing connection info
                      Get.snackbar(
                        'Connection Info',
                        connectivityController.getConnectionMessage(),
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    child: const Text('Show Info'),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}

// Example 3: Connectivity-dependent data loading
class ConnectivityDataExample extends StatefulWidget {
  const ConnectivityDataExample({super.key});

  @override
  State<ConnectivityDataExample> createState() => _ConnectivityDataExampleState();
}

class _ConnectivityDataExampleState extends State<ConnectivityDataExample> {
  bool isLoading = false;
  String? data;
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Loading Example')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const ConnectivityStatusWidget(
              showText: true,
              iconSize: 20,
            ),
            
            const SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: _loadData,
              child: isLoading 
                  ? const CircularProgressIndicator()
                  : const Text('Load Data'),
            ),
            
            const SizedBox(height: 20),
            
            if (error != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red.shade200),
                ),
                child: Text(
                  error!,
                  style: TextStyle(color: Colors.red.shade700),
                ),
              ),
            
            if (data != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Text(
                  data!,
                  style: TextStyle(color: Colors.green.shade700),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _loadData() async {
    final connectivityController = Get.find<ConnectivityController>();
    
    if (!connectivityController.isConnected) {
      setState(() {
        error = 'No internet connection. Please check your network.';
        data = null;
      });
      return;
    }
    
    setState(() {
      isLoading = true;
      error = null;
      data = null;
    });
    
    try {
      // Simulate network request
      await Future.delayed(const Duration(seconds: 2));
      
      // Check connection again after delay
      if (!connectivityController.isConnected) {
        throw Exception('Connection lost during data loading');
      }
      
      setState(() {
        data = 'Data loaded successfully at ${DateTime.now()}';
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = 'Failed to load data: $e';
        isLoading = false;
      });
    }
  }
}

// Example 4: How to listen to connectivity changes
class ConnectivityListenerExample extends StatefulWidget {
  const ConnectivityListenerExample({super.key});

  @override
  State<ConnectivityListenerExample> createState() => _ConnectivityListenerExampleState();
}

class _ConnectivityListenerExampleState extends State<ConnectivityListenerExample> {
  final List<String> connectionLog = [];

  @override
  void initState() {
    super.initState();
    _setupConnectivityListener();
  }

  void _setupConnectivityListener() {
    final connectivityController = Get.find<ConnectivityController>();
    
    // Listen to connectivity changes using ever
    ever(connectivityController.isConnected.obs, (bool isConnected) {
      setState(() {
        connectionLog.add(
          '${DateTime.now().toString().substring(11, 19)}: '
          '${isConnected ? 'Connected' : 'Disconnected'} '
          '(${connectivityController.connectionType})',
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connection Log')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: ConnectivityStatusWidget(
              showText: true,
              iconSize: 24,
            ),
          ),
          
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: connectionLog.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(
                      connectionLog[index].contains('Connected')
                          ? Icons.wifi
                          : Icons.wifi_off,
                      color: connectionLog[index].contains('Connected')
                          ? Colors.green
                          : Colors.red,
                    ),
                    title: Text(connectionLog[index]),
                  ),
                );
              },
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  connectionLog.clear();
                });
              },
              child: const Text('Clear Log'),
            ),
          ),
        ],
      ),
    );
  }
}
