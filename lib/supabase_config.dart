import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static final SupabaseClient supabase = Supabase.instance.client;

  static Future<void> initialize() async {
    try {
      await dotenv.load(fileName: "assets/.env");
      if (dotenv.env['SUPABASE_URL'] == null || dotenv.env['SUPABASE_ANON_KEY'] == null) {
        throw Exception('Environment variables not found');
      }
      await Supabase.initialize(
        url: dotenv.env['SUPABASE_URL']!,
        anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
      );
      print('Supabase initialized successfully');
    } catch (e) {
      print('Error initializing Supabase: $e');
      rethrow;
    }
  }
}
