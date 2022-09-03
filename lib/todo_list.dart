import "package:flutter/material.dart";
import "model.dart";

class TodoList extends StatelessWidget {
  final List<Modellen> listan;

  TodoList(this.listan);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listan.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Text(
              listan[index].title,
              style: TextStyle(
                  color: Color.fromARGB(255, 152, 30, 233),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
            ),
            Text(listan[index].comment,
                style: TextStyle(
                    color: Color.fromARGB(255, 152, 30, 233),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                    fontSize: 15)),
            Text(listan[index].date,
                style: TextStyle(
                    color: Color.fromARGB(255, 152, 30, 233),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                    fontSize: 15))
          ],
        );
      },
    );
  }
}
