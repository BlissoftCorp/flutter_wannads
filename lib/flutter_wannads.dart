

import 'package:flutter_wannads/wan_setting.dart';
import 'package:flutter_wannads/wan_user.dart';

import 'flutter_wannads_platform_interface.dart';

class FlutterWannads {
  static FlutterWannads? _instance;

  static FlutterWannads get instance => _instance ??= FlutterWannads();

  Future<String?> getPlatformVersion() {
    return FlutterWannadsPlatform.instance.getPlatformVersion();
  }

  Future<void> init({required String apiKey, required String apiSecret, required WanUser user,  WanSetting? setting}) {
    return FlutterWannadsPlatform.instance.init(apiKey, apiSecret, user, setting: setting);
  }

  Future<void> showOfferwall() {
    return FlutterWannadsPlatform.instance.showOfferwall();
  }
}
