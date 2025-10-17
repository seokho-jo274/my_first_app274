
void main() {

  // 아래 userOrders는 사용자 ID와 그 사용자가 주문한 상품 금액 리스트를 나타냅니다.
  // 각 사용자 ID별
  // 총 주문 금액을 계산하여,
  // 아래 예시와 같은 형식으로 출력하세요.
  // (예: {1001: 60, 1002: 5, 1003: 28})
  Map<int, List<int>> userOrders = {
    1001: [10, 20, 30], // 1
    1002: [5],          // 2
    1003: [7, 7, 7, 7], // 3
  };
  List<int> sum =[];

  Map<int,int> number =  {};
  for(var num in userOrders.keys){ // 한개 씩
    sum  = userOrders[num]??[]; // 리스트 벨루값을 따로보관
    int r = 0;
    for(var number in sum ) { // 리스트 하나씩 가져온다

      r += number;

    }
    number[num] = r;
  } // 반복
  print ("총 주문 금액:$number"); // 1
  int T = 0; //아디
  int C = 0; // 값
  for (var Q in number.entries) { // 넘버에서 키와 벨루를 하나 씩  꺼내

    if( Q.value > C ){
      C = Q.value;
      T = Q.key;
    }

  }
  print("가장 많은 주문한 사용자 ID: $T");
  // 전체 사용자 중 가장 많이 주문한 사용자를 찾아, 해당 사용자의 ID를 출력하세요.
  // 비교를 해서 key 값이 많은 사람 찾아 해당 출력한다
  // 출력 예시:
  // 총 주문 금액: {1001: 60, 1002: 5, 1003: 28}
  // 가장 많이 주문한 사용자 ID: 1001
}