#import "FlutterWannadsPlugin.h"
#if __has_include(<flutter_wannads/flutter_wannads-Swift.h>)
#import <flutter_wannads/flutter_wannads-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_wannads-Swift.h"
#endif

@implementation FlutterWannadsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterWannadsPlugin registerWithRegistrar:registrar];
}
@end
