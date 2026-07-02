import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../config/app_theme.dart';
import '../presentation/widgets/history_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Gradient background for the entire page
      decoration: AppTheme.backgroundGradient,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 375),
          childAnimationBuilder: (widget) => SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(child: widget),
          ),
          children: [
            // Chelsea Logo at the top of the history page
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Image.asset(
                'assets/icon/icon.png', // Local Chelsea/logo asset
                height: 100,
              ),
            ),
            HistoryCard(
              title: '1905: The Founding',
              description:
                  'Chelsea Football Club was founded in The Rising Sun pub on March 10, 1905. The club was created after a deal to lease Stamford Bridge to Fulham FC fell through, so owner Gus Mears decided to start his own team.',
              icon: Icons.stadium,
              color: Colors.blue.shade600,
            ),
            HistoryCard(
              title: '1955: First League Title',
              description:
                  'After years of being a mid-table side, manager Ted Drake led Chelsea to their first-ever top-flight league championship in a surprising victory that ended a 50-year wait for a major trophy.',
              icon: Icons.emoji_events,
              color: Colors.amber.shade700, // Gold accent for a trophy
            ),
            HistoryCard(
              title: '1970s: The Glamour Years',
              description:
                  'Under managers like Dave Sexton, Chelsea won their first FA Cup in 1970 and their first European trophy, the UEFA Cup Winners\' Cup, in 1971. The club became synonymous with style and flair during this period.',
              icon: Icons.star_half,
              color: Colors.teal.shade600,
            ),
            HistoryCard(
              title: '2003: The Abramovich Era',
              description:
                  'Russian billionaire Roman Abramovich bought the club, changing its fortunes forever. His investment transformed Chelsea into a global powerhouse, leading to an unprecedented era of success and consistent trophy-winning.',
              icon: Icons.attach_money,
              color: Colors.green.shade600, // Green accent for money/investment
            ),
            HistoryCard(
              title: '2012: Kings of Europe',
              description:
                  'In one of football\'s most dramatic moments, Chelsea won their first UEFA Champions League title against all odds. They beat Bayern Munich on penalties in their own stadium, with club legend Didier Drogba scoring the decisive spot-kick.',
              icon: Icons.sports_soccer,
              color: Colors.purple.shade600, // Royal purple for Kings of Europe
            ),
            HistoryCard(
              title: '2021: Second Champions League',
              description:
                  'Just nine years later, Chelsea won the Champions League again. Under manager Thomas Tuchel, they defeated a heavily-favored Manchester City side in Porto, confirming their place among Europe\'s elite once more.',
              icon: Icons.emoji_events,
              color: Colors.purple.shade800, // Darker royal purple
            ),
          ],
        ),
      ),
    );
  }
}
