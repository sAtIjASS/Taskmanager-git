class appexception implements Exception{
  final _message;
  final _prefix;
  appexception([this._message,this._prefix]);
  String toString(){
    return "$_prefix$_message";
  }
}
class Internetexception extends appexception{
 Internetexception(String? message):super(message,"No satija internet");
}
class requestexception extends appexception{
  requestexception(String? message):super(message,"request failed");
}
class responseexception extends appexception{
  responseexception(String?message):super( message,"response failed");
}
class serverexception extends appexception{
  serverexception(String?message):super(message,"Request Time out");
}