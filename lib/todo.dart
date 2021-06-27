import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var input;
  List<dynamic> lst = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text("${lst[index]}"),
                  trailing: Container(
                    width: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Edit Task"),
                                    content: TextField(
                                      onChanged: (value) {
                                        input = value;
                                      },
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              lst.replaceRange(
                                                  index, index + 1, {input});
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Edit"))
                                    ],
                                  );
                                });
                          },
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onTap: () {
                            setState(() {
                              lst.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ));
          }),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Add Task"),
                          content: TextField(
                            autofocus: true,
                            onChanged: (value) {
                              input = value;
                            },
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Raleway",
                            ),
                          ),
                          
                          actions: [
                            Center(
                              child: SizedBox(
                                height: 50,
                                width: 80,
                                child: ElevatedButton(
                                  
                                  onPressed: () {
                                    setState(() {
                                      lst.add(input);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  
                                  child: Text(
                                    "Add",
                                    style: TextStyle(
                                      fontFamily: "Raleway",
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      });
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.deepPurpleAccent,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
