import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:group_radio_button/group_radio_button.dart';

import 'Mascota.dart';
import 'Persona.dart';
import 'Infoclient.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mascotas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'INFORMACION'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool VAR = false;
  String _selectPER = "Mujer";
  String _selectMAS = "Perro";

  List<Persona> ARRAYPER = new List<Persona>();
  List<Mascota> ARRAYMAS = new List<Mascota>();
  Persona OBJPer;
  Mascota OBJMas;

  TextEditingController TXTNombre;
  TextEditingController TXTApellidos;
  TextEditingController TXTEdad;
  TextEditingController TXTSexo;

  TextEditingController TXTTipoMascota;
  TextEditingController TXTNombreMascota;
  TextEditingController TXTEdadMascota;

  Timer _timer = null;
  int _start = 2;
  int conta = 0;

  @override
  void initState() {
    super.initState();

    TXTNombre = TextEditingController();
    TXTApellidos = TextEditingController();
    TXTEdad = TextEditingController();
    TXTSexo = TextEditingController();

    TXTTipoMascota = TextEditingController();
    TXTNombreMascota = TextEditingController();
    TXTEdadMascota = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();

    TXTNombre.dispose();
    TXTApellidos.dispose();
    TXTEdad.dispose();
    TXTSexo.dispose();
    TXTTipoMascota.dispose();
    TXTNombreMascota.dispose();
    TXTEdadMascota.dispose();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            VAR = !VAR;
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

  void PantallaINFOCLIENT(BuildContext context) {
    OBJPer = new Persona();
    OBJMas = new Mascota();

    if (!TXTNombre.text.isEmpty &&
        !TXTApellidos.text.isEmpty &&
        !TXTEdad.text.isEmpty &&
        !TXTNombreMascota.text.isEmpty &&
        !TXTEdadMascota.text.isEmpty) {
      OBJPer.setNombre(TXTNombre.text);
      OBJPer.setApellido(TXTApellidos.text);
      OBJPer.setEdad(TXTEdad.text);
      OBJPer.setSexo(_selectPER);
      ARRAYPER.add(OBJPer);

      OBJMas.setNombreM(TXTNombreMascota.text);
      OBJMas.setTipoM(_selectMAS);
      OBJMas.setEdadM(TXTEdadMascota.text);
      ARRAYMAS.add(OBJMas);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Infoclient(ARRAYPER, ARRAYMAS)),
      );

      TXTNombre.clear();
      TXTApellidos.clear();
      TXTEdad.clear();
      TXTSexo.clear();
      TXTNombreMascota.clear();
      TXTEdadMascota.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (conta == 0) {
      startTimer();
      conta = 1;
    }
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      //resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromARGB(200, 58, 128, 87),
      ),
      body: Stack(
        children: <Widget>[
          _buildFondo(15, -50, 4.5, 4.5, 38, 68, 52), //24,410
          _buildFondo(112, -58, 4, 1, 58, 128, 87), // 3.214,418
          _buildFondo(220, -57, 4, 1, 94, 196, 101), // 1.63 ,417
          _buildFondo(312, -35, 4, 1.3, 204, 222, 212), //1.15 ,395
          _buildFondo(360, 54, 4, 1.4, 229, 237, 232), // 1,414
          ListView(
            //SingleChildScrollView
            physics: NeverScrollableScrollPhysics(),
            //physics: ClampingScrollPhysics(),
            reverse: true,
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.only(top: 130),
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: _buildStructurForm()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFondo(double LEFT, double TOP, double WIDTH, double HEIGHT,
          int C1, int C2, int C3) =>
      Container(
          child: Positioned(
        left: LEFT,
        top: TOP,
        child: Transform(
            alignment: Alignment.topLeft, //origin: Offset(0,0)
            transform: Matrix4.rotationZ(0.6),
            child: Column(
              children: [
                Container(
                  color: Color.fromARGB(255, C1, C2, C3),
                  width: MediaQuery.of(context).size.width / WIDTH,
                  height: MediaQuery.of(context).size.height / HEIGHT,
                ),
              ],
            )),
      ));

//Codigo para pantalla 1

  Widget _buildStructurForm() => Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(top: 90),
            decoration: BoxDecoration(color: Colors.transparent),
            //Aqui va el fondo;
            child: Column(
              children: <Widget>[
                _buildForm(),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            left: VAR ? MediaQuery.of(context).size.width / 3.2 : 0,
            top: 2,
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.transparent,
              child: Image(
                image: AssetImage(
                  "assets/icono_perro_gato.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      );

  Widget _buildForm() => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.5, //452
        padding: const EdgeInsets.only(top: 60),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                children: <Widget>[
                  //Formulario para las personas
                  Text(
                    "Datos Persona:",
                    style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 10,
                  ),
                  _buildTXTs(TextInputType.text, TXTNombre, "Nombre"),
                  Container(
                    height: 10,
                  ),
                  _buildTXTs(TextInputType.text, TXTApellidos, "Apellidos"),
                  Container(
                    height: 10,
                  ),
                  _buildTXTs(TextInputType.number, TXTEdad, "Edad"),
                  Container(
                    margin: const EdgeInsets.only(left: 70.0),
                    child: Row(
                      children: [
                        Text(
                          "Soy:     ",
                          style: TextStyle(
                            fontFamily: 'Arial',
                          ),
                        ),
                        _buildRADIO_PER(),
                      ],
                    ),
                  ),
                  //Formulario para las mascotas
                  Text(
                    "Datos Mascota:",
                    style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 70.0),
                    child: Row(
                      children: [
                        Text(
                          "Tengo:     ",
                          style: TextStyle(
                            fontFamily: 'Arial',
                          ),
                        ),
                        _buildRADIO_MAS(),
                      ],
                    ),
                  ),
                  _buildTXTs(TextInputType.text, TXTNombreMascota,
                      "Nombre de mi mascota"),
                  Container(
                    height: 10,
                  ),
                  _buildTXTs(TextInputType.number, TXTEdadMascota,
                      "Edad de mi mascota"),
                  Container(
                    //padding: const EdgeInsets.only(right: 20),
                    width: MediaQuery.of(context).size.width / 1.2,
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 38, 68, 52)),
                      ),
                      onPressed: () {
                        PantallaINFOCLIENT(context);
                      },
                      child: const Text('Registrar',
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildTXTs(TextInputType tipe, TextEditingController TC, String HT) =>
      Container(
          padding: const EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 58, 128, 87),
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width / 1.4,
          height: MediaQuery.of(context).size.height / 25,
          alignment: AlignmentDirectional.centerStart,
          child: TextField(
              controller: TC,
              keyboardType: tipe,
              style: TextStyle(color: Colors.black, fontSize: 15),
              decoration: InputDecoration.collapsed(
                hintText: HT,
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 168, 170, 146), fontSize: 15),
              )));

  Widget _buildRADIO_PER() => RadioButtonGroup(
        orientation: GroupedButtonsOrientation.HORIZONTAL,
        //margin: const EdgeInsets.only(left: 100.0),
        onSelected: (String selected) => setState(() {
          _selectPER = selected;
        }),
        labels: <String>[
          "Hombre",
          "Mujer",
        ],
        //picked: _selectPER,
        itemBuilder: (Radio rb, Text txt, int i) {
          return Row(
            children: <Widget>[
              //Text(i.toString()),
              txt,
              rb,
            ],
          );
        },
      );
  Widget _buildRADIO_MAS() => RadioButtonGroup(
        orientation: GroupedButtonsOrientation.HORIZONTAL,
        //margin: const EdgeInsets.only(left: 100.0),
        onSelected: (String selected) => setState(() {
          _selectMAS = selected;
        }),
        labels: <String>[
          "Perro",
          "Gato",
        ],
        //picked: _selectMAS,
        itemBuilder: (Radio rb, Text txt, int i) {
          return Row(
            children: <Widget>[
              //Text(i.toString()),
              txt,
              rb,
            ],
          );
        },
      );
}
