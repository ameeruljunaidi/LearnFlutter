class Transaction {
  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});

  String? id;
  String? title;
  double? amount;
  DateTime? date;
}
