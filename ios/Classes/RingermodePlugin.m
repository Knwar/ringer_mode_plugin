#import "RingermodePlugin.h"

@implementation RingermodePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"com.knwar/ringer"
            binaryMessenger:[registrar messenger]];
  RingermodePlugin* instance = [[RingermodePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"RingerMode" isEqualToString:call.method]) {
    var outputPorts: [AVAudioSession.Port] { AVAudioSession.sharedInstance().currentRoute.outputs.map { $0.portType } }
    let areHeadphonesConnected: Bool = outputPorts.contains(.headphones)
    result([@areHeadphonesConnected? "Normal" : "Silent"]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
