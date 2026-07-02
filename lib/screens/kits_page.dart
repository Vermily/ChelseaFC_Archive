import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../services/hosted_image_service.dart';
import '../config/app_theme.dart';
import '../data/kits_data.dart';

class KitsPage extends StatefulWidget {
  const KitsPage({super.key});

  @override
  State<KitsPage> createState() => _KitsPageState();
}

class _KitsPageState extends State<KitsPage> {
  // Use the latest year in our mock data as the initial selection
  int _selectedYear = kitData.keys.toList().reduce((a, b) => a > b ? a : b);

  // Widget to display a single kit card
  Widget _buildKitCard(Kit kit) {
    return Card(
      elevation: 12,
      color: Colors.white.withOpacity(0.9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: kit.isMostPopular
            ? const BorderSide(color: Colors.amber, width: 4)
            : BorderSide(color: Colors.white.withOpacity(0.7), width: 2),
      ),
      clipBehavior:
          Clip.antiAlias, // Ensures content respects the rounded corners
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Kit Image
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Try hosted URL first (fast CDN). If it fails, fall back to the local asset.
                Image.network(
                  HostedImageService.hostedUrlFromAssetPath(kit.imagePath),
                  fit: BoxFit.cover,
                  cacheWidth: 600,
                  cacheHeight: 800,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(color: Colors.white),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    // Hosted image failed (maybe not deployed yet or offline) — use local asset.
                    return Image.asset(
                      kit.imagePath,
                      fit: BoxFit.cover,
                      cacheWidth: 600,
                      cacheHeight: 800,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(
                            Icons.palette,
                            size: 50,
                            color: AppTheme.primaryColor.withOpacity(0.5),
                          ),
                        );
                      },
                    );
                  },
                ),
                // "Most Popular" Badge
                if (kit.isMostPopular)
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade700,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '🏆 Most Popular',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Kit Title
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              '${kit.year} ${kit.type} Kit',
              textAlign: TextAlign.center,
              style: AppTheme.kitTitleStyle,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<int> years = kitData.keys.toList()
      ..sort((a, b) => b.compareTo(a));
    final List<Kit> currentKits = kitData[_selectedYear] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kits'),
        backgroundColor: AppTheme.appBarColor,
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: _selectedYear,
              dropdownColor: Colors.white,
              items: years
                  .map(
                    (year) => DropdownMenuItem(
                      value: year,
                      child: Text(
                        '$year/${year + 1}',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedYear = value!;
                });
              },
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Container(
        decoration: AppTheme.chelseaBlueGradient,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Kit Supplier
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                color: Colors.white.withOpacity(0.05),
                child: Center(
                  child: Text(
                    'Kit Supplier: ${suppliers[_selectedYear] ?? 'Unknown'}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // Kits Grid View
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: currentKits.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two kits per row on mobile
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 0.7, // Ratio for a jersey-like card shape
                  ),
                  itemBuilder: (context, index) {
                    return TweenAnimationBuilder<double>(
                      key: ValueKey(
                        'kit_${currentKits[index].type}_${currentKits[index].year}',
                      ),
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: Duration(milliseconds: 700 + (index * 150)),
                      curve: Curves.easeOutBack,
                      builder: (context, value, child) {
                        // Clamp rotation to avoid rendering issues
                        final clampedValue = value.clamp(0.0, 1.0);
                        return ClipRect(
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateY((1 - clampedValue) * 3.14159 / 2),
                            child: Opacity(opacity: clampedValue, child: child),
                          ),
                        );
                      },
                      child: _buildKitCard(currentKits[index]),
                    );
                  },
                ),
              ),

              // Iconic Players
              if (playersData.containsKey(_selectedYear))
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            'Iconic Players',
                            style: AppTheme.sectionTitleStyle.copyWith(
                              color: AppTheme.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: playersData[_selectedYear]!
                                .map(
                                  (player) => Expanded(
                                    child: Card(
                                      color: AppTheme.primaryColor.withOpacity(
                                        0.1,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            const Icon(
                                              Icons.sports_soccer,
                                              color: AppTheme.primaryColor,
                                              size: AppTheme.iconSizeMedium,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              player,
                                              textAlign: TextAlign.center,
                                              style: AppTheme.playerNameStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
