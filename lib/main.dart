

// 아래 stock은 상품의 재고 수량을 담고 있는 Map입니다.
// 각 상품은 고유한 번호(int)로 구분되며, 그 번호에 해당하는 재고 수량(int)이 함께 저장되어 있습니다.
// Map<int, int> stock = {101: 10, 102: 0, 103: 7, 104: 0};
// ​
// 전체 재고 수량의 총합을 출력하세요.
void main() {
  int a = 0;
  Map<int, int> stock = {
    101: 10, 102: 0,
    103:  7, 104: 0 }; // 키 번호 벨루  재고 수량
  for (var number in stock.entries){ // 각 수량의 를 넘버에 하나씩 넣는다
    if(number.value > 1){
    a += number.value;
    } // 넘버를 a 를 넣는다
   else{
     stock.remove(number.value);
    }
    } // 반복
  print("총합 $a");
} // 끝
// 재고가 0인 상품은 Map에서 제거한 이후 Map을 출력하세요.
// 출력 예시:
// 총 재고 수량: 17
// 정리된 재고 목록: {101: 10, 103: 7}
