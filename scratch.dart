void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String result = await task2();
  task3(result);
}

void task1() {
  print('task 1 complete');
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String result;
  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('task 2 complete');
  });
  return result;
}

void task3(String task2Data) {
  print('task 3 complete with $task2Data');
}
