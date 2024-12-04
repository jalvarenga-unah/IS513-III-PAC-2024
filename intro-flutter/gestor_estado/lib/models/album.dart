class Album {
  final String nombreBanda;
  final String nombreAlbum;
  final int anio;

  Album({
    required this.nombreBanda,
    required this.nombreAlbum,
    required this.anio,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      nombreBanda: json['nombre_banda'],
      nombreAlbum: json['nombre_album'],
      anio: json['anio'],
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
