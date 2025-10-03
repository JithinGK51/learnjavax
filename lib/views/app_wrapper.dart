import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/connectivity_controller.dart';
import '../controllers/app_controller.dart';
import 'loading_screen.dart';
import 'error_screen.dart';
import 'splash_screen.dart';
import 'home_screen.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> with TickerProviderStateMixin {
  late AnimationController _transitionController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _setupConnectivityListener();
  }

  void _initializeAnimations() {
    _transitionController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _transitionController,
        curve: Curves.easeOutCubic,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _transitionController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _setupConnectivityListener() {
    // Animation will be handled in the build method with Obx
  }

  @override
  void dispose() {
    _transitionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final connectivityController = Get.find<ConnectivityController>();
        final appController = Get.find<AppController>();
        
        // Update animation based on connectivity
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (connectivityController.isConnected) {
            _transitionController.forward();
          } else {
            _transitionController.reverse();
          }
        });
        
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.1),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          child: _buildCurrentScreen(connectivityController, appController),
        );
      }),
    );
  }

  Widget _buildCurrentScreen(
    ConnectivityController connectivityController,
    AppController appController,
  ) {
    // Show loading screen while checking connectivity
    if (connectivityController.isChecking && !connectivityController.isConnected) {
      return const LoadingScreen(key: ValueKey('loading'));
    }

    // Show error screen if no internet connection
    if (!connectivityController.isConnected) {
      return const ErrorScreen(key: ValueKey('error'));
    }

    // Show loading screen while app is initializing
    if (!appController.isInitialized) {
      return const LoadingScreen(key: ValueKey('app_loading'));
    }

    // Show main app content
    return _buildMainAppContent();
  }

  Widget _buildMainAppContent() {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: const AppNavigator(key: ValueKey('main_app')),
          ),
        );
      },
    );
  }
}

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    _startSplashTimer();
  }

  void _startSplashTimer() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showSplash = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.05),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: _showSplash
          ? const SplashScreen(key: ValueKey('splash'))
          : const HomeScreen(key: ValueKey('home')),
    );
  }
}

