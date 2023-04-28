import 'package:dark_mode_flutter/core/constants/enum.dart';
import 'package:dark_mode_flutter/core/storage/main_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveStuff {
  static Future<void> init() async {
    if (!kIsWeb) {
      var path = await getTemporaryDirectory();
      Hive.init(path.path);
    }

    // Boxes
    darkmode = await Hive.openBox(DARKMODE);
  }
}
