// ignore_for_file: prefer_const_constructors
import 'package:posix_tz/posix_tz.dart';
import 'package:test/test.dart';

void main() {
  group('PosixTz', () {
    setUp(() {
      posixTzDb.clear();
    });

    test('can be instantiated', () {
      expectLater(initializePosixTz, returnsNormally);
    });

    test('can add property on posixTzDb', () async {
      await initializePosixTz();
      posixTzDb.add(PosixTz(name: 'Ababwa', posix: '<+06>-6'));
      expect(posixTzDb.get('Ababwa'), isNotNull);
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

    test(
      'should throw PosixTzNotFound',
      () async {
        await initializePosixTz();
        expect(
          () => posixTzDb.get('Ababwa'), // 🧞‍♂️
          throwsA(TypeMatcher<PosixTzNotFound>()),
        );
      },
    );

    test(
      'should be equal',
      () async {
        await initializePosixTz();
        final posixTz1 = posixTzDb.get('Europe/Rome');
        final posixTz2 = posixTzDb.get('Europe/Rome');
        expect(
          posixTz1 == posixTz2, // 🧞‍♂️
          true,
        );
      },
    );

    test(
      'should be different',
      () async {
        await initializePosixTz();
        final posixTz1 = posixTzDb.get('Europe/Rome');
        final posixTz2 = posixTzDb.get('Atlantic/Stanley');
        expect(
          posixTz1 == posixTz2, // 🧞‍♂️
          false,
        );
      },
    );
  });
}
