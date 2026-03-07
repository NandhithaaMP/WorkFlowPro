import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../models/project_model.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {

  List<ProjectModel> projects = [
    ProjectModel(title: "ERP System", description: "Company ERP App"),
    ProjectModel(title: "Ecommerce App", description: "Online shopping platform"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("Projects"),
        backgroundColor: AppColors.primary,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          showAddProjectDialog();
        },
        child: const Icon(Icons.add),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: projects.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {

            final project = projects[index];

            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.2),
                    blurRadius: 8,
                  )
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    project.title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    project.description,
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const Spacer(),

                  const Row(
                    children: [
                      Icon(Icons.folder, size: 18),
                      SizedBox(width: 5),
                      Text("Open Project")
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void showAddProjectDialog() {

    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {

        return AlertDialog(
          title: const Text("Create Project"),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Project Title",
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: descController,
                decoration: const InputDecoration(
                  labelText: "Description",
                ),
              ),
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
                  projects.add(
                    ProjectModel(
                      title: titleController.text,
                      description: descController.text,
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