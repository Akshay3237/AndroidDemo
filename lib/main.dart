import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'logic/contact.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: "frist app",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)
        ),
        home: Home(),
      );
  }

}

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }

}

class _Home extends State<Home>{

  List<Contact> contacts=List.empty(growable: true);
  TextEditingController controllerName=TextEditingController();
  TextEditingController controllerContact=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title:Center(child: Text("First application",style: TextStyle(color: Colors.lightBlueAccent),)),
          backgroundColor:Colors.blue,
        ),
        body: Center(
          child: Container(
            height:300,
            width: 400,

            child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controllerName,
                    decoration: InputDecoration(
                        hintText: "Enter your name",
                        border: OutlineInputBorder()
                    ),

                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: controllerContact,
                      keyboardType:TextInputType.number,

                      decoration: InputDecoration(
                          hintText:"Enter phone number",
                          border: OutlineInputBorder()
                      )
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(onPressed:() {
                          setState(() {
                            contacts.add(Contact(name: controllerName.text.toString(), contact: controllerContact.text.toString()));
                            controllerName.text="";
                            controllerContact.text="";
                          });
                      }, child: Text("Save",style: TextStyle(color: Colors.red,fontSize: 10),)),
                      ElevatedButton(onPressed:() {
                        print("update is called");
                      }, child: Text("update",style: TextStyle(color: Colors.red,fontSize: 10),
                      ),
                        onLongPress: ()=> print("long update called"),
                      )
                    ],
                  ),
                ),
                contacts.isEmpty ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("list is empty"),
                ):
                Expanded(
                  child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder:(context,index)=> getRow(context,index) ),
                )
              ],
            ),
          ),
        ),
      );
  }

 Widget getRow(context,int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(contacts[index].name[0]),
          backgroundColor: (index%2==0)?Colors.redAccent:Colors.green,
          foregroundColor: Colors.yellowAccent,
        ),
        title:Column(
          children: [
            Text(
              contacts[index].name,
            ),
            Text(
              contacts[index].contact
            )
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                onTap: (){

                  setState(() {
                    contacts[index].name=controllerName.text.toString();
                    contacts[index].contact=controllerContact.text.toString();
                    controllerContact.text="";
                    controllerName.text="";
                  });


                },
                  child: Icon(Icons.edit)),
              InkWell(
                  onTap: (){
                    setState(() {
                      contacts.removeAt(index);
                    });

                  },
                  child: Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
 }

}