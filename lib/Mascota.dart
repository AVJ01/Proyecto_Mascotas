import 'package:flutter/material.dart';

class Mascota {
  String NombreM;
  String EdadM;
  String TipoM;

  String get getNombreM {
    return NombreM;
  }

  void setNombreM(String NombreM) {
    this.NombreM = NombreM;
  }

  String get getEdadM {
    return EdadM;
  }

  void setEdadM(String EdadM) {
    this.EdadM = EdadM;
  }

  String get getTipoM {
    return TipoM;
  }

  void setTipoM(String TipoM) {
    this.TipoM = TipoM;
  }
}
