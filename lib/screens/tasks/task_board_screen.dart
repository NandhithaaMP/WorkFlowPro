import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../models/task_model.dart';

class TaskBoardScreen extends StatefulWidget {
  const TaskBoardScreen({super.key});

  @override
  State<TaskBoardScreen> createState() => _TaskBoardScreenState();
}

class _TaskBoardScreenState extends State<TaskBoardScreen> {

  List<TaskModel> tasks = [
    TaskModel(title: "Design Login UI", status: "todo"),
    TaskModel(title: "API Integration", status: "progress"),
    TaskModel(title: "Deploy Web App", status: "done"),
  ];

  @override
  Widget build(BuildContext context) {

    List<TaskModel> todo =
        tasks.where((task) => task.status == "todo").toList();

    List<TaskModel> progress =
        tasks.where((task) => task.status == "progress").toList();

    List<TaskModel> done =
        tasks.where((task) => task.status == "done").toList();

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("Task Board"),
        backgroundColor: AppColors.primary,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          showAddTaskDialog();
        },
        child: const Icon(Icons.add),
      ),

      body: Row(
        children: [

          buildColumn("To Do", todo),

          buildColumn("In Progress", progress),

          buildColumn("Completed", done),
        ],
      ),
    );
  }

  Widget buildColumn(String title, List<TaskModel> tasks) {

    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Column(
          children: [

            Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {

                  final task = tasks[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Text(task.title),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void showAddTaskDialog() {

    TextEditingController taskController = TextEditingController();
    String selectedStatus = "todo";

    showDialog(
      context: context,
      builder: (context) {

        return AlertDialog(
          title: const Text("Create Task"),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              TextField(
                controller: taskController,
                decoration:
                    const InputDecoration(labelText: "Task Title"),
              ),

              const SizedBox(height: 10),

              DropdownButtonFormField(
                value: selectedStatus,
                items: const [

                  DropdownMenuItem(
                      value: "todo", child: Text("To Do")),

                  DropdownMenuItem(
                      value: "progress",
                      child: Text("In Progress")),

                  DropdownMenuItem(
                      value: "done",
                      child: Text("Completed")),
                ],
                onChanged: (value) {
                  selectedStatus = value!;
                },
              )
            ],
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),

            ElevatedButton(
              onPressed: () {

                setState(() {
                  tasks.add(
                    TaskModel(
                      title: taskController.text,
                      status: selectedStatus,
                    ),
                  );
                });

                Navigator.pop(context);
              },
              child: const Text("Create"),
            )
          ],
        );
      },
    );
  }
}