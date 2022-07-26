class InicioSesion {
  InicioSesion(this.celular, this.correo);

  final String celular;
  final String correo;
}

class Persona {
  Persona(
    this.nombre,
    this.apellido_paterno,
    this.apellido_materno,
    this.carnet,
    this.altura,
    this.peso,
    this.foto,
    this.promocion_gestion,
    this.promocion_nombre,
    this.grado,
    this.antiguedad,
    this.carnet_militar,
    this.especialidad,
      this.sangre
  );

  final String nombre;
  final String apellido_paterno;
  final String apellido_materno;
  final String carnet;
  final int altura;
  final int peso;
  final String foto;

  final int promocion_gestion;
  final String promocion_nombre;

  final String grado;
  final int antiguedad;
  final String carnet_militar;
  final String especialidad;
  final String sangre;
}
