import 'package:finance_bunny/firebase/database_service.dart';
import 'package:finance_bunny/firebase/remote_config_service.dart';
import 'package:finance_bunny/model/chat_model.dart';
import 'package:finance_bunny/network/requests.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatController with HttpRequests, RemoteConfigService, DatabaseService {
  Future<void> handleChat(String input) async {
    final Map<String, dynamic> data = {
      "messages": [
        {"role": "system", "content": getStringData("systemPrompt")},
        {"role": "user", "content": input.toLowerCase()},
      ]
    };

    final res = await postRequest(url: getStringData("url"), body: data);

    if (res != null) {
      final amount = input.split(" ");
      final temp = res.split(" -> ");

      final Map<String, dynamic> out = {
        "apiResponse": res,
        "amount": amount.last,
        "category": temp.first,
        "subCategory": temp.last,
        "userPrompt": input.toLowerCase(),
        "user": FirebaseAuth.instance.currentUser!.uid,
      };

      await addDocument(collection: "expenses", data: out);
    }
  }

  Stream<List<ChatModel>> getChats() {
    final res = getFilteredStream(
      field: "user",
      collection: "expenses",
      value: FirebaseAuth.instance.currentUser!.uid,
    );

    final data = res.map((list) {
      return list.map((item) => ChatModel.fromJson(item)).toList();
    });

    return data;
  }
}
