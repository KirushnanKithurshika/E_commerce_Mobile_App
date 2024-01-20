import 'package:logger/logger.dart'; // Fix the import statement

class TLoggerHelper {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    // Customize the log levels based on your needs
    level: Level.debug, // Fix the capitalization of 'Level'
  );

  // Logger methods
  static void debug(String message) {
    _logger.d(message); //
  }

  static void info(String message) {
    _logger.i(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }

  static void error(String message, [dynamic error]) {
    _logger.e(message, error:error, stackTrace:StackTrace.current); // Fix the parameters
  }
}
