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
}
