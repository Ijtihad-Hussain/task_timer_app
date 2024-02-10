
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/task_model.dart';
import 'package:provider_sm/timer_provider.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Timer')),
      body: Consumer<TimerProvider>(
        builder: (context, timerProvider, child) {
          if (timerProvider.tasks.isEmpty) {
            return const Center(
              child: Text('No tasks added yet.'),
            );
          } else {
            return ListView.builder(
              itemCount: timerProvider.tasks.length,
              itemBuilder: (context, index) {
                final task = timerProvider.tasks[index];
                return ListTile(
                  title: Text(task.name),
                  subtitle: Text('Duration: ${task.duration} minutes'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(task.isActive ? Icons.pause : Icons.play_arrow),
                        onPressed: () {
                          task.isActive
                              ? timerProvider.pauseTask(index)
                              : timerProvider.startTask(index);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.replay),
                        onPressed: () {
                          timerProvider.resetTask(index);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          timerProvider.removeTask(task);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(labelText: 'Task Name'),
            onChanged: (value) {
              // You can handle the input here if needed
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add the task using the TimerProvider
                Provider.of<TimerProvider>(context, listen: false)
                    .addTask(Task(name: 'New Task', duration: 0));
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}


