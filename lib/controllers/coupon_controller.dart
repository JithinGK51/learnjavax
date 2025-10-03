import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CouponController extends GetxController {
  final RxBool _isAdFree = false.obs;
  final RxString _couponCode = ''.obs;
  final Rx<DateTime?> _adFreeExpiry = Rx<DateTime?>(null);

  bool get isAdFree => _isAdFree.value;
  String get couponCode => _couponCode.value;
  DateTime? get adFreeExpiry => _adFreeExpiry.value;

  @override
  void onInit() {
    super.onInit();
    _loadCouponStatus();
  }

  Future<void> _loadCouponStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _isAdFree.value = prefs.getBool('is_ad_free') ?? false;
      _couponCode.value = prefs.getString('coupon_code') ?? '';

      final expiryString = prefs.getString('ad_free_expiry');
      if (expiryString != null) {
        _adFreeExpiry.value = DateTime.parse(expiryString);

        // Check if ad-free period has expired
        if (_adFreeExpiry.value!.isBefore(DateTime.now())) {
          await _expireAdFree();
        }
      }
    } catch (e) {
      debugPrint('Error loading coupon status: $e');
    }
  }

  Future<bool> validateCoupon(String code) async {
    // Valid coupon codes (in production, these would be stored on a server)
    final validCoupons = {
      'LEARNJAVA2025': '2 months ad-free access',
      'JAVAMASTER': '2 months ad-free access',
      'CODING2025': '2 months ad-free access',
      'FREECODE': '2 months ad-free access',
    };

    if (validCoupons.containsKey(code.toUpperCase())) {
      await _activateAdFree(code.toUpperCase());
      return true;
    }
    return false;
  }

  Future<void> _activateAdFree(String code) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final expiryDate = DateTime.now().add(
        const Duration(days: 60),
      ); // 2 months

      _isAdFree.value = true;
      _couponCode.value = code;
      _adFreeExpiry.value = expiryDate;

      await prefs.setBool('is_ad_free', true);
      await prefs.setString('coupon_code', code);
      await prefs.setString('ad_free_expiry', expiryDate.toIso8601String());

      Get.snackbar(
        'Coupon Activated!',
        'You now have 2 months of ad-free access!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Get.theme.primaryColor,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      debugPrint('Error activating ad-free: $e');
    }
  }

  Future<void> _expireAdFree() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      _isAdFree.value = false;
      _couponCode.value = '';
      _adFreeExpiry.value = null;

      await prefs.setBool('is_ad_free', false);
      await prefs.remove('coupon_code');
      await prefs.remove('ad_free_expiry');

      Get.snackbar(
        'Ad-Free Period Expired',
        'Your ad-free access has ended. Enter a new coupon code to continue ad-free.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
      );
    } catch (e) {
      debugPrint('Error expiring ad-free: $e');
    }
  }

  String getRemainingDays() {
    if (_adFreeExpiry.value == null) return '0';

    final remaining = _adFreeExpiry.value!.difference(DateTime.now()).inDays;
    return remaining > 0 ? remaining.toString() : '0';
  }

  bool isCouponExpired() {
    if (_adFreeExpiry.value == null) return true;
    return _adFreeExpiry.value!.isBefore(DateTime.now());
  }
}
