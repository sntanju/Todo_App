import '../repositories/interface_task_repository.dart';
import '../entities/task_entity.dart';

class AddTaskUseCase {
  final ITaskRepository repository;
  AddTaskUseCase(this.repository);
  Future<void> call(TaskEntity task) => repository.addTask(task);
}
