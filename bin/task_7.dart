class PhoneValidator {
  static void validate(String phone) {
    final trimmed = phone.trim();

    if(trimmed.isEmpty) {
      throw FormatException("Telefon raqami bo'sh bo'lishi mumkin emas.");
    }

    if(trimmed.contains('+') && !trimmed.startsWith('+')) {
      throw FormatException("Telefon raqomida '+' faqat boshida bo'lishi mumkin.");
    }

    final local9 = RegExp(r'^/d{9}$');
    final uzIntl = RegExp(r'^\+998\d{9}$');

    if(!local9.hasMatch(trimmed) && !uzIntl.hasMatch(trimmed)) {
      throw FormatException("Telefon formati noto'g'ri. Masalan: 901234567 yoki +998901234567");
    }

    final digits = trimmed.startsWith('+998') ? trimmed.substring(4) : trimmed;
    final code = digits.substring(0, 2);

    const allowedCodes = {
      '90','91','93','94','95','97','98','99','33','88'
    };

    if (!allowedCodes.contains(code)) {
      throw FormatException("Operator kodi noto‘g‘ri: $code");
    }
  }
}

void main() {
  final phones = [
    "901234567",
    "+998901234567",
    "  +998991112233  ",
    "998901234567",
    "+99890A234567",
    "123",
    "+99+8901234567",
  ];

  for (final p in phones) {
    try {
      PhoneValidator.validate(p);
      print("✅ OK: $p");
    } catch (e) {
      print("❌ XATO: $p -> $e");
    }
  }
}