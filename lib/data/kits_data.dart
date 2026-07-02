// --- Data Model ---
class Kit {
  final int year;
  final String type;
  final String imagePath;
  final int salesRank;

  Kit({
    required this.year,
    required this.type,
    required this.imagePath,
    required this.salesRank,
  });

  bool get isMostPopular => salesRank == 1;
}

final Map<int, List<Kit>> kitData = {
  2024: [
    Kit(
      year: 2024,
      type: 'Home',
      imagePath: 'assets/images/kits/2024_home.png',
      salesRank: 1,
    ),
    Kit(
      year: 2024,
      type: 'Away',
      imagePath: 'assets/images/kits/2024_away.png',
      salesRank: 2,
    ),
    Kit(
      year: 2024,
      type: 'Third',
      imagePath: 'assets/images/kits/2024_third.png',
      salesRank: 3,
    ),
  ],
  2023: [
    Kit(
      year: 2023,
      type: 'Home',
      imagePath: 'assets/images/kits/2023_home.png',
      salesRank: 2,
    ),
    Kit(
      year: 2023,
      type: 'Away',
      imagePath: 'assets/images/kits/2023_away.png',
      salesRank: 1,
    ),
    Kit(
      year: 2023,
      type: 'Third',
      imagePath: 'assets/images/kits/2023_third.png',
      salesRank: 3,
    ),
  ],
  2022: [
    Kit(
      year: 2022,
      type: 'Home',
      imagePath: 'assets/images/kits/2022_home.png',
      salesRank: 1,
    ),
    Kit(
      year: 2022,
      type: 'Away',
      imagePath: 'assets/images/kits/2022_away.png',
      salesRank: 2,
    ),
    Kit(
      year: 2022,
      type: 'Third',
      imagePath: 'assets/images/kits/2022_third.png',
      salesRank: 3,
    ),
  ],
  2021: [
    Kit(
      year: 2021,
      type: 'Home',
      imagePath: 'assets/images/kits/2021_home.png',
      salesRank: 2,
    ),
    Kit(
      year: 2021,
      type: 'Away',
      imagePath: 'assets/images/kits/2021_away.png',
      salesRank: 1,
    ),
    Kit(
      year: 2021,
      type: 'Third',
      imagePath: 'assets/images/kits/2021_third.png',
      salesRank: 3,
    ),
  ],
  2020: [
    Kit(
      year: 2020,
      type: 'Home',
      imagePath: 'assets/images/kits/2020_home.png',
      salesRank: 2,
    ),
    Kit(
      year: 2020,
      type: 'Away',
      imagePath: 'assets/images/kits/2020_away.png',
      salesRank: 3,
    ),
    Kit(
      year: 2020,
      type: 'Third',
      imagePath: 'assets/images/kits/2020_third.png',
      salesRank: 1,
    ),
  ],
  2019: [
    Kit(
      year: 2019,
      type: 'Home',
      imagePath: 'assets/images/kits/2019_home.png',
      salesRank: 1,
    ),
    Kit(
      year: 2019,
      type: 'Away',
      imagePath: 'assets/images/kits/2019_away.png',
      salesRank: 2,
    ),
    Kit(
      year: 2019,
      type: 'Third',
      imagePath: 'assets/images/kits/2019_third.png',
      salesRank: 3,
    ),
  ],
  2018: [
    Kit(
      year: 2018,
      type: 'Home',
      imagePath: 'assets/images/kits/2018_home.png',
      salesRank: 2,
    ),
    Kit(
      year: 2018,
      type: 'Away',
      imagePath: 'assets/images/kits/2018_away.png',
      salesRank: 1,
    ),
    Kit(
      year: 2018,
      type: 'Third',
      imagePath: 'assets/images/kits/2018_third.png',
      salesRank: 3,
    ),
  ],
  2017: [
    Kit(
      year: 2017,
      type: 'Home',
      imagePath: 'assets/images/kits/2017_home.png',
      salesRank: 1,
    ),
    Kit(
      year: 2017,
      type: 'Away',
      imagePath: 'assets/images/kits/2017_away.png',
      salesRank: 2,
    ),
    Kit(
      year: 2017,
      type: 'Third',
      imagePath: 'assets/images/kits/2017_third.png',
      salesRank: 3,
    ),
  ],
  2016: [
    Kit(
      year: 2016,
      type: 'Home',
      imagePath: 'assets/images/kits/2016_home.png',
      salesRank: 2,
    ),
    Kit(
      year: 2016,
      type: 'Away',
      imagePath: 'assets/images/kits/2016_away.png',
      salesRank: 3,
    ),
    Kit(
      year: 2016,
      type: 'Third',
      imagePath: 'assets/images/kits/2016_third.png',
      salesRank: 1,
    ),
  ],
  2015: [
    Kit(
      year: 2015,
      type: 'Home',
      imagePath: 'assets/images/kits/2015_home.png',
      salesRank: 2,
    ),
    Kit(
      year: 2015,
      type: 'Away',
      imagePath: 'assets/images/kits/2015_away.png',
      salesRank: 1,
    ),
    Kit(
      year: 2015,
      type: 'Third',
      imagePath: 'assets/images/kits/2015_third.png',
      salesRank: 3,
    ),
  ],
  2014: [
    Kit(
      year: 2014,
      type: 'Home',
      imagePath: 'assets/images/kits/2014_home.png',
      salesRank: 1,
    ),
    Kit(
      year: 2014,
      type: 'Away',
      imagePath: 'assets/images/kits/2014_away.png',
      salesRank: 2,
    ),
    Kit(
      year: 2014,
      type: 'Third',
      imagePath: 'assets/images/kits/2014_third.png',
      salesRank: 3,
    ),
  ],
  2013: [
    Kit(
      year: 2013,
      type: 'Home',
      imagePath: 'assets/images/kits/2013_home.png',
      salesRank: 2,
    ),
    Kit(
      year: 2013,
      type: 'Away',
      imagePath: 'assets/images/kits/2013_away.png',
      salesRank: 1,
    ),
    Kit(
      year: 2013,
      type: 'Third',
      imagePath: 'assets/images/kits/2013_third.png',
      salesRank: 3,
    ),
  ],
  2012: [
    Kit(
      year: 2012,
      type: 'Home',
      imagePath: 'assets/images/kits/2012_home.png',
      salesRank: 1,
    ),
    Kit(
      year: 2012,
      type: 'Away',
      imagePath: 'assets/images/kits/2012_away.png',
      salesRank: 2,
    ),
    Kit(
      year: 2012,
      type: 'Third',
      imagePath: 'assets/images/kits/2012_third.png',
      salesRank: 3,
    ),
  ],
  2011: [
    Kit(
      year: 2011,
      type: 'Home',
      imagePath: 'assets/images/kits/2011_home.png',
      salesRank: 2,
    ),
    Kit(
      year: 2011,
      type: 'Away',
      imagePath: 'assets/images/kits/2011_away.png',
      salesRank: 1,
    ),
    Kit(
      year: 2011,
      type: 'Third',
      imagePath: 'assets/images/kits/2011_third.png',
      salesRank: 3,
    ),
  ],
  2010: [
    Kit(
      year: 2010,
      type: 'Home',
      imagePath: 'assets/images/kits/2010_home.png',
      salesRank: 1,
    ),
    Kit(
      year: 2010,
      type: 'Away',
      imagePath: 'assets/images/kits/2010_away.png',
      salesRank: 2,
    ),
    Kit(
      year: 2010,
      type: 'Third',
      imagePath: 'assets/images/kits/2010_third.png',
      salesRank: 3,
    ),
  ],
};

final Map<int, List<String>> playersData = {
  2024: ['Cole Palmer', 'Moises Caicedo', 'Enzo Fernandez'],
  2023: ['Kai Havertz', 'Mason Mount', 'Ben Chilwell'],
  2022: ['Romelu Lukaku', 'Timo Werner', 'Kai Havertz'],
  2021: ['Tanguy Ndombele', 'Hakim Ziyech', 'Christian Pulisic'],
  2020: ['Christian Pulisic', 'Tanguy Ndombele', 'Tanguy Kouassi'],
  2019: ['Christian Pulisic', 'Pedro', 'Willian'],
  2018: ['Eden Hazard', 'Pedro', 'Diego Costa'],
  2017: ['Eden Hazard', 'Diego Costa', 'N\'Golo Kante'],
  2016: ['Diego Costa', 'Eden Hazard', 'Pedro'],
  2015: ['Diego Costa', 'Eden Hazard', 'Cesc Fabregas'],
  2014: ['Eden Hazard', 'Samuel Eto\'o', 'Frank Lampard'],
  2013: ['Eden Hazard', 'Juan Mata', 'Frank Lampard'],
  2012: ['Didier Drogba', 'Frank Lampard', 'Juan Mata'],
  2011: ['Didier Drogba', 'Frank Lampard', 'Nicolas Anelka'],
  2010: ['Didier Drogba', 'Frank Lampard', 'Joe Cole'],
};

final Map<int, String> suppliers = {
  2024: 'Nike',
  2023: 'Nike',
  2022: 'Nike',
  2021: 'Nike',
  2020: 'Nike',
  2019: 'Nike',
  2018: 'Nike',
  2017: 'Nike',
  2016: 'Adidas',
  2015: 'Adidas',
  2014: 'Adidas',
  2013: 'Adidas',
  2012: 'Adidas',
  2011: 'Adidas',
  2010: 'Adidas',
};
