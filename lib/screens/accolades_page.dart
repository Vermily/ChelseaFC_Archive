import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../services/hosted_image_service.dart';
import '../config/app_theme.dart';

class AccoladesPage extends StatelessWidget {
  const AccoladesPage({super.key});

  final List<Map<String, dynamic>> accolades = const [
    {
      'title': 'Premier League / First Division',
      'count': 6,
      'years': '1955, 2005, 2006, 2010, 2015, 2017',
      'icon': Icons.emoji_events,
      'iconColor': Colors.amber,
      'image': 'assets/trophies/pl.jpg',
      'description':
          'The Premier League is the top level of the English football league system. Chelsea has won it 6 times, establishing themselves as one of England\'s most successful clubs.',
      'history':
          'Chelsea\'s first title came in 1955 under Ted Drake. The modern era titles include 2005, 2006, 2010, 2015, and 2017.',
    },
    {
      'title': 'FA Cup',
      'count': 8,
      'years': '1970, 1997, 2000, 2007, 2009, 2010, 2012, 2018',
      'icon': Icons.emoji_events,
      'iconColor': Colors.white,
      'image': 'assets/trophies/facup.jpg',
      'description':
          'The FA Cup is England\'s primary national cup competition. Chelsea has won it 8 times, more than any other club in the competition\'s history.',
      'history':
          'Chelsea\'s FA Cup victories span from 1970 to 2018, with notable wins including the 2012 final against Liverpool.',
    },
    {
      'title': 'UEFA Champions League',
      'count': 2,
      'years': '2012, 2021',
      'icon': Icons.emoji_events,
      'iconColor': Colors.yellow,
      'image': 'assets/trophies/cl.jpg',
      'description':
          'The UEFA Champions League is the most prestigious club competition in European football. Chelsea won it in 2012 and 2021.',
      'history':
          'The 2012 win came against Bayern Munich in the final, while the 2021 victory was against Manchester City in Porto.',
    },
    {
      'title': 'UEFA Europa League',
      'count': 2,
      'years': '2013, 2019',
      'icon': Icons.emoji_events,
      'iconColor': Colors.greenAccent,
      'image': 'assets/trophies/europa.jpg',
      'description':
          'The UEFA Europa League is Europe\'s secondary club competition. Chelsea has won it twice.',
      'history':
          'Victories in 2013 and 2019 under managers Roberto Di Matteo and Maurizio Sarri respectively.',
    },
    {
      'title': 'EFL / League Cup',
      'count': 5,
      'years': '1965, 1998, 2005, 2007, 2015',
      'icon': Icons.emoji_events,
      'iconColor': Colors.redAccent,
      'image': 'assets/trophies/carabao.jpg',
      'description':
          'The EFL Cup is a knockout cup competition in English football. Chelsea has won it 5 times.',
      'history':
          'Chelsea\'s League Cup wins include the 2015 victory over Tottenham Hotspur.',
    },
    {
      'title': 'FIFA Club World Cup',
      'count': 1,
      'years': '2021, 2025',
      'icon': Icons.emoji_events,
      'iconColor': Colors.white,
      'image': 'assets/trophies/cwc.jpg',
      'description':
          'The FIFA Club World Cup is an international club football competition. Chelsea won it in 2021.',
      'history': 'Defeated Palmeiras in the final to claim the world title.',
    },
    {
      'title': 'UEFA Cup Winners\' Cup',
      'count': 2,
      'years': '1971, 1998',
      'icon': Icons.emoji_events,
      'iconColor': Colors.grey,
      'image': 'assets/trophies/european.jpg',
      'description':
          'The UEFA Cup Winners\' Cup was a European football competition for cup winners. Chelsea won it twice before it was discontinued.',
      'history':
          'Victories in 1971 and 1998, the latter under Gianluca Vialli.',
    },
    {
      'title': 'UEFA Super Cup',
      'count': 2,
      'years': '1998, 2021',
      'icon': Icons.emoji_events,
      'iconColor': Colors.white,
      'image': 'assets/trophies/supercup.jpg',
      'description':
          'The UEFA Super Cup is played between the winners of the Champions League and Europa League. Chelsea has won it twice.',
      'history': 'Won in 1998 and 2021, following their European triumphs.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.backgroundGradient,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 375),
          childAnimationBuilder: (widget) => SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(child: widget),
          ),
          children: accolades
              .map((accolade) => _buildTrophyCard(context, accolade))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildTrophyCard(BuildContext context, Map<String, dynamic> accolade) {
    return GestureDetector(
      onTap: () => _showAccoladeDetails(context, accolade),
      child: Card(
        color: AppTheme.appBarColor.withOpacity(0.9),
        margin: EdgeInsets.symmetric(vertical: AppTheme.paddingSmall),
        shape: AppTheme.cardShape(),
        elevation: AppTheme.cardElevationHigh,
        child: Padding(
          padding: EdgeInsets.all(AppTheme.paddingNormal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.network(
                    HostedImageService.hostedUrlFromAssetPath(
                      accolade['image'],
                    ),
                    width: 56,
                    height: 56,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const SizedBox(
                        width: 56,
                        height: 56,
                        child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        accolade['image'],
                        width: 56,
                        height: 56,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          accolade['icon'],
                          color: accolade['iconColor'],
                          size: 44,
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      accolade['title'],
                      style: AppTheme.cardTitleStyle,
                    ),
                  ),
                ],
              ),
              AppTheme.mediumVerticalSpace,
              Text(
                '${accolade['count']} Titles',
                style: AppTheme.sectionTitleStyle.copyWith(
                  color: accolade['iconColor'],
                ),
              ),
              AppTheme.smallVerticalSpace,
              Text(
                accolade['years'],
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

  void _showAccoladeDetails(
    BuildContext context,
    Map<String, dynamic> accolade,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: AppTheme.backgroundGradientStart,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppTheme.borderRadiusXLarge),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(AppTheme.paddingNormal),
            child: ListView(
              controller: scrollController,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: AppTheme.roundedContainer(
                      color: Colors.white24,
                      radius: 2,
                    ),
                  ),
                ),
                AppTheme.normalVerticalSpace,
                Row(
                  children: [
                    Image.network(
                      HostedImageService.hostedUrlFromAssetPath(
                        accolade['image'],
                      ),
                      width: 64,
                      height: 64,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const SizedBox(
                          width: 64,
                          height: 64,
                          child: Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        accolade['image'],
                        width: 64,
                        height: 64,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          accolade['icon'],
                          color: accolade['iconColor'],
                          size: 56,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        accolade['title'],
                        style: AppTheme.headingStyle,
                      ),
                    ),
                  ],
                ),
                AppTheme.normalVerticalSpace,
                Text(
                  '${accolade['count']} Titles: ${accolade['years']}',
                  style: AppTheme.sectionTitleStyle.copyWith(
                    color: accolade['iconColor'],
                  ),
                ),
                AppTheme.normalVerticalSpace,
                Text(
                  accolade['description'],
                  style: AppTheme.bodyTextStyle.copyWith(
                    color: AppTheme.textSecondary,
                    height: 1.5,
                  ),
                ),
                AppTheme.normalVerticalSpace,
                Text('History', style: AppTheme.sectionTitleStyle),
                AppTheme.smallVerticalSpace,
                Text(
                  accolade['history'],
                  style: AppTheme.bodyTextStyle.copyWith(
                    color: AppTheme.textSecondary,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
