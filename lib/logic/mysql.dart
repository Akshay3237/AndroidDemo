import 'package:mysql1/mysql1.dart';

class MySql{
  static final String HOST="localhost";
  static final String PASSWORD="";
  static final String USERNAME="root";
  static final String PORT="3306";
  static final String DB="first";
  Future<MySqlConnection> getConnection() async{
    var settings =  ConnectionSettings(
        host: HOST,
        port: int.parse(PORT),
        user: USERNAME,
        db: DB
    );

    var conn = await MySqlConnection.connect(settings);

    return conn;
  }
}