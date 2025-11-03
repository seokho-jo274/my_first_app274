import 'package:flutter/material.dart';
import 'todo_entity.dart';

class ToDoView extends StatelessWidget {
  final ToDoEntity todo; // 보여줄 할 일 데이터
  final VoidCallback onToggleDone; // 완료 체크 클릭 시 실행
  final VoidCallback onToggleFavorite; // 즐겨찾기 클릭 시 실행

  const ToDoView({
    super.key,
    required this.todo,
    required this.onToggleDone,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //.   완료 체크 버튼
          IconButton(
            onPressed: onToggleDone,
            icon: Icon(
              todo.isDone ? Icons.check_circle : Icons.check_circle_outlined,
              color: todo.isDone ? Colors.black : Colors.grey,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  //.  가운데 제목 , 취소선 표시
                  todo.title,
                  style: TextStyle(
                    decoration: todo.isDone ? TextDecoration.lineThrough : null,

                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                if (todo.description.isNotEmpty)
                  Text(
                    todo.description,
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
              ],
            ),
          ),
          SizedBox(width: 12),
          IconButton(
            onPressed: onToggleFavorite,
            icon: Icon(
              todo.isFavorite ? Icons.star : Icons.star_border,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
