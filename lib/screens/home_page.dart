import 'package:flutter/material.dart';
import 'history_page.dart';
import 'accolades_page.dart';
import 'stats_page.dart';
import 'legends_page.dart';
import 'kits_page.dart'; // Keep the Kits page

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late final PageController _pageController;

  // Cache for built pages to avoid rebuilding
  final Map<int, Widget> _pageCache = {};

  // Lazy page builder - only builds pages when first accessed
  Widget _getPage(int index) {
    if (_pageCache.containsKey(index)) {
      return _pageCache[index]!;
    }

    Widget page;
    switch (index) {
      case 0:
        page = const HistoryPage();
        break;
      case 1:
        page = const AccoladesPage();
        break;
      case 2:
        page = const StatsPage();
        break;
      case 3:
        page = const KitsPage();
        break;
      case 4:
        page = const LegendsPage();
        break;
      default:
        page = const HistoryPage();
    }

    _pageCache[index] = page;
    return page;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    // Pre-cache the initial page for instant display
    _getPage(_currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CFC Archive', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFF034694),
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Pre-cache adjacent pages for smoother swiping
          if (index > 0) _getPage(index - 1);
          if (index < 4) _getPage(index + 1);
        },
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) => _getPage(index),
      ),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            currentIndex: _currentIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            backgroundColor: const Color(0xFF034694),
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.emoji_events),
                label: 'Accolades',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard),
                label: 'Stats',
              ),
              BottomNavigationBarItem(
                // Now uses Icons.style
                icon: Icon(Icons.style),
                label: 'Kits',
              ),
              BottomNavigationBarItem(
                // Now uses Icons.star
                icon: Icon(Icons.star),
                label: 'Legends',
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final itemWidth = constraints.maxWidth / 5;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  margin: EdgeInsets.only(left: itemWidth * _currentIndex),
                  width: itemWidth,
                  height: 3,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(2),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
