/*
 * Package : xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 *
 */

part of '../xml2json.dart';

/// Exception class
///
/// This exception is thrown when Xml2Json has an internal error,
/// such as an invalid parameter being passed to a function.
class Xml2JsonException implements Exception {
  final String _message;

  /// Xml2Json exception
  Xml2JsonException([this._message = 'No Message Supplied']);

  @override
  String toString() => 'Xml2JsonException: message = $_message';
}
