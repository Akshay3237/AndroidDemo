import 'dart:io';

void main() async {
  Calculator c=Calculator();
  var x=c.doCal();

  print(await x);
}

class Calculator{
  int? n1;
  int? n2;
  Calculator(){
    print("Enter value of n1");
    n1=int.parse(stdin.readLineSync() as String);

    print("Enter value of n2");
    n2=int.parse(stdin.readLineSync() as String);
  }

  int sum(){
     return n1!+n2!;
  }
  int mul(){
    return n1!*n2!;
  }

  int div(){
    return (n1!/n2!).round();
  }

  int sub(){
    return n1!-n2!;
  }

   Future<int?> doCal() async{
    print("Enter operator");
    var op=stdin.readLineSync() as String;
    if(op=="+") return sum();
    if(op=="-") return sub();
    if(op=="/") return div();
    if(op=="*") return mul();
    return null;
  }

}