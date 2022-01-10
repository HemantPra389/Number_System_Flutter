import 'package:number_system_converter/conversion.dart';

String? option_checker(String? option_one, String? option_two, String num) {
  Conversion convert = Conversion();
  if (option_one.toString() == "Decimal") {
    switch (option_two.toString()) {
      case 'Binary':
        {
          return convert.decimal_to_binary(double.parse(num));
        }
      case 'Decimal':
        {
          return num;
        }
      case 'Octal':
        {
          return convert.decimal_to_octal(double.parse(num));
        }
      case 'HexaDecimal':
        {
          return convert.decimal_to_hexadecimal(double.parse(num));
        }
    }
  }
  if (option_one.toString() == "Binary") {
    if (num.contains('2') ||
        num.contains('3') ||
        num.contains('4') ||
        num.contains('5') ||
        num.contains('5') ||
        num.contains('6') ||
        num.contains('7') ||
        num.contains('8') ||
        num.contains('9')) {
      return "Only 0's & 1's are allowed";
    } else {
      switch (option_two.toString()) {
        case 'Decimal':
          {
            return convert.binary_to_decimal(double.parse(num));
          }
        case 'Binary':
          {
            return num;
          }
        case 'Octal':
          {
            return convert.binary_to_octal(double.parse(num));
          }
        case 'HexaDecimal':
          {
            return convert.binary_to_hexadecimal(double.parse(num));
          }
      }
    }
  }
  if (option_one.toString() == "Octal") {
    switch (option_two.toString()) {
      case 'Binary':
        {
          return convert.octal_to_binary(double.parse(num));
        }
      case 'Decimal':
        {
          return convert.octal_to_decimal(double.parse(num));
        }
      case 'Octal':
        {
          return num;
        }
      case 'HexaDecimal':
        {
          return convert.octal_to_hexcode(double.parse(num));
        }
    }
  }
  if (option_one.toString() == "HexaDecimal") {
    switch (option_two.toString()) {
      case 'Binary':
        {
          return convert.hex_to_binary(num);
        }
      case 'Decimal':
        {
          return convert.hex_to_decimal(num);
        }
      case 'Octal':
        {
          return convert.hex_to_octal(num);
        }
      case 'HexaDecimal':
        {
          return num;
        }
    }
  }
}
