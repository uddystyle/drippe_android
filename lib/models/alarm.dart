class Alarm {
  int id;
  Duration alarmTime;
  bool isActive;

  Alarm({
    this.id = 0,
    required this.alarmTime,
    this.isActive = true,
  });
}
