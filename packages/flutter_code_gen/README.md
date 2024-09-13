<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

[![pub version][flutter_code_gen_pub_version]][flutter_code_gen_pub] [![pub points][flutter_code_gen_badge_pub_points]][flutter_code_gen_pub_points]

A Flutter package support creating IconData from IcoMoon json file and more.

The goal of this package is to be able to use it to generate code.
In the first versions, it will only support creating IconData from IcoMoon json file.
Next will be creating the code base, which may include Design Token from Figma Studio

# Installation

## As a part of build_runner

1. Add [build_runner](https://pub.dev/packages/build_runner)
   and [flutter_code_gen](https://pub.dev/packages/flutter_code_gen) to your package's pubspec.yaml
   file:

    ```yaml
    dev_dependencies:
      build_runner:
      flutter_code_gen:
    ```

2. Install FlutterCodeGen

    ```shell
    flutter pub get
    ```

3. Use FlutterCodeGen

    ```shell
    dart run build_runner build
    ```

   See also [build_runner](https://pub.dev/packages/build_runner)

# Configuration file

# Documents and references

Inspired by [FlutterGen](https://pub.dev/packages/flutter_gen)
by [wasabeef](https://pub.dev/publishers/wasabeef.jp/packages)

[flutter_code_gen_pub_version]: https://img.shields.io/pub/v/flutter_code_gen?include_prereleases&style=flat&logo=dart
[flutter_code_gen_pub]: https://pub.dev/packages/flutter_code_gen

[flutter_code_gen_pub_points]: https://pub.dev/packages/flutter_code_gen/score
[flutter_code_gen_badge_pub_points]: https://img.shields.io/pub/points/flutter_code_gen?color=2E8B57&label=pub%20points