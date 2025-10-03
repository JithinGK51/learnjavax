import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../widgets/connectivity_status_widget.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
        actions: const [
          ConnectivityStatusWidget(),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.privacy_tip,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Your Privacy Matters',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'We are committed to protecting your privacy and being transparent about our data practices.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(context, 'Information We Collect', '''
We collect information you provide directly to us, such as when you:
• Use our learning features and track your progress
• Complete lessons and mock tests
• Use text-to-speech functionality
• Interact with advertisements

The information we collect includes:
• Learning progress and completion data
• App usage statistics
• Device information for ad personalization
• Performance data to improve the app
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'How We Use Your Information', '''
We use the information we collect to:
• Provide and improve our learning services
• Track your learning progress and achievements
• Personalize your learning experience
• Show relevant advertisements
• Analyze app performance and usage patterns
• Send you notifications about your learning streak
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'Data Storage', '''
• All your learning progress is stored locally on your device
• We do not store personal information on our servers
• Your data remains private and under your control
• You can clear your data anytime through app settings
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'Third-Party Services', '''
We use the following third-party services:
• Google Mobile Ads for advertisements
• Text-to-Speech services for audio features
• Analytics services to improve app performance

These services may collect information according to their own privacy policies.
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'Your Rights', '''
You have the right to:
• Access your learning data
• Delete your progress and data
• Opt out of personalized ads
• Contact us with privacy concerns
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'Data Security', '''
We take the security of your data seriously:
• All data is encrypted and stored securely on your device
• We use industry-standard security measures
• Regular security updates and patches
• No sensitive personal information is transmitted
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'Children\'s Privacy', '''
LearnJavaX is safe for users of all ages:
• We do not knowingly collect personal information from children under 13
• Parental supervision is recommended for younger users
• All content is educational and appropriate
• No social features or user-generated content
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'Updates to Privacy Policy', '''
• We may update this Privacy Policy from time to time
• Users will be notified of significant changes
• Continued use of the app constitutes acceptance
• Previous versions are available upon request
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'Contact Us', '''
If you have any questions about this Privacy Policy, please contact us at:
• Email: crafziogroup@gmail.com
• Website: https://sites.google.com/view/learnjavax/home
• Support: crafziogroup@gmail.com

Last updated: January 2025
              '''),
            const SizedBox(height: 24),
            // Website Link Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.language,
                    size: 32,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'View Full Privacy Policy Online',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'For the complete and most up-to-date privacy policy, visit our website:',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => _launchWebsite(),
                    icon: const Icon(Icons.open_in_browser),
                    label: const Text('Open Website'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryPurple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                child: const Text('I Understand'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content.trim(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.6,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchWebsite() async {
    final Uri url = Uri.parse('https://sites.google.com/view/learnjavax/home');
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        Get.snackbar(
          'Error',
          'Could not open website',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Could not open website: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
