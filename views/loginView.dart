import 'package:biblioteca_movil/utiles/conexionWS.dart';
import 'package:flutter/material.dart';

class loginView extends StatefulWidget {
  const loginView({Key? key}) : super(key: key);

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController claveController = TextEditingController();

  ConexionWS conexionWS = new ConexionWS();

  void _iniciar(){
    setState((){
      if(_formKey.currentState!.validate()){
        Map<dynamic, dynamic> data ={
          "correo": correoController.text,
          "clave": claveController.text

        };
        conexionWS.solicitudPost("inicio_sesion",data, ConexionWS.NO_TOKEN);
      }
  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  final _formKey = Global<FormState>();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController claveController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 90.0
        ),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                maxRadius: 100.0,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("imgs/login.png"),
              ),
              Text(
                "Inicio de Sesion",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 2000.0,
                height: 20.0,
                child: Divider(
                  color: Colors.black,
                  thickness: 1.5,
                  height: 15.0,
                ),
              ),
              Divider(
                height: 45.0,
                color: Colors.transparent,
              ),
              TextFormField(
                enableInteractiveSelection: false,
                controller: correoController,
                  decoration: InputDecoration(
                  labelText: "Correo Electronico",
                  suffixIcon: Icon(Icons.alternate_email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  fillColor: Colors.red
                ),
                onSubmitted:(valor){
                  _correo = valor;
                }
              ),
              Divider(
                height: 25.0,
                color: Colors.transparent,
              ),
              TextField(
                  enableInteractiveSelection: false,
                  obscureText: true,

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 90.0
        ),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                maxRadius: 100.0,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("imgs/login.png"),
              ),
              Text(
                "Inicio de Sesion",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 2000.0,
                height: 20.0,
                child: Divider(
                  color: Colors.black,
                  thickness: 1.5,
                  height: 15.0,
                ),
              ),
              Divider(
                height: 45.0,
                color: Colors.transparent,
              ),
              TextFormField(
                enableInteractiveSelection: false,
                controller: correoController,
                  decoration: InputDecoration(
                  labelText: "Correo Electronico",
                  suffixIcon: Icon(Icons.alternate_email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  fillColor: Colors.red
                ),
                onSubmitted:(valor){
                  _correo = valor;
                }
              ),
              Divider(
                height: 25.0,
                color: Colors.transparent,
              ),
              TextField(
                  enableInteractiveSelection: false,
                  obscureText: true,
                  controller: claveController,
                  decoration: InputDecoration(
                      labelText: "Clave",
                      suffixIcon: Icon(Icons.lock_outline_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      fillColor: Colors.red
                  ),
                  onSubmitted:(valor){
                    claveController = valor;
                  }
              ),
              Divider(
                height: 20.0,
                color: Colors.transparent,
              ),
              SizedBox(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.orange),

                  ),
                  child: Text(
                      "Iniciar Sesion",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0
                    ),
                  ),
                  onPressed: _iniciar,
                  {
                    print("$_clave || $_correo");
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
