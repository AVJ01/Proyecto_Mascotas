import 'dart:async';

import 'package:flutter/material.dart';
import 'package:proyecto_mascotas/Mascota.dart';

import 'Persona.dart';

class Infoclient extends StatelessWidget {
  const Infoclient(this.ARRAYPER, this.ARRAYMAS);
  final List<Persona> ARRAYPER;
  final List<Mascota> ARRAYMAS;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Informacion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InfoclientPage(ARRAYPER: ARRAYPER, ARRAYMAS: ARRAYMAS),
    );
  }
}

class InfoclientPage extends StatefulWidget {
  InfoclientPage({Key key, this.ARRAYPER, this.ARRAYMAS}) : super(key: key);
  final List<Persona> ARRAYPER;
  final List<Mascota> ARRAYMAS;

  @override
  _InfoclientPage createState() => _InfoclientPage();
}

class _InfoclientPage extends State<InfoclientPage> {
  bool Var = false;
  Timer _timer = null;
  int _start = 10;
  int conta = 0;

  void startTimer() {
    const oneSec = const Duration(milliseconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            Var = !Var;
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (conta == 0) {
      startTimer();
      conta = 1;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenidos"),
        backgroundColor: Color.fromARGB(200, 58, 128, 87),
      ),
      body: Stack(children: <Widget>[
        Positioned(
          left: 0,
          top: 0,
          child: _buildFondo(context),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 1000),
          left: Var ? 0 : -MediaQuery.of(context).size.width,
          top: 0,
          child: Container(
            padding: const EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            //decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
            child: _buildVISTA(context),
          ),
        )
      ]),
    );
  }

  //
  Widget _buildVISTA(BuildContext context) => Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            child: Image(
              image: AssetImage(
                "assets/icono_perro_gato.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            decoration: BoxDecoration(color: Color.fromARGB(255, 58, 128, 87)),
          ),
          Text(
            "Bienvenidos",
            style: TextStyle(
              fontFamily: 'Brush',
              fontSize: 50,
              color: Color.fromARGB(255, 58, 128, 87),
            ),
          ),
          //Contenedor de info persona
          Container(
            width: 300,
            height: 130,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(255, 58, 128, 87),
                width: 3.0,
              ),
              color: Colors.white,
            ),
            child: Row(children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                child: Image(
                  image: AssetImage(
                    TIPOPER(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      TEXTOPER(),
                      style: TextStyle(
                          fontFamily: 'ArialGeo',
                          color: Color.fromARGB(255, 168, 170, 146),
                          fontSize: 15),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      TEXTOMAS(),
                      style: TextStyle(
                          fontFamily: 'ArialGeo',
                          color: Color.fromARGB(255, 168, 170, 146),
                          fontSize: 15),
                    )
                  ],
                ),
              )
            ]),
          ),
          Container(
            width: 150,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(255, 58, 128, 87),
                width: 3.0,
              ),
              color: Colors.white,
            ),
            child: Column(children: <Widget>[
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                child: Image(
                  image: AssetImage(
                    TIPOMAS(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 5,
              ),
              Text(
                NomMAS(),
                style: TextStyle(
                    fontFamily: 'ArialGeo',
                    color: Color.fromARGB(255, 168, 170, 146),
                    fontSize: 15),
              )
            ]),
          ),
          //Contenedor de info Mascota
        ],
      );

  Widget _buildFondo(BuildContext context) => Container(
        //top: 2,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.2, //158
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 207, 241, 221).withOpacity(0.5)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 37, //20
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 94, 196, 101).withOpacity(0.5)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.8, //138
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 190, 232, 207).withOpacity(0.5)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.8, //138
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 94, 196, 101).withOpacity(0.5)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.7, //138
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 58, 128, 87).withOpacity(0.5)),
            ),
          ],
        ),
      );

  String TIPOMAS() {
    String TIPO = "";
    String tem = "";
    widget.ARRAYMAS.forEach((element) {
      tem = element.getTipoM;
    });
    if (tem == "Perro") {
      TIPO = "assets/dog.png";
    } else {
      TIPO = "assets/cat.png";
    }
    return TIPO;
  }

  String NomMAS() {
    String TIPO = "";
    widget.ARRAYMAS.forEach((element) {
      TIPO = element.getNombreM;
    });

    return TIPO;
  }

  String TIPOPER() {
    String TIPO = "";
    String tem = "";
    widget.ARRAYPER.forEach((element) {
      tem = element.getSexo;
    });
    if (tem == "Hombre") {
      TIPO = "assets/user.png";
    } else {
      TIPO = "assets/woman.png";
    }
    return TIPO;
  }

  String TEXTOPER() {
    String texto = "";
    String nombre = "";
    String edad = "";
    String sexo = "";
    String apellido = "";
    widget.ARRAYPER.forEach((element) {
      nombre = element.getNombre;
      apellido = element.getApellido;
      edad = element.getEdad;
      sexo = element.getSexo;
    });
    texto += nombre + " " + apellido + " " + edad + " ";
    if (int.parse(edad) == 1) {
      texto += "año de edad ";
    } else {
      texto += "años de edad ";
    }
    texto += "y es " + sexo;

    return texto;
  }

  String TEXTOMAS() {
    String texto = "";
    String nombre = "";
    String edad = "";
    String sexo = "";
    String tipo = "";
    widget.ARRAYPER.forEach((element) {
      sexo = element.getSexo;
    });
    widget.ARRAYMAS.forEach((element) {
      nombre = element.getNombreM;
      edad = element.getEdadM;
      tipo = element.getTipoM;
    });

    if (sexo == "Hombre") {
      texto += "Dueño ";
    } else {
      texto += "Dueña ";
    }
    texto += "de un " + tipo + " de " + edad;
    if (int.parse(edad) == 1) {
      texto += " año de edad ";
    } else {
      texto += " años de edad ";
    }
    texto += "llamado: ";

    return texto;
  }
}
