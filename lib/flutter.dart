void main() {
  // //5번
  // //다음 students에서 이름의 길이가 3글자 이상인 학생의 수를 출력하세요.
  // Map<String, int> students = {"민수": 70, "영희": 85, "하나": 90, "준": 60};

  // String a5 = "";
  // int t = 0;
  // for (var number5 in students.entries) {
  //   // 하나 씩 키랑 벨루 를 넘버에 꺼낸다
  //   if (number5.key.length == 2) {
  //     // 키의 길이가 2글자이면
  //     a5 = number5.key; // a5에 그 키를 넣어라
  //     t++;
  //   }
  //   // print("2글자 학생: $t");
  //   // print(a5); // a5 출력. 출력값이 왜 다른가
  // }
  // print("2글자 학생: $t 명 이야 ");
  // 3글자 이상 학생 수: 2

  //7번
  // movies는 영화별 평점입니다.
  // 평점이 90점 이상인 영화 제목들을 문자열로 묶어서 출력하세요.
  //
  // Map<String, int> movies = {"서울의 봄": 95, "명량": 89, "범죄도시": 90, "기생충": 97};
  // List<String> key = [];
  // for (var movie in movies.entries) {
  //   if (movie.value >= 90) {
  //     key.add(movie.key);
  //   }
  // }
  // print("평점 90 이상: $key");
  // // 평점 90 이상: 서울의 봄, 범죄도시, 기생충

  //8번
  //아래 students의 점수 중에서 "희"로 끝나는 이름을 가진 학생들의 최고 점수를 구하세요.

  Map<String, int> scores = {"영희": 88, "민희": 91, "철수": 77, "지민": 84};
int num = 0;
int ber = 0;
  for (var name in scores.entries) {
    if (name.key.contains("희")) {
      num += 1;
      for (var i = 1; i < num; i++) {
        if (name.value > ber) {
          ber = name.value;
          print("희 를 가진 이름 ${name.key} 이며 최고 점수:${name.value} 입니다 ");
        }
      }
    }
  }
  // '희'로 끝나는 학생 중 최고 점수: 91
}
