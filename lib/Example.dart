
import 'dart:io';

void main(){
  int n1=int.parse(stdin.readLineSync() as String);
  int n2=int.parse(stdin.readLineSync() as String);

  var opt=stdin.readLineSync() as String;

  if(opt=='+') {
    print(n1+n2);
  }
  else if(opt=='*'){
    print(n1*n2);
  }
  else if(opt=='/'){
    print(n1/n2);
  }
  else if(opt=='-'){
    print(n1-n2);
  }
  else{
    print("no oprtation found");
  }


}