import 'package:flutter/material.dart';
import 'package:workflowpro/screens/notifications/notification.dart';
import 'package:workflowpro/screens/projects/project_screen.dart';
import 'package:workflowpro/screens/tasks/task_board_screen.dart';
import '../../core/colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [

          /// Sidebar
          Container(
            width: 220,
            color: AppColors.primary,
            child: Column(
              children:  [

                SizedBox(height: 40),

                Text(
                  "WorkFlowPro",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 30),

                ListTile(
                  leading: Icon(Icons.dashboard, color: Colors.white),
                  title: Text("Dashboard",
                      style: TextStyle(color: Colors.white)),
                ),

                // ListTile(
                //   leading: Icon(Icons.folder, color: Colors.white),
                //   title: Text("Projects",
                //       style: TextStyle(color: Colors.white)),
                // ),
                ListTile(
  leading: Icon(Icons.folder, color: Colors.white),
  title: Text("Projects", style: TextStyle(color: Colors.white)),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectScreen(),
      ),
    );
  },
),

                ListTile(
                  leading: Icon(Icons.task, color: Colors.white),
                  title:
                      Text("Tasks", style: TextStyle(color: Colors.white)),
                onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const TaskBoardScreen(),
    ),
  );
}
                ),

                ListTile(
  leading: Icon(Icons.notifications, color: Colors.white),
  title: Text("Notifications",
      style: TextStyle(color: Colors.white)),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationScreen(),
      ),
    );
  },
),
              ],
            ),
          ),

          /// Main Content
          Expanded(
            child: Column(
              children: [

                /// Topbar
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [

                      Text(
                        "Dashboard",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),

                      CircleAvatar(
                        child: Icon(Icons.person),
                      )
                    ],
                  ),
                ),

                /// Body
                Expanded(
                  child: Container(
                    color: AppColors.background,
                    child: const Center(
                      child: Text(
                        "Welcome to WorkFlowPro Dashboard",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}