class Income {
  String incomeSource;
  late double amount;

  Income({required this.incomeSource, required this.amount});
}

class Expense {
  String expDescription;
  late double amount;

  Expense({required this.expDescription, required this.amount});
}

class ModuleData {
  final String name;
  final String description;

  ModuleData({required this.name, required this.description});
}
