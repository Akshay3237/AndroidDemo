import 'package:learn/logic/mysql.dart';
import 'package:mysql1/mysql1.dart';

class Person {
  String? name;
  String? phone;


  Person(this.name, this.phone);

  Future<void> save() async {
    // print("good");
    final con=await MySql().getConnection();
    try {

      print("good");
      var q=await con.query('INSERT INTO person(person_name,phone) values(?,?)',[name,int.parse(phone.toString())]);
      print('Inserted row id=${q.insertId}');
      // print("he");

    } catch (e) {
      print("in");
      print('Error: $e');

    } finally {
       con.close();

    }

  }
}
