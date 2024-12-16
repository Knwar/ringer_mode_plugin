import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ringermode_method_channel.dart';

abstract class RingermodePlatform extends PlatformInterface {
  /// Constructs a RingermodePlatform.
  RingermodePlatform() : super(token: _token);

  static final Object _token = Object();

  static RingermodePlatform _instance = MethodChannelRingermode();

  /// The default instance of [RingermodePlatform] to use.
  ///
  /// Defaults to [MethodChannelRingermode].
  static RingermodePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [RingermodePlatform] when
  /// they register themselves.
  static set instance(RingermodePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getRingerMode() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
