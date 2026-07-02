import 'package:flutter/material.dart';

/// Centralized theme configuration for the Chelsea FC Info app.
/// This file allows you to change fonts, colors, sizes, and other styling
/// properties across all screens from a single location.
///
/// Usage:
/// - Import this file: import '../config/app_theme.dart';
/// - Use AppTheme.primaryColor, AppTheme.titleTextStyle, etc.

class AppTheme {
  // ==================== COLORS ====================

  /// Primary Chelsea Blue color
  static const Color primaryColor = Color(0xFF034694);

  /// Dark blue for AppBars and headers
  static Color appBarColor = Colors.blue.shade800;

  /// Background gradient colors
  static Color backgroundGradientStart = Colors.blue.shade900;
  static Color backgroundGradientMiddle = Colors.blue.shade800;
  static const Color backgroundGradientEnd = Colors.black;

  /// Card and surface colors
  static const Color cardBackground = Colors.white;
  static const Color cardBackgroundTransparent = Color(
    0xE6FFFFFF,
  ); // 90% opacity

  /// Status colors
  static const Color winColor = Colors.green;
  static Color drawColor = Colors.yellow.shade700;
  static const Color lossColor = Colors.red;

  /// Text colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;
  static const Color textOnCard = Colors.black;

  /// Trophy/Award colors
  static const Color goldColor = Colors.amber;
  static Color goldAccent = Colors.amber.shade700;

  // ==================== TYPOGRAPHY ====================

  /// Base font family (can be changed to custom fonts)
  static const String fontFamily = 'Roboto'; // Default Flutter font

  /// Font sizes
  static const double fontSizeSmall = 12.0;
  static const double fontSizeMedium = 14.0;
  static const double fontSizeNormal = 16.0;
  static const double fontSizeLarge = 18.0;
  static const double fontSizeXLarge = 20.0;
  static const double fontSizeTitle = 22.0;
  static const double fontSizeHeading = 24.0;

  /// Font weights
  static const FontWeight fontWeightLight = FontWeight.w300;
  static const FontWeight fontWeightRegular = FontWeight.w400;
  static const FontWeight fontWeightMedium = FontWeight.w600;
  static const FontWeight fontWeightBold = FontWeight.w700;
  static const FontWeight fontWeightExtraBold = FontWeight.w900;

  // ==================== TEXT STYLES ====================

  /// App bar title style
  static const TextStyle appBarTitleStyle = TextStyle(
    color: textPrimary,
    fontSize: fontSizeLarge,
    fontWeight: fontWeightMedium,
    fontFamily: fontFamily,
  );

  /// Page heading style (large titles on pages)
  static const TextStyle headingStyle = TextStyle(
    fontSize: fontSizeHeading,
    fontWeight: fontWeightBold,
    color: textPrimary,
    fontFamily: fontFamily,
  );

  /// Section title style (medium titles within pages)
  static const TextStyle sectionTitleStyle = TextStyle(
    fontSize: fontSizeLarge,
    fontWeight: fontWeightBold,
    color: textPrimary,
    fontFamily: fontFamily,
  );

  /// Card title style
  static const TextStyle cardTitleStyle = TextStyle(
    fontSize: fontSizeTitle,
    fontWeight: fontWeightBold,
    color: textPrimary,
    fontFamily: fontFamily,
  );

  /// Body text style (primary on dark background)
  static const TextStyle bodyTextStyle = TextStyle(
    fontSize: fontSizeNormal,
    color: textPrimary,
    fontFamily: fontFamily,
  );

  /// Body text style (on cards/light background)
  static const TextStyle bodyTextOnCardStyle = TextStyle(
    fontSize: fontSizeNormal,
    color: textOnCard,
    fontFamily: fontFamily,
  );

  /// Secondary text style (lighter/smaller)
  static const TextStyle secondaryTextStyle = TextStyle(
    fontSize: fontSizeMedium,
    color: textSecondary,
    fontFamily: fontFamily,
  );

  /// Small text style (captions, labels)
  static const TextStyle smallTextStyle = TextStyle(
    fontSize: fontSizeSmall,
    color: textSecondary,
    fontFamily: fontFamily,
  );

  /// Button text style
  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: fontSizeNormal,
    fontWeight: fontWeightMedium,
    color: textPrimary,
    fontFamily: fontFamily,
  );

  /// Stat label style (small, bold)
  static const TextStyle statLabelStyle = TextStyle(
    fontSize: fontSizeSmall,
    color: textSecondary,
    fontWeight: fontWeightMedium,
    fontFamily: fontFamily,
  );

  /// Stat value style (large, bold)
  static const TextStyle statValueStyle = TextStyle(
    fontSize: fontSizeNormal,
    fontWeight: fontWeightBold,
    color: textPrimary,
    fontFamily: fontFamily,
  );

  /// Kit/Jersey title style
  static const TextStyle kitTitleStyle = TextStyle(
    fontSize: fontSizeNormal,
    fontWeight: fontWeightExtraBold,
    color: primaryColor,
    fontFamily: fontFamily,
  );

  /// Player name style
  static const TextStyle playerNameStyle = TextStyle(
    fontSize: fontSizeMedium,
    fontWeight: fontWeightMedium,
    color: textOnCard,
    fontFamily: fontFamily,
  );

  /// Badge text style (e.g., "Most Popular")
  static const TextStyle badgeTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: fontWeightBold,
    fontSize: fontSizeSmall,
    fontFamily: fontFamily,
  );

  // ==================== SPACING & SIZING ====================

  /// Standard padding/margin values
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 12.0;
  static const double paddingNormal = 16.0;
  static const double paddingLarge = 24.0;

  /// Border radius values
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusXLarge = 20.0;

  /// Icon sizes
  static const double iconSizeSmall = 20.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;
  static const double iconSizeXLarge = 40.0;

  /// Card elevation
  static const double cardElevationLow = 3.0;
  static const double cardElevationMedium = 5.0;
  static const double cardElevationHigh = 8.0;
  static const double cardElevationXHigh = 12.0;

  // ==================== GRADIENT BUILDERS ====================

  /// Standard background gradient (top to bottom)
  static BoxDecoration backgroundGradient = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        backgroundGradientStart,
        backgroundGradientMiddle,
        backgroundGradientEnd,
      ],
    ),
  );

  /// Chelsea blue gradient (for special sections)
  static BoxDecoration chelseaBlueGradient = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        primaryColor,
        primaryColor.withOpacity(0.8),
        Colors.black.withOpacity(0.9),
      ],
    ),
  );

  // ==================== SHAPE BUILDERS ====================

  /// Standard card shape
  static RoundedRectangleBorder cardShape({
    double radius = borderRadiusLarge,
    BorderSide? side,
  }) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
      side: side ?? BorderSide.none,
    );
  }

  /// Rounded container decoration
  static BoxDecoration roundedContainer({
    Color? color,
    double radius = borderRadiusMedium,
    Border? border,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: border,
    );
  }

  // ==================== CUSTOM WIDGETS ====================

  /// Helper to create consistent spacing
  static Widget verticalSpace(double height) => SizedBox(height: height);
  static Widget horizontalSpace(double width) => SizedBox(width: width);

  /// Standard vertical spacing values
  static Widget get smallVerticalSpace => const SizedBox(height: paddingSmall);
  static Widget get mediumVerticalSpace =>
      const SizedBox(height: paddingMedium);
  static Widget get normalVerticalSpace =>
      const SizedBox(height: paddingNormal);
  static Widget get largeVerticalSpace => const SizedBox(height: paddingLarge);

  /// Standard horizontal spacing values
  static Widget get smallHorizontalSpace => const SizedBox(width: paddingSmall);
  static Widget get mediumHorizontalSpace =>
      const SizedBox(width: paddingMedium);
  static Widget get normalHorizontalSpace =>
      const SizedBox(width: paddingNormal);
  static Widget get largeHorizontalSpace => const SizedBox(width: paddingLarge);
}
