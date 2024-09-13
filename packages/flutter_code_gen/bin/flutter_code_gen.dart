import 'package:args/args.dart';

void main(List<String> arguments) async {
  var parser = ArgParser();

  parser
    ..addFlag('help',
        abbr: 'h', negatable: false, help: 'Show help information.')
    ..addOption('name', abbr: 'n');

  var result = parser.parse(arguments);

  // Kiểm tra nếu cờ help được sử dụng
  if (result['help']) {
    print('Hướng dẫn sử dụng:');
    print(parser.usage); // In ra các tùy chọn có sẵn
    return;
  } else {
    print("Hello world ${result['name']}");
  }
}
