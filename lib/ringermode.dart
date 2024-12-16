import 'ringermode_platform_interface.dart';

class Ringermode {
  Future<String?> getRingerMode() {
    return RingermodePlatform.instance.getRingerMode();
  }
}
