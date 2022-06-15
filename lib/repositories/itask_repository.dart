import '../entities/task.dart';

abstract class ITaskRepository {
  Future<void> save(Task task);

  Stream<List<Task>> getAllTask();

  Stream<List<Task>> getAllTaskByStatus(bool isCompleted);

  Future<void> update(Task task);

  Future<void> updateIsCompletedField(Task task);

  Future<void> delete(String taskId);
}
