import 'package:cloud_firestore/cloud_firestore.dart';

List<ChatModel> chatModelFromJson(List<Map<String, dynamic>> data) {
  return List<ChatModel>.from(data.map((x) => ChatModel.fromJson(x)));
}

class ChatModel {
  final String user;
  final String amount;
  final String category;
  final String userPrompt;
  final String apiResponse;
  final String subCategory;
  final Timestamp timestamp;

  ChatModel({
    required this.user,
    required this.amount,
    required this.category,
    required this.timestamp,
    required this.userPrompt,
    required this.apiResponse,
    required this.subCategory,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      user: json["user"],
      amount: json["amount"],
      category: json["category"],
      timestamp: json["timestamp"],
      userPrompt: json["userPrompt"],
      apiResponse: json["apiResponse"],
      subCategory: json["subCategory"],
    );
  }
}
