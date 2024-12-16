import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ringermode_platform_interface.dart';

/// An implementation of [RingermodePlatform] that uses method channels.
class MethodChannelRingermode extends RingermodePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('com.knwar/ringer');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getRingerMode');
    return version;
  }
}
