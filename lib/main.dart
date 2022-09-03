import "package:flutter/material.dart";
import "package:flutter/src/material/colors.dart";
import "model.dart";
import "ny_todo.dart";
import "todo_list.dart";
import "dart:io";
import "package:flutter/cupertino.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
      title: "It Högskolan Flutter App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Modellen> helaTodoListan = [];

  void startToDo(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => GestureDetector(
              child: NyTodo(addNewTodo),
            ));
  }

  void addNewTodo(String title, String comment, String date) {
    final newToDo = Modellen(title, comment, date);
    setState(() {
      helaTodoListan.add(
          newToDo); // Här lägger man till sakerna från Modellen till den nya listan
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Scaffold(
            appBar: AppBar(
              title: Text("To do app"),
            ),
            body: Center(
              child: TodoList(helaTodoListan),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => startToDo(context),
            ),
          )
        : CupertinoPageScaffold(
            child: Center(
              child: TodoList(helaTodoListan),
            ),
            navigationBar: CupertinoNavigationBar(
              middle: Text("To do app"),
              backgroundColor: Colors.orange,
              trailing: GestureDetector(
                onTap: () => startToDo(context),
                child: (Icon(Icons.add)),
              ),
              leading: CupertinoButton(
                child: Icon(Icons.arrow_back),
                onPressed: () => startToDo(context),
              ),
            ),
          );
  }
}
