import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

mixin RemoteConfigService {
  final _config = FirebaseRemoteConfig.instance;

  @protected
  void initializeRemoteConfig() async {
    await _config.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));

    await _config.fetchAndActivate();
  }

  @protected
  bool getBoolData(String key) => _config.getBool(key);

  @protected
  String getStringData(String key) => _config.getString(key);
}
