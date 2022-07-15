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
    this.foto,
    this.grado,
    this.antiguedad,
    this.carnet_militar,
    this.especialidad,
  );

  final String nombre;
  final String apellido_paterno;
  final String apellido_materno;
  final String carnet;
  final String foto;
  final String grado;
  final int antiguedad;
  final String carnet_militar;
  final String especialidad;
}
