import '../repositories/interface_task_repository.dart';
import '../entities/task_entity.dart';

class GetTasksUseCase {
  final ITaskRepository repository;
  GetTasksUseCase(this.repository);
  Future<List<TaskEntity>> call() => repository.getTasks();
}
