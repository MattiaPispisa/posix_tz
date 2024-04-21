// ignore_for_file: prefer_const_constructors
import 'package:posix_tz/posix_tz.dart';
import 'package:test/test.dart';

void main() {
  group('PosixTx', () {
    test('can be instantiated', () {
      expectLater(initializePosixTz, returnsNormally);
    });

    test('should throw PosixTzNotFound on reading db before init', () {
      expect(
        () => posixTzDb.get('Europe/Rome'),
        throwsA(TypeMatcher<PosixTzNotFound>()),
      );
    });

    test('should return a posixTz', () async {
      await initializePosixTz();
      expect(posixTzDb.get('Europe/Rome'), isNotNull);
    });
  });
}
