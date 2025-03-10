import 'package:flutter/material.dart';
import '../services/character_service.dart';
import '../models/character_model.dart';

class CharacterScreen extends StatefulWidget {
  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  Stream<Character?> personajeStream =
      CharacterService.listenToPersonajeUpdates();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SoulQuest - Personaje")),
      body: StreamBuilder<Character?>(
        stream: personajeStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final personaje = snapshot.data!;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ID: ${personaje.id}"),
                Text("Nombre: ${personaje.nombre}"),
                Text("Nivel: ${personaje.nivel}"),
                Text("Salud: ${personaje.salud}"),
                Text("Mana: ${personaje.mana}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
