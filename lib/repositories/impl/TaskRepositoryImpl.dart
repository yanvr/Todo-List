import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list_app/entities/task.dart';
import 'package:todo_list_app/repositories/itask_repository.dart';

class TaskRepositoryImpl implements ITaskRepository {
  final COLLECTION_NAME = 'tasks';

  @override
  Future<void> save(Task task) async {
    var docTask = FirebaseFirestore.instance.collection(COLLECTION_NAME).doc();
    await docTask.set(task.toJson(docTask.id));
  }

  @override
  Stream<List<Task>> getAllTask() {
    return FirebaseFirestore.instance
        .collection(COLLECTION_NAME)
        .orderBy("createdDate", descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList());
  }

  @override
  Future<void> update(Task task) async {
    await FirebaseFirestore.instance
        .collection(COLLECTION_NAME)
        .doc(task.id)
        .update({'title': task.title, 'description': task.description});
  }

  @override
  Future<void> delete(taskId) async {
    await FirebaseFirestore.instance
        .collection(COLLECTION_NAME)
        .doc(taskId)
        .delete();
  }

  @override
  Future<void> updateIsCompletedField(Task task) async {
    await FirebaseFirestore.instance
        .collection(COLLECTION_NAME)
        .doc(task.id)
        .update({'isCompleted': task.isCompleted});
  }

  @override
  Stream<List<Task>> getAllTaskByStatus(bool isCompleted) {
    return FirebaseFirestore.instance
        .collection(COLLECTION_NAME)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Task.fromJson(doc.data()))
            .where((task) => task.isCompleted == isCompleted)
            .toList());
  }
}
