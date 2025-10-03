import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../widgets/connectivity_status_widget.dart';

class DeveloperScreen extends StatefulWidget {
  const DeveloperScreen({super.key});

  @override
  State<DeveloperScreen> createState() => _DeveloperScreenState();
}

class _DeveloperScreenState extends State<DeveloperScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _scaleController;
  late AnimationController _rotationController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.easeInOut),
    );

    // Start animations with delays
    _fadeController.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) _slideController.forward();
    });
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) _scaleController.forward();
    });
    _rotationController.repeat();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Developers'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: const [
          ConnectivityStatusWidget(),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: Theme.of(context).brightness == Brightness.dark
                ? [
                    AppColors.primaryPurple,
                    AppColors.primaryPurpleLight,
                    Colors.grey.shade900,
                  ]
                : [
                    AppColors.primaryPurple,
                    AppColors.primaryPurpleLight,
                    Colors.white,
                  ],
            stops: const [0.0, 0.3, 1.0],
          ),
        ),
        child: SafeArea(
          child: AnimatedBuilder(
            animation: _fadeAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeAnimation.value,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Section with Animation
                      SlideTransition(
                        position: _slideAnimation,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: Theme.of(context).brightness == Brightness.dark
                                  ? [
                                      Colors.grey.shade800.withValues(alpha: 0.9),
                                      Colors.grey.shade700.withValues(alpha: 0.7),
                                    ]
                                  : [
                                      Colors.white.withValues(alpha: 0.9),
                                      Colors.white.withValues(alpha: 0.7),
                                    ],
                            ),
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryPurple.withValues(alpha: 0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                               // Animated rotating CRAFZIO logo
                               AnimatedBuilder(
                                 animation: _rotationAnimation,
                                 builder: (context, child) {
                                   return Transform.rotate(
                                     angle: _rotationAnimation.value * 2 * 3.14159,
                                     child: Container(
                                       width: 80,
                                       height: 80,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(40),
                                         boxShadow: [
                                           BoxShadow(
                                             color: AppColors.primaryPurple.withValues(alpha: 0.4),
                                             blurRadius: 15,
                                             offset: const Offset(0, 5),
                                           ),
                                         ],
                                       ),
                                       child: ClipRRect(
                                         borderRadius: BorderRadius.circular(40),
                                         child: Image.asset(
                                           'assets/images/crafzio.jpg',
                                           width: 80,
                                           height: 80,
                                           fit: BoxFit.cover,
                                         ),
                                       ),
                                     ),
                                   );
                                 },
                               ),
                              const SizedBox(height: 20),
                              Text(
                                'Development Team CRAFZIO',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryPurple,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Meet the talented developers behind LearnJavaX',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Theme.of(context).brightness == Brightness.dark 
                                      ? Colors.grey.shade300 
                                      : Colors.grey.shade700,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
            const SizedBox(height: 32),

                      const SizedBox(height: 40),

                      // Developers List with Staggered Animation
                      _buildAnimatedDeveloperCard(
                        context,
                        'Chethan S',
                        'Lead Developer',
                        'Full-Stack Development',
                        Icons.engineering,
                        'Expert in Flutter development and mobile app architecture. Passionate about creating seamless user experiences.',
                        'https://www.linkedin.com/in/chethan-s-623073250?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
                        0,
                      ),
                      const SizedBox(height: 20),

                      _buildAnimatedDeveloperCard(
                        context,
                        'Darshan AB',
                        'Backend Developer',
                        'API & Database Design',
                        Icons.storage,
                        'Specializes in backend systems, database optimization, and API development. Ensures robust data management.',
                        'https://www.linkedin.com/in/darshan-ab-aa2631331?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
                        1,
                      ),
                      const SizedBox(height: 20),

                      _buildAnimatedDeveloperCard(
                        context,
                        'Jithin GK',
                        'UI/UX Developer',
                        'Design & User Experience',
                        Icons.design_services,
                        'Creative designer focused on intuitive user interfaces and engaging user experiences. Brings ideas to life.',
                        'https://www.linkedin.com/in/jithin-gk-19671b2a7?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
                        2,
                      ),
                      const SizedBox(height: 20),

                      _buildAnimatedDeveloperCard(
                        context,
                        'Venkataramana T',
                        'Quality Assurance',
                        'Testing & Optimization',
                        Icons.bug_report,
                        'Dedicated to ensuring app quality, performance optimization, and delivering bug-free experiences.',
                        'https://www.linkedin.com/in/venkataramana-t-b3081a368?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
                        3,
                      ),

                      const SizedBox(height: 40),

                      // Team Stats Section with Animation
                      ScaleTransition(
                        scale: _scaleAnimation,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: Theme.of(context).brightness == Brightness.dark
                                  ? [
                                      Colors.grey.shade800.withValues(alpha: 0.9),
                                      Colors.grey.shade700.withValues(alpha: 0.7),
                                    ]
                                  : [
                                      Colors.white.withValues(alpha: 0.9),
                                      Colors.white.withValues(alpha: 0.7),
                                    ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryPurple.withValues(alpha: 0.2),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryPurple.withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      Icons.analytics,
                                      size: 28,
                                      color: AppColors.primaryPurple,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Project Statistics',
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryPurple,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              // Statistics Grid
                              GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                childAspectRatio: 2.2,
                                children: [
                                  _buildAnimatedStatItem(context, '4', 'Developers', 0),
                                  _buildAnimatedStatItem(context, '100+', 'Lessons', 1),
                                  _buildAnimatedStatItem(context, '50+', 'Tests', 2),
                                  _buildAnimatedStatItem(context, '6', 'Levels', 3),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Contact Section with Animation
                      SlideTransition(
                        position: _slideAnimation,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: Theme.of(context).brightness == Brightness.dark
                                  ? [
                                      Colors.grey.shade800.withValues(alpha: 0.9),
                                      Colors.grey.shade700.withValues(alpha: 0.7),
                                    ]
                                  : [
                                      Colors.white.withValues(alpha: 0.9),
                                      Colors.white.withValues(alpha: 0.7),
                                    ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryPurple.withValues(alpha: 0.2),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryPurple.withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      Icons.contact_support,
                                      size: 28,
                                      color: AppColors.primaryPurple,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Contact the Team',
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryPurple,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Have questions or feedback? We\'d love to hear from you!',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Theme.of(context).brightness == Brightness.dark 
                                      ? Colors.grey.shade300 
                                      : Colors.grey.shade700,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.primaryPurple,
                                      AppColors.primaryPurpleLight,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.primaryPurple.withValues(alpha: 0.3),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Get.snackbar(
                                      'Contact',
                                      'Thank you for your interest! Please reach out through the app store.',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: AppColors.primaryPurple,
                                      colorText: Colors.white,
                                      duration: const Duration(seconds: 3),
                                    );
                                  },
                                  icon: const Icon(Icons.email),
                                  label: const Text('Get in Touch'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: Colors.white,
                                    shadowColor: Colors.transparent,
                                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedDeveloperCard(
    BuildContext context,
    String name,
    String role,
    String specialization,
    IconData icon,
    String description,
    String linkedinUrl,
    int index,
  ) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 600 + (index * 200)),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: _buildDeveloperCard(
              context,
              name,
              role,
              specialization,
              icon,
              description,
              linkedinUrl,
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedStatItem(BuildContext context, String value, String label, int index) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 800 + (index * 100)),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, animValue, child) {
        return Transform.scale(
          scale: 0.5 + (0.5 * animValue),
          child: Opacity(
            opacity: animValue,
            child: _buildStatItem(context, value, label),
          ),
        );
      },
    );
  }

  Widget _buildDeveloperCard(
    BuildContext context,
    String name,
    String role,
    String specialization,
    IconData icon,
    String description,
    String linkedinUrl,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: Theme.of(context).brightness == Brightness.dark
              ? [
                  Colors.grey.shade800.withValues(alpha: 0.95),
                  Colors.grey.shade700.withValues(alpha: 0.8),
                ]
              : [
                  Colors.white.withValues(alpha: 0.95),
                  Colors.white.withValues(alpha: 0.8),
                ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primaryPurple.withValues(alpha: 0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryPurple.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey.shade900.withValues(alpha: 0.8)
                : Colors.white.withValues(alpha: 0.8),
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Developer Avatar
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryPurple,
                  AppColors.primaryPurpleLight,
                ],
              ),
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryPurple.withValues(alpha: 0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 35,
            ),
          ),
          const SizedBox(width: 16),
          
          // Developer Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.dark 
                        ? Colors.white 
                        : Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  role,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.primaryPurple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  specialization,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark 
                        ? Colors.grey.shade300 
                        : Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark 
                        ? Colors.grey.shade400 
                        : Colors.grey.shade600,
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                // LinkedIn Button
                InkWell(
                  onTap: () => _launchLinkedIn(linkedinUrl),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF0077B5), // LinkedIn blue
                          const Color(0xFF005885), // Darker LinkedIn blue
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0077B5).withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.link,
                          color: Colors.white,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'LinkedIn',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryPurple.withValues(alpha: 0.1),
            AppColors.primaryPurple.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryPurple.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryPurple.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Value with better typography
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryPurple,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 3),
          // Label with better spacing
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).brightness == Brightness.dark 
                  ? Colors.grey.shade300 
                  : Colors.grey.shade700,
              fontWeight: FontWeight.w600,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Future<void> _launchLinkedIn(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        Get.snackbar(
          'Error',
          'Could not open LinkedIn profile',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.error,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to open LinkedIn profile',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.error,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }
}
