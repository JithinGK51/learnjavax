import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  
  final RxBool _isConnected = false.obs;
  final RxBool _isChecking = false.obs;
  final RxString _connectionType = 'none'.obs;
  
  bool get isConnected => _isConnected.value;
  bool get isChecking => _isChecking.value;
  String get connectionType => _connectionType.value;

  @override
  void onInit() {
    super.onInit();
    _initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }

  Future<void> _initConnectivity() async {
    _isChecking.value = true;
    
    try {
      final List<ConnectivityResult> results = await _connectivity.checkConnectivity();
      await _updateConnectionStatus(results);
    } catch (e) {
      debugPrint('Failed to get connectivity: $e');
      _isConnected.value = false;
      _connectionType.value = 'none';
    } finally {
      _isChecking.value = false;
    }
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    _isChecking.value = true;
    
    // Check if any of the results indicate connectivity
    bool hasConnection = results.any((result) => 
      result == ConnectivityResult.mobile || 
      result == ConnectivityResult.wifi ||
      result == ConnectivityResult.ethernet
    );
    
    if (hasConnection) {
      // Double-check with actual internet connectivity
      final bool actualConnection = await _checkInternetConnection();
      _isConnected.value = actualConnection;
      
      if (actualConnection) {
        if (results.contains(ConnectivityResult.wifi)) {
          _connectionType.value = 'wifi';
        } else if (results.contains(ConnectivityResult.mobile)) {
          _connectionType.value = 'mobile';
        } else if (results.contains(ConnectivityResult.ethernet)) {
          _connectionType.value = 'ethernet';
        }
      } else {
        _connectionType.value = 'none';
      }
    } else {
      _isConnected.value = false;
      _connectionType.value = 'none';
    }
    
    _isChecking.value = false;
    debugPrint('Connection status updated: ${_isConnected.value} (${_connectionType.value})');
  }

  Future<bool> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com').timeout(
        const Duration(seconds: 5),
      );
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      debugPrint('Internet connection check failed: $e');
      return false;
    }
  }

  Future<void> retryConnection() async {
    _isChecking.value = true;
    
    // Add a small delay for better UX
    await Future.delayed(const Duration(milliseconds: 500));
    
    try {
      final List<ConnectivityResult> results = await _connectivity.checkConnectivity();
      await _updateConnectionStatus(results);
      
      if (_isConnected.value) {
        Get.snackbar(
          'Connected!',
          'Internet connection restored',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Get.context != null && Theme.of(Get.context!).brightness == Brightness.dark 
              ? Colors.green.shade700 
              : Colors.green.shade600,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.all(16),
          borderRadius: 8,
        );
      }
    } catch (e) {
      debugPrint('Retry connection failed: $e');
      _isConnected.value = false;
      _connectionType.value = 'none';
      
      Get.snackbar(
        'Connection Failed',
        'Unable to connect to the internet',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Get.context != null && Theme.of(Get.context!).brightness == Brightness.dark 
            ? Colors.red.shade700 
            : Colors.red.shade600,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
      );
    } finally {
      _isChecking.value = false;
    }
  }

  IconData getConnectionIcon() {
    switch (_connectionType.value) {
      case 'wifi':
        return Icons.wifi;
      case 'mobile':
        return Icons.signal_cellular_4_bar;
      case 'ethernet':
        return Icons.lan;  // Use lan icon instead of ethernet
      default:
        return Icons.wifi_off;
    }
  }

  Color getConnectionColor([BuildContext? context]) {
    if (context != null) {
      // Theme-aware colors
      if (_isConnected.value) {
        return Theme.of(context).brightness == Brightness.dark 
            ? Colors.green.shade400 
            : Colors.green.shade600;
      } else {
        return Theme.of(context).brightness == Brightness.dark 
            ? Colors.red.shade400 
            : Colors.red.shade600;
      }
    }
    // Fallback to default colors
    return _isConnected.value ? Colors.green : Colors.red;
  }

  String getConnectionMessage() {
    if (_isChecking.value) {
      return 'Checking connection...';
    }
    
    if (_isConnected.value) {
      switch (_connectionType.value) {
        case 'wifi':
          return 'Connected via WiFi';
        case 'mobile':
          return 'Connected via Mobile Data';
        case 'ethernet':
          return 'Connected via Ethernet';
        default:
          return 'Connected to Internet';
      }
    } else {
      return 'No Internet Connection';
    }
  }
}
