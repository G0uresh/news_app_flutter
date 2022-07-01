import 'package:hive/hive.dart';

abstract class BaseLocalDatasource<TableType>{

  final String boxName;

  BaseLocalDatasource({required this.boxName});

  Future<Box<TableType>> _openBox() async {
    return await Hive.openBox(boxName);
  }

  Future<TableType?> get(String key) async {
    final Box<TableType> box = await _openBox();
    return box.get(key);
  }

  Future<List<TableType>> getAll() async {
    final Box<TableType> box = await _openBox();
    return box.toMap().values.toList();
  }

  Future<void> put(String key, TableType value) async {
    print('[LocalDatasource] put $value on $TableType');
    final Box<TableType> box = await _openBox();
    await box.put(key, value);
  }

  Future<void> putAll(Map<String, TableType> items) async {
    print('[LocalDatasource] putAll $items on $TableType');
    final Box<TableType> box = await _openBox();
    await box.putAll(items);
  }

  Future<void> delete(String key) async {
    final Box<TableType> box = await _openBox();
    await box.delete(key);
  }

  Future<void> deleteAll() async {
    try {
      print('[LocalDatasource] Deleting all entries on $TableType');
      final Box<TableType> box = await _openBox();
      await box.clear();
    } catch (e) {
      print(
          '[LocalDatasource] exception $e thrown '
              'when deleting all entries on $TableType');
      rethrow;
    }
  }

  Future<void> deleteByKeys(List<String> keys) async {
    final Box<TableType> box = await _openBox();
    await box.deleteAll(keys);
  }
}