import 'package:shared_preferences/shared_preferences.dart';

// URL base del servidor, siempre usar la IP correspondiente y no la de localhost
String base = "http://10.20.137.147:8081/api/v1/";


// Función para guardar una cadena de texto en las preferencias compartidas
// key: la clave con la que se guardará la cadena de texto
// value: la cadena de texto que se desea guardar
_guardar(String key, String value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString(key, value);
}

// Función para obtener una cadena de texto de las preferencias compartidas
// esta funcion retorna un future object que se resolvera con la cadena de texto asociada a la clave
//especificada
Future<String>_obtener(String key/*, String value*/) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final data = await preferences.getString(key);
  return data.toString();
}