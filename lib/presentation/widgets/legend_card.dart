import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../config/app_theme.dart';
import '../../services/hosted_image_service.dart';

class LegendCard extends StatelessWidget {
  final Map<String, dynamic> legend;

  const LegendCard({super.key, required this.legend});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Card(
        color: Colors.black,
        shape: AppTheme.cardShape(
          radius: 15,
          side: BorderSide(color: AppTheme.goldColor, width: 2),
        ),
        elevation: AppTheme.cardElevationHigh,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            _showLegendDetail(context, legend);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Builder(
                  builder: (context) {
                    final String? imagePath = legend['imagePath'] as String?;
                    final filename =
                        legend['imageFilename'] ??
                        (imagePath != null
                            ? imagePath.split('/').last
                            : (legend['image'] is String
                                  ? Uri.tryParse(
                                          legend['image'],
                                        )?.pathSegments.last ??
                                        legend['image']
                                  : legend['image'].toString()));

                    final hostedUrl = imagePath != null
                        ? HostedImageService.hostedUrlFromAssetPath(imagePath)
                        : HostedImageService.hostedUrlFromAssetPath(
                            'assets/legends/$filename',
                          );

                    return Hero(
                      tag: 'legend-${legend['name']}',
                      child: Image.network(
                        hostedUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[800]!,
                            highlightColor: Colors.grey[600]!,
                            child: Container(color: Colors.grey[800]),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          if (imagePath != null) {
                            return Image.asset(imagePath, fit: BoxFit.cover);
                          }
                          return Image.asset(
                            'assets/legends/$filename',
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  legend['name'],
                  textAlign: TextAlign.center,
                  style: AppTheme.sectionTitleStyle.copyWith(
                    color: AppTheme.goldColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLegendDetail(BuildContext context, Map<String, dynamic> legend) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.82,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue.shade900, Colors.blue.shade700],
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 60,
                        height: 5,
                        decoration: AppTheme.roundedContainer(
                          color: Colors.white54,
                          radius: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Builder(
                          builder: (context) {
                            final String? imagePath =
                                legend['imagePath'] as String?;
                            final filename =
                                legend['imageFilename'] ??
                                (imagePath != null
                                    ? imagePath.split('/').last
                                    : (legend['image'] is String
                                          ? Uri.tryParse(
                                                  legend['image'],
                                                )?.pathSegments.last ??
                                                legend['image']
                                          : legend['image'].toString()));

                            final hostedUrl = imagePath != null
                                ? HostedImageService.hostedUrlFromAssetPath(
                                    imagePath,
                                  )
                                : HostedImageService.hostedUrlFromAssetPath(
                                    'assets/legends/$filename',
                                  );

                            return Hero(
                              tag: 'legend-${legend['name']}',
                              child: Image.network(
                                hostedUrl,
                                height: 180,
                                width: 180,
                                fit: BoxFit.cover,
                                loadingBuilder: (context, child, progress) {
                                  if (progress == null) return child;
                                  return SizedBox(
                                    height: 180,
                                    width: 180,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.blue[800]!,
                                      highlightColor: Colors.blue[600]!,
                                      child: Container(color: Colors.blue[800]),
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  if (imagePath != null) {
                                    return Image.asset(
                                      imagePath,
                                      height: 180,
                                      width: 180,
                                      fit: BoxFit.cover,
                                    );
                                  }
                                  return Image.asset(
                                    'assets/legends/$filename',
                                    height: 180,
                                    width: 180,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        legend['name'],
                        style: AppTheme.headingStyle.copyWith(fontSize: 28),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      legend['bio'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white70,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildStatRow(
                      Icons.sports_soccer,
                      'Appearances',
                      legend['appearances'],
                    ),
                    if (legend.containsKey('clean_sheets'))
                      _buildStatRow(
                        Icons.shield,
                        'Clean Sheets',
                        legend['clean_sheets'],
                      )
                    else ...[
                      _buildStatRow(
                        Icons.leaderboard,
                        'Goals',
                        legend['goals'],
                      ),
                      _buildStatRow(
                        Icons.assist_walker,
                        'Assists',
                        legend['assists'],
                      ),
                    ],
                    const SizedBox(height: 16),
                    const Text(
                      'Trophies:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFD700),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ..._buildTrophyList(legend['trophies']),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildStatRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFFFFD700), size: 24),
          const SizedBox(width: 15),
          Text(
            '$label:',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildTrophyList(List<String> trophies) {
    return trophies
        .map(
          (trophy) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 30.0),
            child: Row(
              children: [
                const Icon(Icons.emoji_events, color: Colors.amber, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    trophy,
                    style: const TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
  }
}
