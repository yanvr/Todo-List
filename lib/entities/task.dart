import 'package:todo_list_app/utils/datetime_formatter.dart';

class Task {
  String? id;
  String? title;
  String? description;
  DateTime? taskDate;
  DateTime createdDate = DateTime.now();
  bool isCompleted = false;

  Task();

  Map<String, dynamic> toJson(String docId) => {
        'id': docId,
        'title': title,
        'description': description,
        'taskDate': taskDate,
        'createdDate': createdDate,
        'isCompleted': isCompleted
      };

  Task.fromJson(Map<String, dynamic> json)

      : id = json['id'],
        title = json['title'],
        description = json['description'],
        taskDate = DateTimeFormatter.fromTimestemp(json['taskDate']),
        createdDate = DateTimeFormatter.fromTimestemp(json['createdDate']),
        isCompleted = json["isCompleted"];
}
