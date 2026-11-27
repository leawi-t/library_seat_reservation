import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The app's source of "now". Override in tests for deterministic times.
final clockProvider = Provider<DateTime Function()>((ref) => DateTime.now);
