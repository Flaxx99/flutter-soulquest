class Character {
  final int id;
  final String nombre;
  final int nivel;
  final int salud;
  final int mana;

  Character({
    required this.id,
    required this.nombre,
    required this.nivel,
    required this.salud,
    required this.mana,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] ?? 0,
      nombre: json['nombre'] ?? 'Desconocido',
      nivel: json['nivel'] ?? 1,
      salud: json['salud'] ?? 100,
      mana: json['mana'] ?? 50,
    );
  }
}
