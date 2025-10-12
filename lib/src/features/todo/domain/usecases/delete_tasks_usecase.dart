import '../repositories/interface_task_repository.dart';

class DeleteTaskUseCase {
  final ITaskRepository repository;
  DeleteTaskUseCase(this.repository);
  Future<void> call(String id) => repository.deleteTask(id);
}
