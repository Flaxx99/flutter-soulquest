import 'package:supabase_flutter/supabase_flutter.dart';
import '../supabase_config.dart'; // ✅ Asegura que la ruta es correcta
import '../models/character_model.dart'; // ✅ Importa el modelo de datos correctamente

class CharacterService {
  static final SupabaseClient supabase = SupabaseConfig.supabase;

  // 🔹 Método para obtener el personaje
  static Future<Character?> getPersonaje() async {
    try {
      final List<dynamic> response = await supabase
          .from(
            'Personajes',
          ) // 📌 Asegúrate de que el nombre de la tabla es correcto
          .select()
          .limit(1);

      print("✅ Datos recibidos de Supabase: $response");

      if (response.isNotEmpty) {
        return Character.fromJson(response.first);
      }
      return null;
    } catch (error) {
      print("❌ Error al obtener datos: $error");
      return null;
    }
  }

  // 🔹 Método para escuchar actualizaciones en tiempo real
  static Stream<Character?> listenToPersonajeUpdates() {
    return supabase
        .from('Personajes')
        .stream(primaryKey: ['id']) // 📌 Especifica la clave primaria
        .map((data) {
          if (data.isNotEmpty) {
            return Character.fromJson(data.first);
          }
          return null;
        });
  }
}
