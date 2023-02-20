import 'dart:developer';

import 'package:biblioteca_movil/utiles/conexionWS.dart';
import 'package:biblioteca_movil/servicios/inicioSesionService.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
class SesionLogin extends StatefulWidget {
  const SesionLogin({Key? key}) : super(key: key);

  @override
  State<SesionLogin> createState() => _SesionLoginState();
}

class _SesionLoginState extends State<SesionLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController claveController = TextEditingController();
  ConexionWS conexionWS = new ConexionWS();

  InicioSesionService inicioSesionService = new InicioSesionService();


  void _iniciar() {
    setState(() {
      if(_formKey.currentState!.validate()) {
        Map<dynamic, dynamic> data = {
          "correo":correoController.text,
          "clave":claveController.text
        };
        inicioSesionService.inicio_sesion(data).then((value) {
          if(value.token != ""){
            final SnackBar mensaje = SnackBar(content: Text("Bienvenido"));
            ScaffoldMessenger.of(context).showSnackBar(mensaje);
          }else{
            final SnackBar mensaje1 =SnackBar(content: Text(value.msg));
            ScaffoldMessenger.of(context).showSnackBar(mensaje1);
          }
          //log('SesionView:login');
          //log(value.token);
        });
        //conexionWS.solicitudPost('inicio_sesion', data, ConexionWS.NO_TOKEN);
        //conexionWS.solicitudGet('libros', ConexionWS.NO_TOKEN);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.blueAccent[100],
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 90.0),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  maxRadius: 100.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('img/login.png'),
                ),
                const Text(
                  'Inicio de sesion',
                  style: TextStyle(fontFamily: 'Lora', fontSize: 50.0),
                ),
                SizedBox(
                  width: 160.0,
                  height: 15.0,
                  child: Divider(color: Colors.blueAccent[600]),
                ),
                TextFormField(
                  enableInteractiveSelection: false,
                  controller: correoController,
                  decoration: const InputDecoration(
                    hintText: 'Correo',
                    labelText: 'Ingresre su correo',
                    suffixIcon: Icon(Icons.alternate_email),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Correo requerido';
                    }
                    if(!isEmail(value)){
                      return 'Debe ser un correo valido';
                    }
                  },
                ),
                const Divider(
                  height: 18.0,
                ),
                TextFormField(
                  enableInteractiveSelection: false,
                  obscureText: true,
                  controller: claveController,
                  decoration: const InputDecoration(
                    hintText: 'Clave',
                    labelText: 'Ingrese su clave',
                    suffixIcon: Icon(Icons.alternate_email),
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'Clave requerida';
                    }
                  },
                ),
                const Divider(
                  height: 18.0,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: _iniciar,
                  child: const Text('Iniciar sesion',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 30.0,
                          fontFamily: 'Lora')),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
