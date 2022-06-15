import 'package:todo_list_app/repositories/impl/TaskRepositoryImpl.dart';
import 'package:todo_list_app/repositories/itask_repository.dart';

import '../entities/task.dart';

class TaskService {

  final ITaskRepository _repository = TaskRepositoryImpl();

  void save(Task task) {
    _repository.save(task);
  }

  Stream<List<Task>> getAllTask() {
    return _repository.getAllTask();
  }

  Stream<List<Task>> getAllTasksByFilter(bool isCompleted) {
    return _repository.getAllTaskByStatus(isCompleted);
  }

  Future<void> update(Task task) {
    return _repository.update(task);
  }

  Future<void> delete(Task task) {
    return _repository.delete(task.id.toString());
  }

  Future<void> updateIsCompletedField(Task task) {
    return _repository.updateIsCompletedField(task);
  }
}