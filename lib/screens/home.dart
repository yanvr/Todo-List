import 'package:flutter/material.dart';
import 'package:todo_list_app/services/task_service.dart';
import 'package:todo_list_app/utils/datetime_formatter.dart';

import '../entities/task.dart';
import 'add_task.dart';
import 'edit_task.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TaskService _service = TaskService();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
        actions: <Widget>[
          IconButton(
            onPressed: _showAlertDialog,
            icon: const Icon(Icons.filter_alt_rounded),
          )
        ],
      ),
      body: StreamBuilder<List<Task>>(
        stream: _service.getAllTask(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Ops! Houve algum erro. ${snapshot.error}");
          } else if (snapshot.hasData) {
            final tasks = snapshot.data!;
            return ListView(children: tasks.map(buildTask).toList());
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ), // Th
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AddTask())),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildTask(Task task) => Card(
        child: ListTile(
          title: Text(
              "${task.title} - ${DateTimeFormatter.toStringDate(task.taskDate!)}"),
          subtitle: Text(task.description.toString()),
          tileColor: Colors.white,
          leading: Checkbox(
            value: task.isCompleted,
            checkColor: Colors.white,
            onChanged: (bool? value) => {
              setState(() {
                task.isCompleted = value!;
                _service.updateIsCompletedField(task);
              })
            },
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _service.delete(task),
          ),
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => EditTask(task))),
        ),
      );

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert!'),
          content: Text("content"),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                ///Insert here an action, in your case should be:
                ///  Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
