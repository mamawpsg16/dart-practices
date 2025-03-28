/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

export 'src/test_package_base.dart';
// Conditional import
export 'src/hw_none.dart' // Default stub
    if (dart.library.io) 'src/hw_io.dart' // dart:io implementation
    if (dart.library.js_interop) 'src/hw_web.dart'; // Web implementation

// TODO: Export any libraries intended for clients of this package.
