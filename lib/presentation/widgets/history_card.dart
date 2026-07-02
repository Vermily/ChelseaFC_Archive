import 'package:flutter/material.dart';
import '../../config/app_theme.dart';

class HistoryCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const HistoryCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Card(
        color: color,
        margin: EdgeInsets.symmetric(vertical: AppTheme.paddingSmall),
        shape: AppTheme.cardShape(radius: 15),
        elevation: AppTheme.cardElevationMedium,
        child: Padding(
          padding: EdgeInsets.all(AppTheme.paddingNormal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: AppTheme.textPrimary,
                    size: AppTheme.iconSizeLarge,
                  ),
                  AppTheme.normalHorizontalSpace,
                  Expanded(child: Text(title, style: AppTheme.cardTitleStyle)),
                ],
              ),
              AppTheme.mediumVerticalSpace,
              Text(
                description,
                style: AppTheme.bodyTextStyle.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
