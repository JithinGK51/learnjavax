import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../services/ads_service.dart';
import 'coupon_controller.dart';

class AdsController extends GetxController {
  final AdsService _adsService = AdsService();

  final RxBool _isBannerAdLoaded = false.obs;
  final RxBool _isInterstitialAdLoaded = false.obs;
  final RxBool _isRewardedAdLoaded = false.obs;
  final RxBool _adsEnabled = true.obs;

  bool get isBannerAdLoaded => _isBannerAdLoaded.value;
  bool get isInterstitialAdLoaded => _isInterstitialAdLoaded.value;
  bool get isRewardedAdLoaded => _isRewardedAdLoaded.value;
  bool get adsEnabled => _adsEnabled.value;

  @override
  void onInit() {
    super.onInit();
    _loadAds();
  }

  Future<void> _loadAds() async {
    if (!_adsEnabled.value) return;

    // Check if user has ad-free access
    try {
      final couponController = Get.find<CouponController>();
      if (couponController.isAdFree) {
        debugPrint('User has ad-free access, skipping ad loading');
        return;
      }
    } catch (e) {
      // CouponController not available, continue with ad loading
    }

    try {
      await _adsService.loadBannerAd();
      _isBannerAdLoaded.value = true;

      await _adsService.loadInterstitialAd();
      _isInterstitialAdLoaded.value = true;

      await _adsService.loadRewardedAd();
      _isRewardedAdLoaded.value = true;
    } catch (e) {
      debugPrint('Ad loading error: $e');
    }
  }

  Widget getBannerAd() {
    if (!_adsEnabled.value || !_isBannerAdLoaded.value) {
      return const SizedBox.shrink();
    }

    // Check if user has ad-free access
    try {
      final couponController = Get.find<CouponController>();
      if (couponController.isAdFree) {
        return const SizedBox.shrink();
      }
    } catch (e) {
      // CouponController not available, continue with ad display
    }

    return _adsService.getBannerAd();
  }

  Future<void> showInterstitialAd() async {
    if (!_adsEnabled.value || !_isInterstitialAdLoaded.value) return;

    // Check if user has ad-free access
    try {
      final couponController = Get.find<CouponController>();
      if (couponController.isAdFree) {
        debugPrint('User has ad-free access, skipping interstitial ad');
        return;
      }
    } catch (e) {
      // CouponController not available, continue with ad display
    }

    try {
      await _adsService.showInterstitialAd();
      _isInterstitialAdLoaded.value = false;

      // Load next interstitial ad
      await _adsService.loadInterstitialAd();
      _isInterstitialAdLoaded.value = true;
    } catch (e) {
      debugPrint('Interstitial ad error: $e');
    }
  }

  Future<void> showRewardedAd() async {
    if (!_adsEnabled.value || !_isRewardedAdLoaded.value) return;

    try {
      final reward = await _adsService.showRewardedAd();
      if (reward != null) {
        _isRewardedAdLoaded.value = false;

        // Load next rewarded ad
        await _adsService.loadRewardedAd();
        _isRewardedAdLoaded.value = true;

        // Handle reward
        _handleReward(reward);
      }
    } catch (e) {
      debugPrint('Rewarded ad error: $e');
    }
  }

  void _handleReward(RewardItem reward) {
    // Handle the reward (e.g., unlock bonus content)
    Get.snackbar(
      'Reward Earned!',
      'You earned ${reward.amount} ${reward.type}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void setAdsEnabled(bool enabled) {
    _adsEnabled.value = enabled;
    if (!enabled) {
      _isBannerAdLoaded.value = false;
      _isInterstitialAdLoaded.value = false;
      _isRewardedAdLoaded.value = false;
    } else {
      _loadAds();
    }
  }

  Future<void> refreshAds() async {
    await _loadAds();
  }

  @override
  void onClose() {
    _adsService.dispose();
    super.onClose();
  }
}
