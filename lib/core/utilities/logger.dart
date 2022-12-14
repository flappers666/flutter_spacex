import 'package:flutter/material.dart';
import 'package:logging/logging.dart' as logging;

class Logger<T> {
  final logging.Logger _logger;
  final T callingClass;

  Logger(this.callingClass)
      : _logger = logging.Logger((callingClass).toString());

  static final Map<logging.Level, String> _levelPrefix =
      <logging.Level, String>{
    logging.Level.FINE: '🔬 VERBOSE',
    logging.Level.CONFIG: '🤓 DEBUG',
    logging.Level.INFO: 'ℹ️ INFO',
    logging.Level.WARNING: '⚠️ WARNING',
    logging.Level.SEVERE: '💀 ERROR',
  };

  static void initialise({bool isRelease = true}) {
    if (isRelease) {
      logging.Logger.root.level = logging.Level.OFF;
    } else {
      logging.Logger.root.level = logging.Level.FINEST;
    }
    logging.Logger.root.onRecord.listen((record) {
      debugPrint(
          '${record.time} ${_levelPrefix[record.level]}: ${record.loggerName} -> ${record.message}');
    });
  }

  void verbose(String? msg, [Object? error, StackTrace? stackTrace]) {
    _logger.fine(msg, error, stackTrace);
  }

  void debug(String? msg, [Object? error, StackTrace? stackTrace]) {
    _logger.config(msg, error, stackTrace);
  }

  void info(String? msg, [Object? error, StackTrace? stackTrace]) {
    _logger.info(msg, error, stackTrace);
  }

  void warning(String? msg, [Object? error, StackTrace? stackTrace]) {
    _logger.warning(msg, error, stackTrace);
  }

  void error(String? msg, [Object? error, StackTrace? stackTrace]) {
    _logger.severe(msg, error, stackTrace);
  }
}
