library flutter_code_gen;

import 'package:build/build.dart';
import 'package:flutter_code_gen/src/core/gen_icon_font.dart';

/// [genIconFont] is a function used to generate IconData from IcoMoon json file
/// It will be called automatically when using the command: dart run build_runner build
Builder genIconFont(BuilderOptions options) => GenIconFont(options);
