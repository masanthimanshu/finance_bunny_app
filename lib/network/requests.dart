import "dart:convert";

import "package:finance_bunny/firebase/remote_config/remote_config.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

mixin HttpRequests implements RemoteConfig {
  @protected
  Future<String?> postRequest({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    final res = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": getStringData("authToken"),
      },
    );

    if (res.statusCode >= 200 && res.statusCode <= 208) {
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      return data["result"]["response"];
    }

    return null;
  }
}
