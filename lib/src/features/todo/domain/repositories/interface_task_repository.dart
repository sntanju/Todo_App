import '../entities/task_entity.dart';

abstract class ITaskRepository {
  Future<List<TaskEntity>> getTasks();
  Future<void> addTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<void> deleteTask(String id);
}
