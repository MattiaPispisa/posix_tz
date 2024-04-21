import 'package:posix_tz/posix_tz.dart';

/// Posix timezones database
///
/// find posix timezone by location name
///
/// Example:
/// ```dart
/// final posixTz = db.get("Europe/Rome")
/// ```
abstract class PosixTzDatabase {
  /// clear posix timezone database
  void clear();

  /// add posix timezone
  void add(PosixTz posixTz);

  /// get posix timezone
  ///
  /// can throw [PosixTzNotFound]
  PosixTz get(String name);
}

/// [PosixTzDatabase] implementation with an in memory db
class InMemoryPosixTzDatabase implements PosixTzDatabase {
  /// constructor
  InMemoryPosixTzDatabase() : _posixTimezones = <String, PosixTz>{};

  final Map<String, PosixTz> _posixTimezones;

  @override
  void clear() {
    _posixTimezones.clear();
  }

  @override
  void add(PosixTz posixTz) {
    _posixTimezones[posixTz.name] = posixTz;
  }

  @override
  PosixTz get(String name) {
    if (!isInitialized) {
      throw const PosixTzNotFound(
        'Tried to retrieve PosixTz before initialization',
      );
    }

    final posixTz = _posixTimezones[name];

    if (posixTz == null) {
      throw PosixTzNotFound('$name not found');
    }

    return posixTz;
  }

  /// check if posixTz database is initialized
  bool get isInitialized => _posixTimezones.isNotEmpty;
}
