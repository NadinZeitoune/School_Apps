import 'dart:async';

main() {
  // Print an integer every second 15 times.
  var counterStream = timedCounter(const Duration(seconds: 1), 15);
  counterStream.listen((data) => print(data));
}

Stream<int> timedCounter(Duration interval, [int maxCount]) {
  StreamController<int> controller;
  Timer timer;
  int counter = 0;

  void tick(_) {
    counter++;
    controller.add(counter);
    if (counter == maxCount) {
      timer.cancel();
      controller.close();
    }
  }

  void startTimer() {
    timer = Timer.periodic(interval, tick);
  }

  void stopTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }

  controller = StreamController<int>(
      onListen: startTimer,
      onPause: stopTimer,
      onResume: startTimer,
      onCancel: stopTimer);
  return controller.stream;
}
