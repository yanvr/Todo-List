import 'package:flutter/material.dart';
import 'package:todo_list_app/services/task_service.dart';
import 'package:todo_list_app/widgets/widget_botao.dart';
import 'package:todo_list_app/widgets/widget_input_date.dart';

import '../entities/task.dart';
import '../widgets/widget_input_text.dart';
import 'home.dart';

class EditTask extends StatefulWidget {
  final Task task;

  const EditTask(this.task, {Key? key}) : super(key: key);

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  late String _taskId = "";
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _date = TextEditingController();
  final TaskService _taskService = TaskService();

  @override
  void initState() {
    super.initState();
    _taskId = widget.task.id.toString();
    _title.text = widget.task.title.toString();
    _description.text = widget.task.description.toString();
    _date.text = widget.task.taskDate.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar tarefa"),
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
          Button("Editar", () => _updateTask(context, const Home())),
        ],
      ),
    );
  }

  Future<void> _updateTask(context, route) {
    Task task = Task();
    task.id = _taskId;
    task.title = _title.text.toString();
    task.description = _description.text.toString();
    task.taskDate = DateTime.parse(_date.text.toString());

    _taskService.update(task);

    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => route));
  }
}
