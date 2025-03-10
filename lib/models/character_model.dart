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

  // 🔹 Convertir JSON a un objeto Character
  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      nombre: json['nombre'],
      nivel: json['nivel'],
      salud: json['salud'],
      mana: json['mana'],
    );
  }
}
