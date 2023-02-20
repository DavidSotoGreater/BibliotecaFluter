
class InicioSesionWS {
  String external="";
  String correo="";
  String token="";
  InicioSesionWS({this.external="",this.correo="",this.token=""});
  InicioSesionWS.fromMap(Map <dynamic, dynamic> mapa) {
    correo = mapa["correo"];
    token = mapa["token"];
    external = mapa["external"];
  }
}