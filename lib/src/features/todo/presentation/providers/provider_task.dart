import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/interface_task_repository.dart';

// import '../../domain/interfaces/interface_task_repository.dart';

class ProviderTask extends ChangeNotifier {
  final ITaskRepository repository;

  ProviderTask(this.repository);

  List<TaskEntity> _tasks = [];
  List<TaskEntity> get tasks => _tasks;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchTasks() async {
    _isLoading = true;
    notifyListeners();
    _tasks = await repository.getTasks();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addTask({
    required String title,
    String? description,
    DateTime? dueDate,
  }) async {
    final task = TaskEntity(
      id: const Uuid().v4(),
      title: title,
      description: description,
      createdAt: DateTime.now(),
      dueDate: dueDate,
    );
    await repository.addTask(task);
    await fetchTasks();
  }

  Future<void> toggleTaskCompletion(TaskEntity task) async {
    final updated = task.copyWith(isCompleted: !task.isCompleted);
    await repository.updateTask(updated);
    await fetchTasks();
  }

  Future<void> deleteTask(String id) async {
    await repository.deleteTask(id);
    await fetchTasks();
  }
}
