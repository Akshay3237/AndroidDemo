import 'package:learn/logic/Person.dart';
import 'package:learn/logic/mysql.dart';
import 'package:mysql1/mysql1.dart';


void main() async {
  // var mySql = MySql();
  // var conn = await mySql.getConnection();
  // var q=await conn.query('INSERT INTO person(person_name,phone) values(?,?)',['niraj',1254785214]);
  // print(q);
  Person("rata","4562789562").save();
  // final Results results = await conn.query('SELECT * FROM person');
  // for (final ResultRow row in results) {
    // print('Person ID: ${row[0]}, Person Name: ${row[1]}, Phone: ${row[2]}');
  // }
  // await conn.close();
}