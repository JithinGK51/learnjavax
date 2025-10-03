import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/simple_models.dart';

class BadgeWidget extends StatelessWidget {
  final UserBadge badge;

  const BadgeWidget({
    super.key,
    required this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryPurple.withOpacity(0.1),
              AppColors.primaryPurpleLight.withOpacity(0.1),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Badge Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primaryPurple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: _getBadgeIconWidget(badge.type),
            ),
            
            const SizedBox(height: 8),
            
            // Badge Name
            Text(
              badge.name,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryPurple,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            
            const SizedBox(height: 4),
            
            // Earned Date
            Text(
              _formatDate(badge.earnedAt),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondary,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBadgeIconWidget(BadgeType type) {
    switch (type) {
      case BadgeType.levelCompletion:
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/icons/icon.png',
            width: 20,
            height: 20,
            fit: BoxFit.cover,
          ),
        );
      case BadgeType.codeExplorer:
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/icons/icon.png',
            width: 20,
            height: 20,
            fit: BoxFit.cover,
          ),
        );
      case BadgeType.streak:
        return const Icon(
          Icons.local_fire_department,
          color: Colors.white,
          size: 20,
        );
      case BadgeType.testMaster:
        return const Icon(
          Icons.quiz,
          color: Colors.white,
          size: 20,
        );
      case BadgeType.speedLearner:
        return const Icon(
          Icons.speed,
          color: Colors.white,
          size: 20,
        );
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;
    
    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference < 7) {
      return '$difference days ago';
    } else if (difference < 30) {
      final weeks = (difference / 7).floor();
      return '$weeks week${weeks > 1 ? 's' : ''} ago';
    } else {
      final months = (difference / 30).floor();
      return '$months month${months > 1 ? 's' : ''} ago';
    }
  }
}
