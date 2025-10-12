import 'package:flutter/material.dart';
import 'package:todo_app/src/features/todo/presentation/screens/todo_list_screen.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(

        child: TodoListScreen(),

        // child: Center(
        //   child: Text("Welcome to Home Of Todo App"),
        // ),

      ),
    );
  }
}