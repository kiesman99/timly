import 'package:logger/logger.dart';

/// TODO: Switch to HybridPrinter once available
class LoggerMixin {

  var logger = Logger(
    printer: SimplePrinter()
  );

  var loggerNS = Logger(
    printer: SimplePrinter()
  );

}