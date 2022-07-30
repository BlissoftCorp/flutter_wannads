import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wannads/wan_setting.dart';
import 'package:flutter_wannads/wan_user.dart';

import 'flutter_wannads_platform_interface.dart';

/// An implementation of [FlutterWannadsPlatform] that uses method channels.
class MethodChannelFlutterWannads extends FlutterWannadsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_wannads');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> init(String apiKey, String apiSecret, WanUser user,  {WanSetting? setting}) async{
    Map<String, dynamic> userDict = {
      "id": user.id,
      "age": user.age,
      "gender": user.gender?.index.toString(),
      "subId2": user.subId2
    };
    Map<String, dynamic>? settingDict = setting != null ? {
      "primaryColor" : setting.primaryColor != null ? "#${setting.primaryColor.toString().substring(4) }" : null,
      "confirmButtonColor": setting.confirmButtonColor != null ? "#${setting.confirmButtonColor.toString().substring(4) }" : null
      
    } : null;

    final status = await methodChannel.invokeMethod<bool>('init', {
      "apiKey": apiKey,
      "apiSecret": apiSecret,
      "user": userDict,
      "setting": settingDict
    });
  }

  @override
  Future<void> showOfferwall()async{
    await methodChannel.invokeMethod<bool>("showOfferwall");
  }
}
