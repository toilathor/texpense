import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:texpense/common/inapp_debug_console_manager/inapp_debug_console_model.dart';
import 'package:texpense/core/utils/app_logger.dart';

part 'highlight_text.dart';
part 'inapp_debug_console_view.dart';

final _inAppDebugConsoleController =
    StreamController<InAppDebugConsoleModel>.broadcast();
const int _maxData = 100;

String _keywordFilter = "";

class InAppDebugConsoleManager {
  InAppDebugConsoleManager._internal();

  static InAppDebugConsoleManager? _instance;

  static InAppDebugConsoleManager get shared {
    _instance ??= InAppDebugConsoleManager._internal();

    return _instance!;
  }

  OverlaySupportEntry? _overlay;

  bool get isShowing => _overlay != null;

  final List<InAppDebugConsoleModel> _datas = [];

  void show({BuildContext? context}) {
    if (!_canDebug) return;

    if (isShowing) hide();

    try {
      _overlay ??= showOverlay(
        (_, __) => SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: InAppDebugConsoleView(datas: _datas),
        ),
        context: context,
        duration: Duration.zero,
      );
    } catch (e) {
      AppLogger.e(e);
      _overlay = null;
    }
  }

  void hide() {
    try {
      _overlay?.dismiss(animate: false);
      _overlay = null;
    } catch (e) {
      AppLogger.e(e);

      _overlay = null;
    }
  }

  void add(InAppDebugConsoleModel data) {
    if (!_canDebug) return;

    try {
      if (_datas.length >= _maxData) {
        _datas.removeLast();
      }
    } catch (_) {}
    _datas.insert(0, data);
    _inAppDebugConsoleController.sink.add(data);
  }

  void clear() {
    _datas.clear();
  }

  bool get _canDebug => kDebugMode;

  ///Constants.instance.flavor == Flavor.development;
}
