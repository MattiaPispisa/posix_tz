# Posix Tz

This library provides timezones in the standard Posix format. The data is obtained by reading the content of `/usr/share/zoneinfo`.

## Initialization

It's important to initialize the library before reading the timezones.

```dart
void main() {
    await initializePosixTz();
}
```

## Usage

```dart
// after initialization
final posixTz = db.get("Europe/Rome");
print(posixTz.toString()) // name:Europe/Rome, posix:CET-1CEST,M3.5.0,M10.5.0/3
```

## Other

`PosixTz` can be compared.

```dart
final posixTz1 = posixTzDb.get('Europe/Rome');
final posixTz2 = posixTzDb.get('Europe/Rome');
final posixTz3 = posixTzDb.get('Atlantic/Stanley');
print(posixTz1 == posixTz2); // true
print(posixTz1 == posixTz3); // false
```

`posixTzDb` can be expanded.

```dart
posixTzDb.add(PosixTz(name: "Ababwa",posix: "<+06>-6"));
```
