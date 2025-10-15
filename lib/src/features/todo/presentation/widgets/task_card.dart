import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/task_entity.dart';
import '../providers/provider_task.dart';

class TaskCard extends StatelessWidget {
  final TaskEntity task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderTask>(context, listen: false);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: task.isCompleted ? Colors.green.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: GestureDetector(
          onTap: () => provider.toggleTaskCompletion(task),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: Icon(
              task.isCompleted
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              key: ValueKey(task.isCompleted),
              color: task.isCompleted ? Colors.green : Colors.grey,
              size: 28,
            ),
          ),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            decoration:
            task.isCompleted ? TextDecoration.lineThrough : null,
            color: task.isCompleted ? Colors.black54 : Colors.black87,
          ),
        ),
        subtitle: task.description == null || task.description!.isEmpty
            ? null
            : Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
            task.description!,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blueAccent),
              tooltip: "Edit Task",
              onPressed: () => _showEditDialog(context, provider, task),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              tooltip: "Delete Task",
              onPressed: () => provider.deleteTask(task.id),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showEditDialog(
      BuildContext context, ProviderTask provider, TaskEntity task) async {
    final titleController = TextEditingController(text: task.title);
    final descController = TextEditingController(text: task.description ?? '');

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text('Edit Task', style: TextStyle(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final updated = task.copyWith(
                title: titleController.text.trim(),
                description: descController.text.trim(),
              );
              await provider.editTask(updated);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
