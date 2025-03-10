import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase_config.dart'; // Asegúrate de que este archivo exista
import 'screens/character_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 🔹 Asegura la inicialización de Flutter

  // 🔹 Cargar variables de entorno desde el archivo .env (si lo usas)
  try {
    await dotenv.load(fileName: "assets/.env");
    print("✅ Variables de entorno cargadas correctamente.");
  } catch (e) {
    print("❌ Error al cargar .env: $e");
  }

  // 🔹 Inicializar Supabase
  try {
    await Supabase.initialize(
      url: SupabaseConfig.supabaseUrl, // Usa los valores de configuración
      anonKey: SupabaseConfig.supabaseKey,
    );
    print("✅ Supabase inicializado correctamente.");
  } catch (e) {
    print("❌ Error al inicializar Supabase: $e");
  }

  runApp(const MyApp());
}

// 🔹 Definir la estructura principal de la app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SoulQuest',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:
          CharacterScreen(), // 🔹 Pantalla principal con los datos del personaje
    );
  }
}
