//import 'package:flutter/material.dart';

class Persona {
  String Nombre;
  String Apellido;
  String Sexo;
  String Edad;

  String get getNombre {
    return Nombre;
  }

  void setNombre(String Nombre) {
    this.Nombre = Nombre;
  }

  String get getApellido {
    return Apellido;
  }

  void setApellido(String Apellido) {
    this.Apellido = Apellido;
  }

  String get getSexo {
    return Sexo;
  }

  void setSexo(String Sexo) {
    this.Sexo = Sexo;
  }

  String get getEdad {
    return Edad;
  }

  void setEdad(String Edad) {
    this.Edad = Edad;
  }
}
