import 'task_5.dart';
import 'task_6.dart';

void main() {
List<int> list = [0,2,1,5,3,4];
print(buildArray(list));

// task 2
  final word = "Hello how are you Contestant";
  final count = 4;
print('task 2: ${truncateSentence(word, count)}');

// task 3
  print(trailingZeroes(3));
  print(trailingZeroes(5));

  // task 4
  print(fizzBuzz(15));


  // task 5
  final checker = Checker("egg", "adf");
  print(checker.isIsomorphic());

  // task 6
  final a1 = BankAccount(
    name: "Ogabek",
    email: "ogabek@mail.com",
    password: "1234",
    accountNumber: "UZ001-AAA",
    balance: 1000,
  );

  final a2 = BankAccount(
    name: "Ali",
    email: "ali@mail.com",
    password: "9999",
    accountNumber: "UZ002-BBB",
    balance: 200,
  );

  print("=== 1) Noto‘g‘ri parol bilan display ===");
  a1.display("0000");

  print("\n=== 2) To‘g‘ri parol bilan display ===");
  a1.display("1234");

  print("\n=== 3) TopUp (noto‘g‘ri parol) ===");
  a1.topUp("0000", 300);

  print("\n=== 4) TopUp (to‘g‘ri parol) ===");
  a1.topUp("1234", 300);
  a1.display("1234");

  print("\n=== 5) Transfer (mablag‘ yetarli emas) ===");
  a2.transferMoney(inputPassword: "9999", to: a1, amount: 1000);

  print("\n=== 6) Transfer (to‘g‘ri) ===");
  a1.transferMoney(inputPassword: "1234", to: a2, amount: 500);

  print("\n=== 7) Natijalar ===");
  print("A1 (Ogabek) ->");
  a1.display("1234");
  print("A2 (Ali) ->");
  a2.display("9999");

  print("\n=== 8) Account number update ===");
  a1.updateAccountNumber("1234", "UZ001-NEW");
  a1.display("1234");




}




// task 1
List<int> buildArray(List<int> num) =>
    num.map((ans) =>  num[ans]).toList();

// task 2
String truncateSentence(String s, int k) {
  final words = s.split(' ');
  final firstKWords = words.take(k);
  return firstKWords.join(' ');
}

// task 3
int trailingZeroes(int n){
  int count = 0;

  while(n >= 5) {
    n ~/= 5;
    count += n;
  }
  return count;
}

// task 4
List<String> fizzBuzz(int n) {
  List<String> answer  = [];

  for(int i = 1; i <= n; i++) {
    if(i % 15 == 0) {
      answer.add('fizzBuzz');
    } else if(i % 3 == 0) {
      answer.add('fizz');
    } else if(i % 5 == 0) {
      answer.add('Buzz');
    } else {
      answer.add(i.toString());
    }
  }
  return answer;
}



