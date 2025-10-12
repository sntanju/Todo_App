// lib/src/features/todo/domain/usecases/update_tasks_usecase.dart
import '../repositories/interface_task_repository.dart';
import '../entities/task_entity.dart';

class UpdateTaskUseCase {
  final ITaskRepository repository;
  UpdateTaskUseCase(this.repository);
  Future<void> call(TaskEntity task) => repository.updateTask(task);
}
