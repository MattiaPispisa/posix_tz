// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

/// Posix timezone info
class PosixTz {
  /// constructor
  const PosixTz({
    required this.name,
    required this.posix,
  });

  /// location name
  final String name;

  /// posix timezone
  final String posix;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PosixTz && other.name == name && other.posix == posix;
  }

  @override
  int get hashCode => name.hashCode ^ posix.hashCode;

  @override
  String toString() {
    return 'name:$name, posix:$posix';
  }
}
