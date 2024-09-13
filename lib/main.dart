import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texpense/app.dart';
import 'package:texpense/core/utils/app_logger.dart';
import 'package:texpense/firebase_options.dart';
import 'package:texpense/singleton.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (kDebugMode) {
      // Ideal time to initialize
      const localHost = '192.168.6.106';
      // const localHost = 'localhost';
      await FirebaseAuth.instance.useAuthEmulator(localHost, 9099);
      FirebaseFirestore.instance.useFirestoreEmulator(localHost, 8080);
    }
    setup();

    runApp(const ProviderScope(child: App()));
  }, (error, stack) {
    AppLogger.e("runZonedGuarded", error, stack);
    // TODO: base
    // TroubleShootingLog.insertLog(
    //   LogType.ERROR,
    //   LogService.SYSTEM,
    //   "runZonedGuarded - error: ${error.toString()}",
    // );
    if (!kDebugMode) {
      // FirebaseCrashlytics.instance.recordError(error, stack);
    }
  });
}
