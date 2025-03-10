import 'package:supabase_flutter/supabase_flutter.dart';
import '../supabase_config.dart';
import '../models/character_model.dart';
import 'dart:developer'; // ✅ Reemplaza print por log()

class CharacterService {
  static final SupabaseClient supabase = SupabaseConfig.supabase;

  // 🔹 Método para obtener el personaje desde Supabase
  static Future<Character?> getPersonaje() async {
    try {
      final response =
          await supabase.from('Personajes').select().limit(1).single();

      log(
        "✅ Datos recibidos de Supabase: $response",
      ); // ✅ Sustituido print por log

      return response != null
          ? Character.fromJson(response)
          : null; // ✅ Eliminada comparación innecesaria con null
    } catch (error) {
      log("❌ Error al obtener datos: $error"); // ✅ Sustituido print por log
      return null;
    }
  }

  // 🔹 Método para escuchar cambios en tiempo real
  static Stream<Character?> listenToPersonajeUpdates() {
    return supabase.from('Personajes').stream(primaryKey: ['id']).map((data) {
      return data.isNotEmpty
          ? Character.fromJson(data.first)
          : null; // ✅ Eliminada comparación innecesaria con null
    });
  }
}
