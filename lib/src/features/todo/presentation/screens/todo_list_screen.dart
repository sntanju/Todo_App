import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/provider_task.dart';
import '../widgets/add_task_bottomsheet.dart';
import '../widgets/task_card.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderTask>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('TodoFlow')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const AddTaskBottomSheet(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.tasks.isEmpty
          ? const Center(child: Text('No tasks yet. Tap + to add.'))
          : ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: provider.tasks.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final task = provider.tasks[index];
          return TaskCard(task: task);
        },
      ),
    );
  }
}
