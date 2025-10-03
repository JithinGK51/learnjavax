import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../widgets/connectivity_status_widget.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
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
                    Icons.gavel,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Terms & Conditions',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Please read these terms carefully before using LearnJavaX. By using our app, you agree to these terms.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(context, 'Acceptance of Terms', '''
By using LearnJavaX, you agree to be bound by these Terms and Conditions. If you do not agree to these terms, please do not use our app.
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'Use of the App', '''
You may use LearnJavaX for:
• Personal learning and educational purposes
• Completing lessons and mock tests
• Tracking your learning progress
• Accessing offline content

You may not:
• Reverse engineer or decompile the app
• Use the app for commercial purposes without permission
• Attempt to bypass any security measures
• Share your account with others
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'Learning Content', '''
• All learning content is provided for educational purposes
• Content accuracy is maintained to the best of our ability
• We reserve the right to update or modify content
• Users are responsible for their own learning outcomes
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'Mock Tests and Assessments', '''
• Mock tests are for practice and self-assessment only
• Results are stored locally on your device
• We do not guarantee the accuracy of test questions
• Test results do not constitute official certification
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'Advertisements', '''
• The app contains advertisements to support free access
• Advertisements are provided by third-party networks
• We do not control the content of third-party ads
• You may disable ads by purchasing premium features
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'Intellectual Property', '''
• All app content, design, and code are our intellectual property
• You may not copy, distribute, or modify our content
• Java programming concepts are used under fair use
• Third-party libraries are used under their respective licenses
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'Limitation of Liability', '''
• We provide the app "as is" without warranties
• We are not liable for any learning outcomes
• We do not guarantee uninterrupted app access
• Users use the app at their own risk
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'User Responsibilities', '''
As a user of LearnJavaX, you agree to:
• Use the app responsibly and ethically
• Not attempt to hack or exploit the app
• Respect intellectual property rights
• Provide feedback to help improve the app
• Report any bugs or security issues
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'Offline Functionality', '''
• Most features work offline after initial download
• Progress is saved locally on your device
• Some features may require internet connectivity
• Ads may not display without internet connection
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'App Updates', '''
• We regularly release updates with new features
• Updates may include bug fixes and improvements
• Some updates may require user acceptance
• Older versions may lose support over time
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'Termination', '''
• You may stop using the app at any time
• We may terminate access for violations of terms
• Your local data remains on your device
• Backup your progress before uninstalling
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'Changes to Terms', '''
• We may update these terms at any time
• Continued use constitutes acceptance of new terms
• We will notify users of significant changes
• Previous versions remain available for reference
              '''),
            const SizedBox(height: 24),
            _buildSection(context, 'Contact Information', '''
For questions about these Terms and Conditions:
• Email: legal@learnjavax.com
• Website: www.learnjavax.com
• Support: support@learnjavax.com

Last updated: January 2025
              '''),
            const SizedBox(height: 40),
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
                child: const Text('I Agree'),
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
                Icons.article_outlined,
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
}
