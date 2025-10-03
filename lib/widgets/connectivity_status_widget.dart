import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/connectivity_controller.dart';

class ConnectivityStatusWidget extends StatelessWidget {
  const ConnectivityStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final connectivityController = Get.find<ConnectivityController>();
      return Container(
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark 
              ? Colors.black.withValues(alpha: 0.3)
              : Colors.white.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          connectivityController.getConnectionIcon(),
          color: connectivityController.getConnectionColor(context),
          size: 18,
        ),
      );
    });
  }
}