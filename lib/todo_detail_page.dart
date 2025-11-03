import 'package:flutter/material.dart';
import 'todo_entity.dart';
import 'todo_view.dart';

class ToDoDetailPage extends StatefulWidget {
  final ToDoEntity todo;

  const ToDoDetailPage({super.key, required this.todo});

  @override
  State<ToDoDetailPage> createState() => _ToDoDetailPageState();
}

class _ToDoDetailPageState extends State<ToDoDetailPage> {
  late ToDoEntity editableTodo;
  late TextEditingController _titleController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    editableTodo = ToDoEntity(
      title: widget.todo.title,
      description: widget.todo.description,
      isDone: widget.todo.isDone,
      isFavorite: widget.todo.isFavorite,
    );

    _titleController = TextEditingController(text: editableTodo.title);
    _descController = TextEditingController(text: editableTodo.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            editableTodo.title = _titleController.text.trim();
            editableTodo.description = _descController.text.trim();
            Navigator.pop(context, editableTodo);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              editableTodo.isFavorite ? Icons.star : Icons.star_border,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                editableTodo.isFavorite = !editableTodo.isFavorite;
              });
            },
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              // 제목
              editableTodo.title,
              style: TextStyle(
                decoration: editableTodo.isDone
                    ? TextDecoration.lineThrough
                    : null,
                color: editableTodo.isDone ? Colors.green : Colors.black,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.short_text_rounded),
                onPressed: () {
                  setState(() {
                    // ✅ spread(...) 문법으로 여러 위젯 추가 가능
                  });
                },
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Text(
                  // 세부 설명
                  editableTodo.description,
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
