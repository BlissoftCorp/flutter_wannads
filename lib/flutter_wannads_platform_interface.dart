import 'package:flutter_wannads/wan_setting.dart';
import 'package:flutter_wannads/wan_user.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_wannads_method_channel.dart';

abstract class FlutterWannadsPlatform extends PlatformInterface {
  /// Constructs a FlutterWannadsPlatform.
  FlutterWannadsPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterWannadsPlatform _instance = MethodChannelFlutterWannads();

  /// The default instance of [FlutterWannadsPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterWannads].
  static FlutterWannadsPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterWannadsPlatform] when
  /// they register themselves.
  static set instance(FlutterWannadsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> init(String apiKey, String apiSecret, WanUser user,  {WanSetting? setting}){
    throw UnimplementedError('init() has not been implemented.');
  }

  Future<void> showOfferwall(){
    throw UnimplementedError('showOfferwall() has not been implemented.');
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
