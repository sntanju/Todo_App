import 'package:todo_app/src/features/todo/domain/entities/task_entity.dart';
import 'package:todo_app/src/features/todo/data/datasources/task_local_datasource.dart';
import 'package:todo_app/src/features/todo/data/models/task_model.dart';

import '../../domain/repositories/interface_task_repository.dart';

class TaskRepositoryImpl implements ITaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addTask(TaskEntity task) async {
    await localDataSource.addTask(TaskModel.fromEntity(task));
  }

  @override
  Future<void> deleteTask(String id) async {
    await localDataSource.deleteTask(id);
  }

  @override
  Future<List<TaskEntity>> getTasks() async {
    final models = await localDataSource.getTasks();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    await localDataSource.updateTask(TaskModel.fromEntity(task));
  }
}
