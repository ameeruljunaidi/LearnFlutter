import 'dart:io';

// void main() {
//   print("Enter first number:");
//   String? num1 = stdin.readLineSync();
//   print("Enter second number:");
//   String? num2 = stdin.readLineSync();

//   print(
//     int.parse(num1!) + int.parse(num2!),
//   );
// }

void main() {
  print("Enter first number:");
  double num1 = double.parse(stdin.readLineSync()!);
  print("Enter second number:");
  double num2 = double.parse(stdin.readLineSync()!);

  print(
    num1 + num2,
  );
}
