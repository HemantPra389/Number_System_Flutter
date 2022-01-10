import 'dart:math';

class Conversion {
  //Decimal Conversion
  String decimal_to_binary(double num) {
    double decimal = num;
    StringBuffer binary = StringBuffer();
    double rem = 0;
    while (decimal >= 1) {
      rem = decimal % 2;
      binary.write(rem.toInt());
      decimal = (decimal / 2).toDouble();
    }
    return binary.toString().split('').reversed.join('').toString();
  }

  String decimal_to_octal(double num) {
    var decimal = num;
    var octal = StringBuffer();
    double rem = 0;
    while (decimal >= 1) {
      rem = decimal % 8;
      octal.write(rem.toInt());
      decimal /= 8;
    }
    //Reverse the String
    return octal.toString().split('').reversed.join('').toString();
  }

  String decimal_to_hexadecimal(double res) {
    var decimal = res;
    double hexanumber = 0;
    var string = StringBuffer();

    while (decimal >= 1) {
      double my_num = decimal % 16;
      hexanumber = my_num;
      if (my_num >= 10) {
        switch (my_num.toInt()) {
          case 10:
            {
              string.write('A');
              break;
            }
          case 11:
            {
              string.write('B');
              break;
            }
          case 12:
            {
              string.write('C');
              break;
            }
          case 13:
            {
              string.write('D');
              break;
            }
          case 14:
            {
              string.write('E');
              break;
            }
          case 15:
            {
              string.write('F');
              break;
            }
        }
      } else {
        string.write(hexanumber.toInt());
      }
      decimal = decimal / 16;
    }

    return string.toString().split('').reversed.join('').toString();
  }

  //Binary Conversion
  String binary_to_decimal(double res) {
    double binary = res;
    var weight = 1;
    double rem = 0;
    var decimal = StringBuffer();
    double temp = 0;
    while (binary >= 1) {
      rem = binary % 10;
      temp = temp + rem.toInt() * weight;
      binary /= 10;
      weight *= 2;
    }
    decimal.write(temp.toInt());
    return decimal.toString();
  }

  String binary_to_octal(double res) {
    double num = double.parse(binary_to_decimal(res));
    return decimal_to_octal(num);
  }

  String binary_to_hexadecimal(double res) {
    var num = double.parse(binary_to_decimal(res));
    return decimal_to_hexadecimal(num);
  }

  //Octal Conversion

  String octal_to_decimal(double res) {
    var octal = res;
    double decimal = 0;
    double i = 0;
    while (octal >= 1) {
      double n = pow(8, i++).toDouble();
      decimal += ((octal % 10) * n).toInt();
      octal = (octal / 10).toInt().toDouble();
    }
    return decimal.toInt().toString();
  }

  String octal_to_binary(double res) {
    var num = octal_to_decimal(res);
    return ""; //decimal_to_binary(double.parse(num));
  }

  String octal_to_hexcode(double res) {
    var num = octal_to_decimal(res);
    return decimal_to_hexadecimal(double.parse(num));
  }

  //Hexadecimal Conversion

  String hex_to_decimal(String res) {
    String hex = res;
    hex = hex.split('').reversed.join('').toString();
    int i = 0;
    var temp = 0;
    while (i < hex.length) {
      switch (hex[i]) {
        case 'A':
          {
            temp = (temp + 10 * pow(16.0, i)).toInt();
            break;
          }
        case 'B':
          {
            temp = (temp + 11 * pow(16.0, i)).toInt();
            break;
          }
        case 'C':
          {
            temp = (temp + 12 * pow(16.0, i)).toInt();
            break;
          }
        case 'D':
          {
            temp = (temp + 13 * pow(16.0, i)).toInt();
            break;
          }
        case 'E':
          {
            temp = (temp + 14 * pow(16.0, i)).toInt();
            break;
          }
        case 'F':
          {
            temp = (temp + 15 * pow(16.0, i)).toInt();
            break;
          }
        default:
          {
            var a = double.parse(hex[i]);
            temp += (a * pow(16, i)).toInt();
          }
      }
      i++;
    }
    return temp.toString();
  }

  String hex_to_binary(String res) {
    var hex = hex_to_decimal(res);
    return decimal_to_binary(double.parse(hex));
  }

  String hex_to_octal(String res) {
    var octal = hex_to_decimal(res);
    return decimal_to_octal(double.parse(octal));
  }
}
