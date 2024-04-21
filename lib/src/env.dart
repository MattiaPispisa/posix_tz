import 'package:posix_tz/posix_tz.dart';
import 'package:posix_tz/src/encoded_data.dart';

/// database singleton
final _database = InMemoryPosixTzDatabase();

/// Global Posix timezones database
PosixTzDatabase get posixTzDb => _database;

/// initialize posix timezones
///
/// can throw [PosixTzInitException]
Future<void> initializePosixTz() async {
  _database.clear();

  try {
    final entries = await _loadPosixTz().toList();
    for (final entry in entries) {
      _database.add(_PosixTzFromEntry.load(entry));
    }
  } catch (e) {
    throw PosixTzInitException(e.toString());
  }
}

/// async load data
Stream<MapEntry<String, String>> _loadPosixTz() async* {
  for (final entry in data.entries) {
    yield entry;
  }
}

/// extension to convert data to [PosixTz]
extension _PosixTzFromEntry on PosixTz {
  static PosixTz load(MapEntry<String, String> entry) {
    return PosixTz(name: entry.key, posix: entry.value);
  }
}
