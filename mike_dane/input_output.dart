// io stands for input output
import 'dart:io';

void main() {
  print("What is your name?");
  String? username = stdin.readLineSync();
  print("Hello ${username}");
}
