class Person {
  String name = "Manny";
  int age = 30;
}

addNumbers(int num1, int num2) {
  print(num1 + num2);
}

void main() {
  var p1 = Person();
  print(p1.name);
  addNumbers(1, 2);
  print("Hello");
}
