class Album {
  final String nombreBanda;
  final String nombreAlbum;
  final int anio;
  final String? id;

  Album({
    required this.nombreBanda,
    required this.nombreAlbum,
    required this.anio,
    this.id,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      nombreBanda: json['nombre_banda'],
      nombreAlbum: json['nombre_album'],
      anio: json['anio'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre_banda': nombreBanda,
      'nombre_album': nombreAlbum,
      'anio': anio,
    };
  }
}
