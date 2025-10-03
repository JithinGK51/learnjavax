import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ads_controller.dart';

class BannerAdWidget extends StatelessWidget {
  const BannerAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      final adsController = Get.find<AdsController>();

      return Obx(() {
        if (!adsController.adsEnabled) {
          return const SizedBox.shrink();
        }

        if (!adsController.isBannerAdLoaded) {
          return const SizedBox.shrink();
        }

        return Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: adsController.getBannerAd(),
          ),
        );
      });
    } catch (e) {
      // If ads controller is not available, return empty widget
      return const SizedBox.shrink();
    }
  }
}
