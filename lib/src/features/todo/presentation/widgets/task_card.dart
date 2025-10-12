import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/task_entity.dart';
import '../providers/provider_task.dart';
// import '../providers/provider_task.dart';

class TaskCard extends StatelessWidget {
  final TaskEntity task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderTask>(context, listen: false);
    return Dismissible(
      key: Key(task.id),
      background: Container(color: Colors.red, alignment: Alignment.centerRight, padding: const EdgeInsets.only(right: 20), child: const Icon(Icons.delete, color: Colors.white)),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => provider.deleteTask(task.id),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          leading: Checkbox(
            value: task.isCompleted,
            onChanged: (_) => provider.toggleTaskCompletion(task),
          ),
          title: Text(
            task.title,
            style: TextStyle(decoration: task.isCompleted ? TextDecoration.lineThrough : null),
          ),
          subtitle: task.description == null ? null : Text(task.description!),
        ),
      ),
    );
  }
}
