import 'package:finance_bunny/firebase/remote_config_service.dart';
import 'package:finance_bunny/model/chat_model.dart';
import 'package:finance_bunny/network/requests.dart';

class ChatController with HttpRequests, RemoteConfigService {
  Future<ChatModel?> getData(String input) async {
    final Map<String, dynamic> data = {
      "messages": [
        {"role": "system", "content": getStringData("systemPrompt")},
        {"role": "user", "content": input}
      ]
    };

    final res = await postRequest(url: getStringData("url"), body: data);

    if (res != null) {
      final amount = input.split(" ");
      final temp = res.split(" -> ");

      final Map<String, dynamic> out = {
        "amount": amount.last,
        "category": temp.first,
        "subCategory": temp.last,
      };

      return ChatModel.fromJson(out);
    }

    return null;
  }
}
