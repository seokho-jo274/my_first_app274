import 'package:flutter/material.dart';

List<ToDoEntity> todoList = [];

class ToDoEntity {
  String title; // 할 일 제목
  String description; // 설명
  bool isDone; // 완료 여부
  bool isFavorite; // 즐겨찾기 여부

  ToDoEntity({
    required this.title,
    required this.description,
    this.isDone = false, // 기본값은 미완료
    this.isFavorite = false,
  });
}

final ToDoEntity myTask = ToDoEntity(
  title: "석호's Tasks",
  description: "UI 연습 및 상태 관리 배우기",
  isDone: false,
  isFavorite: false,
);
