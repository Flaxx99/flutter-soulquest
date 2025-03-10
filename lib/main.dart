import 'package:flutter/material.dart';
import 'supabase_config.dart';
import 'screens/character_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SoulQuest',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CharacterScreen(),
    );
  }
}
