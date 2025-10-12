import 'package:hive/hive.dart';
import '../models/task_model.dart';

class TaskLocalDataSource {
  static const String boxName = 'tasks_box';

  Box<TaskModel> get _box => Hive.box<TaskModel>(boxName);

  Future<void> openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox<TaskModel>(boxName);
    }
  }

  Future<List<TaskModel>> getTasks() async {
    await openBox();
    return _box.values.toList();
  }

  Future<void> addTask(TaskModel task) async {
    await openBox();
    await _box.put(task.id, task);
  }

  Future<void> updateTask(TaskModel task) async {
    await openBox();
    await _box.put(task.id, task);
  }

  Future<void> deleteTask(String id) async {
    await openBox();
    await _box.delete(id);
  }
}
