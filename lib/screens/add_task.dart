import 'package:flutter/material.dart';
import 'package:todo_list_app/services/task_service.dart';
import 'package:todo_list_app/widgets/widget_botao.dart';
import 'package:todo_list_app/widgets/widget_input_date.dart';

import '../entities/task.dart';
import '../widgets/widget_input_text.dart';
import 'home.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _date = TextEditingController();
  final TaskService _service = TaskService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar tarefa"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InputText("Título", _title),
          InputText("Descrição", _description),
          InputDate(_date),
          Button("Salvar", () => _saveTask(context, const Home())),
        ],
      ),
    );
  }

  Future<void> _saveTask(context, route) {
    Task task = Task();
    task.title = _title.text;
    task.description = _description.text;
    task.taskDate = DateTime.parse(_date.text);

    _service.save(task);

    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => route));
  }
}
