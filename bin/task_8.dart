class EmailValidator {
  static void validate(String email) {
    final e = email.trim();

    if(e.isEmpty) {
      throw FormatException("Email bo'sh bo'lishi mumkin emas.");
    }
    
    if(e.contains(' ')) {
      throw FormatException("Email ichida bo'sh joy bo'lishi mumkin emas");
    }
    
    final regex = RegExp(r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

    if(!regex.hasMatch(e)) {
      throw FormatException("Email formati tot'g'ri. Masalan: user@gmai.com");
    }
  }
}

void main() {
  final emails = [
    "ogabek@gmail.com",
    "  user.name_12@company.uz  ",
    "no-at-symbol.com",
    "user@",
    "@gmail.com",
    "user@gmail",
    "user @gmail.com",
    "user@gmail..com",
  ];

  for (final em in emails) {
    try {
      EmailValidator.validate(em);
      print("✅ OK: $em");
    } catch (e) {
      print("❌ XATO: $em -> $e");
    }
  }
}