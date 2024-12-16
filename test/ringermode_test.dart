import 'package:flutter_test/flutter_test.dart';
import 'package:ringermode/ringermode.dart';
import 'package:ringermode/ringermode_platform_interface.dart';
import 'package:ringermode/ringermode_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockRingermodePlatform
    with MockPlatformInterfaceMixin
    implements RingermodePlatform {
  @override
  Future<String?> getRingerMode() => Future.value('Silent');
}

void main() {
  final RingermodePlatform initialPlatform = RingermodePlatform.instance;

  test('$MethodChannelRingermode is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelRingermode>());
  });

  test('getPlatformVersion', () async {
    Ringermode ringermodePlugin = Ringermode();
    MockRingermodePlatform fakePlatform = MockRingermodePlatform();
    RingermodePlatform.instance = fakePlatform;

    expect(await ringermodePlugin.getRingerMode(), 'Silent');
  });
}
