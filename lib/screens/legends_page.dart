import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../config/app_theme.dart';
import '../presentation/widgets/legend_card.dart';
import '../data/legends_data.dart';

class LegendsPage extends StatelessWidget {
  const LegendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.backgroundGradient,
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: legendsData.length,
        addAutomaticKeepAlives: true,
        addRepaintBoundaries: true,
        cacheExtent: 500,
        itemBuilder: (context, index) {
          final legend = legendsData[index];
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 375),
            columnCount: 2,
            child: ScaleAnimation(
              child: FadeInAnimation(child: LegendCard(legend: legend)),
            ),
          );
        },
      ),
    );
  }
}
