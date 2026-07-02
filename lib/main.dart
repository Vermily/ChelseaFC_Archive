import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home_page.dart';

// Manually initialize Firebase using the platform configuration files
// (android/app/google-services.json, iOS GoogleService-Info.plist).
// This avoids requiring the FlutterFire CLI / generated firebase_options.dart.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // On web, Firebase needs explicit web options (or generated
  // `firebase_options.dart`) — initializing with no options will fail.
  // To get back to the previous working state quickly, only initialize
  // Firebase on non-web platforms. If you want web Firebase support,
  // run `flutterfire configure` and replace this with:
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (!kIsWeb) {
    await Firebase.initializeApp();
  }
  runApp(const ChelseaApp());
}

class ChelseaApp extends StatelessWidget {
  const ChelseaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chelsea FC Info',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
