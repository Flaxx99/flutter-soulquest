import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  // 🔹 URL y Clave de Supabase
  static const String supabaseUrl =
      "https://xndjqdttjilurgpbdzug.supabase.co"; // Reemplaza con tu URL real
  static const String supabaseKey =
      "eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhuZGpxZHR0amlsdXJncGJkenVnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDEzNTQ4MzcsImV4cCI6MjA1NjkzMDgzN30"; // Reemplázala con la clave correcta

  // 🔹 Cliente de Supabase
  static final SupabaseClient supabase = SupabaseClient(
    supabaseUrl,
    supabaseKey,
  );
}
