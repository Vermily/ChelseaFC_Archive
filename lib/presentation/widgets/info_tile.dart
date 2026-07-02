import 'package:flutter/material.dart';
import '../../config/app_theme.dart';

class InfoTile extends StatelessWidget {
  final String label, value;
  final Color color;
  const InfoTile({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RepaintBoundary(
        child: Card(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
            child: Column(
              children: [
                Text(label, style: AppTheme.statLabelStyle),
                const SizedBox(height: 6),
                Text(value, style: AppTheme.statValueStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
