// 작성자 : 플러터 6기 개발 김지은
// 작성일 : 2025.03.13
// [Dart 기초] 개인 과제 - 콘솔 쇼핑몰
// 필수 정의 구현
// 예시 출력 화면과 전부 동일하게 나오도록 구성하였습니다.

import 'dart:io';

class Product {
  Map<String, int> product = {'shirt': 45000, 'onepiece': 30000, 'shortshirt': 35000, 'shortpants': 38000, 'socs':5000};
}

class ShoppingMall extends Product { // Product 클래스를 상속받아 Product 안에 있는 product를 사용
  int totalprice = 0;
  num mycartprice = 0;
  String? inputnumber;
  String password = '1234'; // 도전 기능 비밀번호
  List<String?> mycart = []; // 도전 기능 장바구니 리스트 정의
  void chooseNumber() {
    while ( inputnumber != 4 ) { //inputnumber가 4이면 while문 종료
        print('----------------------------------------------------------------------------------------------------------------------------------------------------------------');
        print('[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료 / [6] 장바구니 초기화 / [158] [관리자 모드]');
        print('----------------------------------------------------------------------------------------------------------------------------------------------------------------');
        String? input = stdin.readLineSync(); 
        int? inputnumber = int.tryParse(input ?? "");
        switch(inputnumber) {
          case 1:
            showProducts();
            break;          
          case 2:
            addToCart();
            break;
          case 3:
            showTotal();
            break;         
          case 4:
            print('정말 종료하시겠습니까?');
            String? inputrealquit = stdin.readLineSync(); 
            int? realquit = int.tryParse(inputrealquit ?? "");
            if (realquit == 5) {
              print('이용해 주셔서 감사합니다 ~ 안녕히 가세요!');
              return;
            }
            print('종료하지 않습니다.');
            break;
            case 6:
            initmycart();
            case 158:
            
            break;
          default:
            print('입력값이 올바르지 않아요 !');
        }       
    }
  } 

  void showTotal() {
    if (mycart == []) {
      print('장바구니에 담긴 상품이 없습니다.');
    }
    String result = mycart.join(", ");
    print('장바구니에 $result가 담겨있네요. 총 $mycartprice원 입니다!');
  }

  void showProducts() {
    product.forEach((key, value) {
      print('$key / $value원');
    });
  }

  void addToCart() {
    // 윈도우 한글 입력에 오류가 있는 관계로 영어로 대체했습니다.
    String? inputname;
    print('상품 이름을 입력해 주세요 !');
    inputname = stdin.readLineSync();
    print('상품 개수를 입력해 주세요 !');
    String? inputs = stdin.readLineSync();
    int? inputsum = int.tryParse(inputs ?? "");

    if (inputsum == null) {// null인 경우 검사
      print('입력값이 올바르지 않아요 !');
      return;
    }

    if (inputsum < 0) {// inputsum을 음수로 받았을 경우
      print('0개보다 많은 개수의 상품만 담을 수 있어요 !'); 
      return;
    }

    if ( !product.containsKey(inputname) || inputsum.runtimeType != int ) { // 제품명과 개수가 틀린 입력일 경우 출력. 제품명을 틀렸을때 바로 출력되게 하면 더 좋을듯
      print('입력값이 올바르지 않아요 !');
        return;
    }

    if (!mycart.contains(inputname)) { // mycart 리스트에 추가
      mycart.add(inputname);
    }
    print(mycart);
    switch(inputname) { // 각각의 가격 * 입력한 개수 계산하여 mycartprice에 저장
      case 'shirt':
        mycartprice += 45000 * inputsum;
        break;      
      case 'onepiece':
        mycartprice += 30000 * inputsum;
        break;
      case 'shortshirt':
        mycartprice += 35000 * inputsum;
        break;
      case 'shortpants':
        mycartprice += 38000 * inputsum;
        break;
      case 'socs':
        mycartprice += 5000 * inputsum;
        break;
      default:
        break;
    }
    print('장바구니에 상품이 담겼어요 !');
  }

  void initmycart() { // 장바구니, 장바구니 가격 초기화
    if(mycartprice == 0) {
      print('이미 장바구니가 비어있습니다.');
      return;
    }
    print('장바구니를 초기화합니다.');
    mycart = [];
    mycartprice = 0;
  }

  void viewmycart() {
    if (mycart == []) {
      print('장바구니에 담긴 상품이 없습니다.');
    }
    String result = mycart.join(", ");
    print('장바구니에 $result가 담겨있네요. 총 $mycartprice원 입니다!');
  }

  void managemode() {
    print('암호를 입력하세요. (비번은 1234)');
    String? inputpassword = stdin.readLineSync(); 
    if (inputpassword != password) {
      print('틀렸습니다. 저리 가세요.');
      return;
    }

    String? inputchoice = stdin.readLineSync();
    print('어떤 작업을 하시겠습니까?');
    print('[1] 비밀번호 변경 / [2] ');
    switch (inputchoice) {
      case '1' : 
        print('새로운 비밀번호를 입력하세요.');
        String? inputnewpassword = stdin.readLineSync();
          if (inputnewpassword == null) {// null인 경우 검사
            break;
          }
        print('한번 더 입력하세요.');
        String? inputnewpassword2 = stdin.readLineSync();
        if (inputnewpassword != inputnewpassword2) {
          print('비밀번호가 같지 않습니다. 다시 시도해주세요.');
        }
        password = inputnewpassword;
        print('비밀번호 변경이 완료됐습니다.');
        break;
      case '2' :
        break;
      default :
        print('1 또는 2만 입력할 수 있습니다.');
    } 
  }
}

void main() {
  ShoppingMall a = ShoppingMall();
  a.chooseNumber();
}