import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/todo_detail_page.dart';
import 'todo_entity.dart';
import 'todo_view.dart';

void main() {
  runApp(MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false));
}

class HomePage extends StatefulWidget {
  List<ToDoEntity> tasks = [];

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final FocusNode _focusNode = FocusNode();

  bool showDescription = false; // 처음엔 설명칸이 안보임

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          myTask.title,

          style: TextStyle(
            decoration: myTask.isDone
                ? TextDecoration.lineThrough
                : null, // ✅ 취소선
            color: myTask.isDone ? Colors.grey : Colors.black, // ✅ 완료시 흐리게
          ),
        ),
      ),

      body: Center(
        child: widget.tasks.isEmpty
            ? Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(20),
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://picsum.photos/100/100?format=webp',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "아직 할일이 없음",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "할 일을 추가하고 ${myTask.title}에서\n할일을 추적하세요",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: widget.tasks.length,
                itemBuilder: (context, index) {
                  final task = widget.tasks[index];
                  return GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ToDoDetailPage(todo: task),
                        ),
                      );

                      if (result == 'delete') {
                        setState(() => widget.tasks.removeAt(index));
                      } else if (result is ToDoEntity) {
                        setState(() => widget.tasks[index] = result);
                      }
                    },
                    child: ToDoView(
                      todo: task,
                      onToggleDone: () {
                        setState(() {
                          task.isDone = !task.isDone;
                        });
                      },
                      onToggleFavorite: () {
                        setState(() {
                          task.isFavorite = !task.isFavorite;
                        });
                      },
                    ),
                  );
                },
              ), // ✅ builder 닫기
      ), // ✅ Padding 닫기

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white, size: 24),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true, // ✅ 키보드 올라올 때도 레이아웃 유지

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            builder: (context) {
              String newTask = '';
              bool showDescription = false; // ✅ 모달 내부에서도 선언 가능
              String newDescription = '';
              return StatefulBuilder(
                builder: (context, setModalState) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 12,
                      bottom:
                          MediaQuery.of(context).viewInsets.bottom +
                          0, // ✅ 키보드 대응
                    ),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '새 할일 추가',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        TextField(
                          focusNode: _focusNode, // ✅ 어떤 포커스에 연결할지
                          autofocus: true, //  ✅ 열리자마자 여기에 커서 찍어
                          decoration: InputDecoration(hintText: '할 일을 입력하세요'),
                          onChanged: (value) {
                            newTask = value;
                            if (value.isNotEmpty && !showDescription) {
                              setModalState(() {
                                showDescription =
                                    true; // ✅ 입력 시작 시 세부 정보 필드 보이기
                              });
                            }
                          },
                        ),
                        if (showDescription) ...[
                          // ✅ spread(...) 문법으로 여러 위젯 추가 가능
                          SizedBox(height: 12),
                          TextField(
                            decoration: InputDecoration(hintText: '세부정보 추가'),
                            maxLines: null,
                            onChanged: (value) => newDescription = value,
                          ),
                        ],

                        SizedBox(height: 12),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.short_text_rounded,
                                    size: 24,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  onPressed: () {
                                    setModalState(() {
                                      showDescription = !showDescription;
                                    });
                                  },
                                ),
                                IconButton(
                                  alignment: Alignment.centerLeft,
                                  icon: Icon(
                                    myTask.isFavorite
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.amber,
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    setModalState(() {
                                      myTask.isFavorite = !myTask.isFavorite;
                                      Navigator.pop(context);
                                    });
                                  },
                                ),
                              ],
                            ),

                            IconButton(
                              alignment: Alignment.centerRight,

                              // ✅저장 버튼
                              onPressed: () {
                                if (newTask.isNotEmpty) {
                                  setState(() {
                                    widget.tasks.add(
                                      ToDoEntity(
                                        title: newTask,
                                        description: newDescription.isNotEmpty
                                            ? newDescription
                                            : '설명 없음',
                                        isFavorite: myTask.isFavorite,
                                      ),
                                    );
                                  });
                                  Navigator.pop(context);
                                }
                              },
                              icon: Text('저장'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
        backgroundColor: Colors.redAccent,
        shape: CircleBorder(),
      ),
    );
  }
}
