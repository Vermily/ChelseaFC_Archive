import 'package:flutter/material.dart';
import '../config/app_theme.dart';
import '../presentation/widgets/info_tile.dart';
import '../data/stats_data.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  String selectedSeason = "2023/24";

  @override
  Widget build(BuildContext context) {
    final seasonStats = statsData[selectedSeason]!;
    final List<String> matchResults = seasonStats["Results"];
    int wins = int.parse(seasonStats["Wins"]!);
    int draws = int.parse(seasonStats["Draws"]!);
    int losses = int.parse(seasonStats["Losses"]!);
    int totalGames = wins + draws + losses;
    double wPct = totalGames > 0 ? wins / totalGames : 0;
    double dPct = totalGames > 0 ? draws / totalGames : 0;
    double lPct = totalGames > 0 ? losses / totalGames : 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Season Stats'),
        backgroundColor: AppTheme.appBarColor,
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedSeason,
              dropdownColor: Colors.white,
              items: statsData.keys
                  .map(
                    (season) => DropdownMenuItem(
                      value: season,
                      child: Text(
                        season,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedSeason = value!;
                });
              },
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoTile(
                    label: 'Wins',
                    value: seasonStats['Wins'],
                    color: Colors.green,
                  ),
                  InfoTile(
                    label: 'Draws',
                    value: seasonStats['Draws'],
                    color: Colors.yellow.shade700,
                  ),
                  InfoTile(
                    label: 'Losses',
                    value: seasonStats['Losses'],
                    color: Colors.red,
                  ),
                  InfoTile(
                    label: 'Position',
                    value: seasonStats['League Position'],
                    color: Colors.blueGrey,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Card(
                color: Colors.blue.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Win/Draw/Loss Breakdown",
                        style: AppTheme.sectionTitleStyle.copyWith(
                          fontSize: AppTheme.fontSizeNormal,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 28,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: wins,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(14),
                                    bottomLeft: Radius.circular(14),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: draws,
                              child: Container(color: Colors.yellow.shade700),
                            ),
                            Expanded(
                              flex: losses,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(14),
                                    bottomRight: Radius.circular(14),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${(wPct * 100).round()}% Wins",
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            "${(dPct * 100).round()}% Draws",
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            "${(lPct * 100).round()}% Losses",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text("Matchweek Results", style: AppTheme.sectionTitleStyle),
              const SizedBox(height: 8),
              Row(
                children: matchResults.take(10).map((r) {
                  final height = r == 'W' ? 40.0 : (r == 'D' ? 24.0 : 12.0);
                  final color = r == 'W'
                      ? Colors.green
                      : (r == 'D' ? Colors.yellow.shade700 : Colors.red);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Container(
                      width: 6,
                      height: height,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              Table(
                border: TableBorder.all(color: Colors.grey.shade300),
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(1),
                },
                children: List.generate(matchResults.length, (i) {
                  final r = matchResults[i];
                  final symbol = r == 'W' ? '✓' : (r == 'D' ? '-' : '✗');
                  final color = r == 'W'
                      ? Colors.green
                      : (r == 'D' ? Colors.yellow.shade700 : Colors.red);
                  return TableRow(
                    decoration: BoxDecoration(
                      color: i % 2 == 0 ? Colors.grey.shade100 : Colors.white,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Matchday ${i + 1}',
                          style: AppTheme.bodyTextOnCardStyle.copyWith(
                            fontSize: AppTheme.fontSizeMedium,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: color,
                          child: Text(
                            symbol,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
              const SizedBox(height: 24),
              Card(
                color: Colors.blue.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Season Highlights",
                        style: AppTheme.sectionTitleStyle,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(Icons.sports_soccer, color: Colors.blue),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Top Scorer: ${seasonStats["Top Scorer"]}",
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.local_play, color: Colors.orange),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Top Assister: ${seasonStats["Top Assister"]}",
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.shield, color: Colors.teal),
                          const SizedBox(width: 8),
                          Text(
                            "Clean Sheets: ${seasonStats["Clean Sheets"]}",
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
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
