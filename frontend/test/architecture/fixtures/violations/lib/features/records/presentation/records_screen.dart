import '../../capture/data/capture_repository_impl.dart';
import '../data/records_repository_impl.dart';

/// A screen reaching into its own data layer and into another feature's.
String shownRecord() => storedRecord + storedName;
