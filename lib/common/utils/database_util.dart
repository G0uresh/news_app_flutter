import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseUtil {
  static Future<void> initDatabase() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }

  ///  Register our auto generated Adapter to our Hive database
  static void registerAdapter<T>(TypeAdapter<T> adapter) {
    if (!Hive.isAdapterRegistered(adapter.typeId)) {
      Hive.registerAdapter<T>(adapter);
    }
  }

  /// All data stored in Hive is organized in boxes.
  /// A box can be compared to a table in SQL
  /// but it does not have a structure and can contain anything.
  /// Open a box to perform any operation
  static Future<Box<Type>> getBox<Type>({
    required String boxName,
    bool isEncrypted = true,
  }) async {
      return Hive.openBox(boxName);
  }

  /// To delete the box from disk.
  static Future<void> deleteBox(String boxName) async {
    await Hive.deleteBoxFromDisk(boxName);
  }

  /// To clear the box if boxName exist
  /// Otherwise delete the box from disk
  static Future<void> clearBox(String boxName) async {
      await Hive.deleteBoxFromDisk(boxName);
  }

  /// To remove all local storage content.
  static Future<void> clearDatabase() async {
    await Hive.deleteFromDisk();
  }
}