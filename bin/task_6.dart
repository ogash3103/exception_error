abstract class Account {
  String name;
  String email;
  String password;

  Account({
    required this.name,
    required this.email,
    required this.password,
});
}

class BankAccount extends Account {
  String _accountNumber;
  double _balance;

  BankAccount({
    required super.name,
    required super.email,
    required super.password,
    required String accountNumber,
    double balance = 0,
  }) : _accountNumber = accountNumber,
       _balance = balance;

  bool _checkPassword(String inputPassword) =>
      inputPassword == password;

  void display(String inputPassword) {
    if(!_checkPassword(inputPassword)){
      print("Password noto'g'ri. Ma'lumotlar yashirligan.");
      return;
    }
    print("Account Info:");
    print(" name: $name");
    print(" Email: $email");
    print(" AccountNumber: $_accountNumber");
    print(" Balance: $_balance");
  }

  double? getBalnce(String inputPassword) {
    if(!_checkPassword(inputPassword)) return null;
    return _balance;
  }

  bool updateAccountNumber(String inputPassword, String newNumber) {
    if(!_checkPassword(inputPassword)) {
      print("Passowrd nto'g'ri. Accoutn number o'zgarmadi");
      return false;
    }

    if(newNumber.trim().isEmpty) {
      print("Yangi account number bo'sh bo'lishi mumkin emas.");
      return false;
    }

    _accountNumber = newNumber;
    print("Account number yangilandi: $_accountNumber");
    return true;
  }

  bool topUp(String inputPassword, double amount) {
    if(!_checkPassword(inputPassword)) {
      print("Passwrod noto'g'ri. TopUp bekor qilindi.");
      return false;
    }

    if(amount <= 0) {
      print("TopUP miqdori 0 dan katta bo'lishi kerak");
      return false;
    }
    _balance += amount;
    print("TopUp: +$amount. Yangi balns: $_balance");
    return true;
  }

  bool transferMoney({
    required String inputPassword,
    required BankAccount to,
    required double amount,
}) {
    if(!_checkPassword(inputPassword)) {
      print("Passowrd noto'gri. Trasfer befor qilindi.");
      return false;
    }

    if(amount <= 0) {
      print("Fransfer miqdori 0 dan katta bo'lishi kerak.");
      return false;
    }

    if(identical(this, to)){
      print("O'zingizga o'tkazma qilib bo'lmaydi.");
      return false;
    }

    _balance -= amount;
    to._balance += amount;

    print("Transfer muvaffaqiyatli: $amount so'm -> ${to._accountNumber}");
    print("Yuboruvchi yangi balans: $_balance");
    return true;
  }



}