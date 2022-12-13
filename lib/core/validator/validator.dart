class Validator {
  static late Validator _instance;
  static Validator get instance {
    _instance = Validator._init();
    return _instance;
  }

  Validator._init();

  String? validateEmail(String? value) {
    String pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Geçerli bir mail giriniz';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    String pattern = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,20}$";
    RegExp regex = RegExp(pattern);
    if (value!.length >= 6 && value.length <= 21) {
      if (!regex.hasMatch(value)) {
        return 'Rakam,büyük, küçük harf ve özel karakter içermiyor';
      } else {
        return null;
      }
    } else {
      return "6 karakterden küçük ya da 20 karakterden büyük";
    }
  }

  String? validateTelNumber(String? value) {
    String pattern = r"^[0-9]{10}$";
    RegExp regex = RegExp(pattern);
    if (value!.length != 10 && !regex.hasMatch(value)) {
      return 'Geçerli telefon numarası giriniz';
    } else {
      return null;
    }
  }

  String? validateAd(String? value) {
    String pattern = r"^[a-zA-Z0-9ğüşöçİĞÜŞÖÇ ]{3,50}$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'İsim alanı  minimum 3 karakter, maksimum 50 karakter olmalı!';
    } else {
      return null;
    }
  }

  String? validateSoyad(String? value) {
    String pattern = r"^[a-zA-Z0-9ğüşöçİĞÜŞÖÇ]{3,50}$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Soyad alanı  minimum 3 karakter, maksimum 50 karakter olmalı!';
    } else {
      return null;
    }
  }
}
