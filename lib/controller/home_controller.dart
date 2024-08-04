import 'package:finance_bunny/firebase/database_service.dart';
import 'package:finance_bunny/model/chat_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController with DatabaseService {
  Future<List<ChatModel>?> recentTransactions() async {
    final res = await getFilteredData(
      field: "user",
      collection: "expenses",
      value: FirebaseAuth.instance.currentUser!.uid,
    );

    if (res.isNotEmpty) return chatModelFromJson(res);
    return null;
  }
}
