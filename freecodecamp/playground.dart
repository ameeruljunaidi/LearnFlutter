import 'dart:io';

// main() {
//   var firstName = "AJ";
//   String lastName = "Junaidi";

//   print(firstName + ' ' + lastName);
// }

main() {
  stdout.writeln("What is your name: ?");
  String? name = stdin.readLineSync();
  print("My name is $name");
}
