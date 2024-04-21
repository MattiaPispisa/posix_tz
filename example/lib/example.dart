import 'package:posix_tz/posix_tz.dart';

Future<void> main() async {
  await initializePosixTz();
  posixTzDb.get('Europe/Rome');
}
