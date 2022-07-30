import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_wannads/flutter_wannads.dart';
import 'package:flutter_wannads/flutter_wannads_platform_interface.dart';
import 'package:flutter_wannads/flutter_wannads_method_channel.dart';
import 'package:flutter_wannads/wan_setting.dart';
import 'package:flutter_wannads/wan_user.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterWannadsPlatform 
    with MockPlatformInterfaceMixin
    implements FlutterWannadsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> init(String apiKey, String apiSecret, WanUser user,  {WanSetting? setting}) {
    
    throw UnimplementedError();
  }

  @override
  Future<void> showOfferwall() {
    
    throw UnimplementedError();
  }

  @override
  Future<void> showSurveysOfferwall() {
    
    throw UnimplementedError();
  }
}

void main() {
  final FlutterWannadsPlatform initialPlatform = FlutterWannadsPlatform.instance;

  test('$MethodChannelFlutterWannads is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterWannads>());
  });

  

  test('getPlatformVersion', () async {
    FlutterWannads flutterWannadsPlugin = FlutterWannads();
    MockFlutterWannadsPlatform fakePlatform = MockFlutterWannadsPlatform();
    FlutterWannadsPlatform.instance = fakePlatform;
  
    expect(await flutterWannadsPlugin.getPlatformVersion(), '42');
  });
}
