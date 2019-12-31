/*
 * Package : xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 *
 */

part of xml2json;

/// Exception class
///
/// This exception is thrown when Xml2Json has an internal error,
/// such as an invalid parameter being passed to a function.
class Xml2JsonException implements Exception {
  /// Xml2Json exception
  Xml2JsonException([this._message = 'No Message Supplied']);

  // ignore: unnecessary_final
  final String _message;

  @override
  String toString() => 'Xml2JsonException: message = $_message';
}
