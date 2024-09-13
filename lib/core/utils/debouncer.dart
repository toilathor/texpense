import 'dart:async';

class Debouncer {
  final Duration duration;

  Debouncer({
    this.duration = const Duration(seconds: 1),
  });

  Timer? _timer;

  void run(Function()? action) {
    _timer?.cancel();
    _timer = Timer(duration, () => action?.call());
  }

  void dispose() {
    _timer?.cancel();
  }
}
