# ChelseaFC_Archive

ChelseaFC_Archive is a Flutter app built as a digital archive for Chelsea FC. It brings together kits, legends, trophies, statistics, and club history in one place with a simple, mobile-friendly interface.

## Features

- Browse Chelsea FC kits by season.
- Explore club legends and key player profiles.
- View trophies and major honors.
- Check club stats and historical information.
- Navigate through a clean, structured archive layout.

## Tech Stack

- Flutter
- Dart
- Firebase Core
- Firebase Storage
- Shimmer loading effects
- Flutter staggered animations

## Getting Started

### Prerequisites

- Flutter SDK installed
- Android Studio, VS Code, or another Flutter-compatible editor
- A connected device, emulator, or simulator

### Installation

```bash
git clone https://github.com/Vermily/ChelseaFC_Archive.git
cd fpl_app
flutter pub get
```

### Run the app

```bash
flutter run
```

## Build for release

### Android

```bash
flutter build apk
```

### iOS

```bash
flutter build ios
```

### Web

```bash
flutter build web
```

## Project Structure

- `lib/` - App source code
- `lib/screens/` - Main screens and pages
- `lib/data/` - Static data used in the archive
- `lib/services/` - App services and data loading helpers
- `assets/` - Images, icons, and trophies
- `android/`, `ios/`, `web/`, `windows/`, `macos/`, `linux/` - Platform folders

## Notes

- The app includes Firebase configuration for storage-backed content.
- Some assets are bundled locally for faster offline browsing.
- If you add screenshots later, place them in the README to make the repository page more visual.
