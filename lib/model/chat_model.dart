class ChatModel {
  final String amount;
  final String category;
  final String subCategory;

  ChatModel({
    required this.amount,
    required this.category,
    required this.subCategory,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      amount: json["amount"],
      category: json["category"],
      subCategory: json["subCategory"],
    );
  }
}
