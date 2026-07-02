# App Theme Configuration Guide

## Overview
This app uses a centralized theme configuration system located in `lib/config/app_theme.dart`. This follows **clean architecture principles** by separating presentation styling from business logic.

## Purpose
The `AppTheme` class allows you to control all visual styling across the entire app from a single file. This includes:
- Colors
- Typography (fonts, sizes, weights)
- Text styles
- Spacing and sizing
- Gradients and decorations

## How to Use

### 1. Import the theme in your screen files
```dart
import '../config/app_theme.dart';
```

### 2. Use theme constants instead of hardcoded values

**❌ Before (hardcoded):**
```dart
Text(
  'Hello',
  style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
)
```

**✅ After (using AppTheme):**
```dart
Text(
  'Hello',
  style: AppTheme.sectionTitleStyle,
)
```

### 3. Common Usage Examples

#### Colors
```dart
// Primary color
color: AppTheme.primaryColor

// AppBar background
backgroundColor: AppTheme.appBarColor

// Win/Draw/Loss colors
color: AppTheme.winColor
color: AppTheme.drawColor
color: AppTheme.lossColor
```

#### Text Styles
```dart
// Page headings
style: AppTheme.headingStyle

// Section titles
style: AppTheme.sectionTitleStyle

// Card titles
style: AppTheme.cardTitleStyle

// Body text on dark background
style: AppTheme.bodyTextStyle

// Body text on light/card background
style: AppTheme.bodyTextOnCardStyle

// Small text/captions
style: AppTheme.smallTextStyle

// Stat labels and values
style: AppTheme.statLabelStyle
style: AppTheme.statValueStyle

// Player names
style: AppTheme.playerNameStyle

// Kit/Jersey titles
style: AppTheme.kitTitleStyle
```

#### Customizing Styles
You can modify existing styles using `copyWith()`:
```dart
Text(
  'Custom',
  style: AppTheme.headingStyle.copyWith(
    color: Colors.red,  // Override just the color
  ),
)
```

#### Spacing
```dart
// Vertical spacing
AppTheme.smallVerticalSpace
AppTheme.mediumVerticalSpace
AppTheme.normalVerticalSpace
AppTheme.largeVerticalSpace

// Horizontal spacing
AppTheme.smallHorizontalSpace
AppTheme.mediumHorizontalSpace
AppTheme.normalHorizontalSpace
AppTheme.largeHorizontalSpace

// Custom spacing
AppTheme.verticalSpace(32.0)
AppTheme.horizontalSpace(20.0)
```

#### Padding Values
```dart
padding: EdgeInsets.all(AppTheme.paddingNormal)
padding: EdgeInsets.symmetric(
  horizontal: AppTheme.paddingMedium,
  vertical: AppTheme.paddingSmall,
)
```

#### Border Radius
```dart
borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge)

// Or use the helper
shape: AppTheme.cardShape(radius: AppTheme.borderRadiusMedium)
```

#### Gradients
```dart
// Standard background gradient
decoration: AppTheme.backgroundGradient

// Chelsea blue gradient
decoration: AppTheme.chelseaBlueGradient
```

#### Icon Sizes
```dart
Icon(
  Icons.star,
  size: AppTheme.iconSizeMedium,
  color: AppTheme.primaryColor,
)
```

#### Card Elevation
```dart
Card(
  elevation: AppTheme.cardElevationMedium,
  // ...
)
```

## Making Global Changes

### Change Font Size Across All Pages
Edit `lib/config/app_theme.dart`:
```dart
// Change base font sizes
static const double fontSizeNormal = 18.0;  // was 16.0
static const double fontSizeLarge = 20.0;   // was 18.0
```

### Change Font Family Across All Pages
```dart
static const String fontFamily = 'YourCustomFont';
```
(Remember to add the font to `pubspec.yaml` first)

### Change Primary Color
```dart
static const Color primaryColor = Color(0xFF123456);  // New color
```

### Change AppBar Style
```dart
static Color appBarColor = Colors.red.shade800;
```

## Benefits of This Approach

1. **Consistency**: All screens use the same styling rules
2. **Maintainability**: Change one value to update the entire app
3. **Clean Architecture**: Separates styling from business logic
4. **Scalability**: Easy to add new themes or dark mode
5. **Readability**: `AppTheme.headingStyle` is clearer than inline styles

## Current Implementation Status

✅ **Fully implemented:**
- `lib/screens/kits_page.dart`
- `lib/screens/stats_page.dart` (partial)

⚠️ **Partially implemented:**
- `lib/screens/accolades_page.dart` (import added, can use theme)
- `lib/screens/legends_page.dart` (import added, can use theme)
- `lib/screens/history_page.dart` (import added, can use theme)

## Next Steps

1. Replace remaining hardcoded colors in `stats_page.dart`, `accolades_page.dart`, `legends_page.dart`, and `history_page.dart`
2. Consider adding dark mode support by creating `AppTheme.dark()` variant
3. Add custom font family by updating `pubspec.yaml` and `AppTheme.fontFamily`

## Example: Before and After

### Before (kits_page.dart)
```dart
const Color chelseaBlue = Color(0xFF034694);

Text(
  '${kit.year} ${kit.type} Kit',
  style: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w900,
    color: chelseaBlue,
  ),
)
```

### After (kits_page.dart)
```dart
import '../config/app_theme.dart';

Text(
  '${kit.year} ${kit.type} Kit',
  style: AppTheme.kitTitleStyle,
)
```

Now to change the font size of all kit titles, just edit `AppTheme.kitTitleStyle` once!

---

**Last updated:** December 4, 2025
