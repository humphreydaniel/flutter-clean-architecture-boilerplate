import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';

/// Cache Manager
/// A interface which is used to persist and retrieve state changes.
///
/// Simple and easy management cache, fast, and powerfull
///
/// Only support type data:
///
/// `List`, `Map`, `DateTime`, `BigInt` and `Uint8List`
///
/// **Feature**
/// * Reading cache
/// * Writing cache
/// * Deleting cache
abstract class CacheManager {
  /// Return value from a [key] Param
  ///
  dynamic read(String key);

  /// Presists key value pair
  ///
  /// In write mode only support:
  ///
  /// `List`, `Map`, `DateTime`, `BigInt` and `Uint8List`
  ///
  /// When you write, otherwise can **Error**
  Future<void> write(String key, dynamic value);

  /// Deletes value by key
  Future<void> delete(String key);

  /// Clears all cache from storage
  Future<void> clearAll();
}

/// Key Cache manager box
// ignore: constant_identifier_names
const String CACHE_MANAGER_BOX_KEY = 'LOCAL_DB';

/// Implementation of [CacheManager] which uses `PathProvider` and `dart.io`
/// to persist and retrieve state changes from the local device.
class CacheManagerImpl implements CacheManager {
  /// Internal instance of [HiveImpl].
  /// It should only be used for testing.
  static HiveInterface _hive;
  static CacheManagerImpl _instance;
  static Box _box;

  /// Get instance Cache manager
  ///
  /// For example when instance null, then instance to be initialize
  /// When not null, return current instance
  ///
  /// When [encript] is true, all data is encript.
  /// By default [encript] is [true]
  ///
  /// Param [encryptKey] for key encript data, by default value is
  /// ['AlOp7lBkcFRdJnXFkGcBHwM9I9TJMMgr']
  ///
  /// [encryptKey] must more than 32, and <= 225
  static Future<CacheManagerImpl> getInstance({
    bool encrypt = true,
    String encryptKey = 'AlOp7lBkcFRdJnXFkGcBHwM9I9TJMMgr',
  }) async {
    if (_instance != null) return _instance;
    final appDir = await getApplicationDocumentsDirectory();
    _hive = HiveImpl();
    _hive.init(appDir.path);
    var _encryptionKey = encryptKey.codeUnits;
    _box = await _hive.openBox(
      CACHE_MANAGER_BOX_KEY,
      encryptionCipher: encrypt ? HiveAesCipher(_encryptionKey) : null,
    );
    return CacheManagerImpl(_hive);
  }

  ///
  @visibleForTesting
  CacheManagerImpl(HiveInterface hive);

  @override
  Future<void> clearAll() {
    if (_box?.isOpen ?? false) {
      _box.deleteFromDisk();
      _instance == null;
    }
    return null;
  }

  @override
  Future<void> delete(String key) {
    return (_box?.isOpen ?? false) ? _box.delete(key) : null;
  }

  @override
  dynamic read(String key) {
    return (_box?.isOpen ?? false) ? _box.get(key) : null;
  }

  @override
  Future<void> write(String key, dynamic value) {
    return (_box?.isOpen ?? false) ? _box.put(key, value) : null;
  }
}
