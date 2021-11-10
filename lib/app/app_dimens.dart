import 'package:flutter/material.dart';

class AppDimensions {
  AppDimensions({required BuildContext context}) {
    _context = context;
  }

  BuildContext? _context;
  double get _width => MediaQuery.of(_context!).size.width;
  double get _height => MediaQuery.of(_context!).size.height;

  double get width => _width;
  double get height => _height;
}
