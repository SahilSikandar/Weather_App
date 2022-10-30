
import 'package:flutter/material.dart';
class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    late String input;
   List<dynamic>todo =[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todo.add("Item 1");
    todo.add("Item 2");
    todo.add("Item 3");
    todo.add("Item 4");
    todo.add("Item 5");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Todo-List"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
           context: context,
            builder: (BuildContext context){
             return AlertDialog(
              title: Text("Add Todo List"),
               content: TextField(
                    onChanged: (String value){
                      input=value;
                    },
               ),
               actions: [

               ],
             );
            },
          );
        },
        child:Icon(
          Icons.add,
          color: Colors.white,
        ) ,
      ),
      body: ListView.builder(
          itemCount: todo.length,
          itemBuilder:(context,index){
            return Dismissible(key:Key(todo[index]), child: Card(
                    child: ListTile(
                      title: Text(todo[index]),
                    ),
            )
            );
          }

      ),
      
    );
  }
}
