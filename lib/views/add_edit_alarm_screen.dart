import 'package:drippe/models/alarm.dart';
import 'package:drippe/viewModels/alarm_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddEditAlarmScreen extends ConsumerStatefulWidget {
  final List<Alarm> alarmList;
  final int? index;
  AddEditAlarmScreen(this.alarmList, {this.index});

  @override
  ConsumerState<AddEditAlarmScreen> createState() => _AddEditAlarmScreenState();
}

class _AddEditAlarmScreenState extends ConsumerState<AddEditAlarmScreen> {
  TextEditingController controller = TextEditingController();

  Duration duration = const Duration(minutes: 10, seconds: 00);

  void initEditAlarm() {
    if (widget.index != null) {
      duration = widget.alarmList[widget.index!].alarmTime as Duration;
      controller.text = formatDuration(duration);
      setState(() {});
    }
  }

  String formatDuration(Duration duration) {
    return "${duration.inMinutes.remainder(60).toString().padLeft(2, "0")}:${duration.inSeconds.remainder(60).toString().padLeft(2, "0")}";
  }

  @override
  void initState() {
    super.initState();
    initEditAlarm();
  }

  @override
  Widget build(BuildContext context) {
    final alarmViewModel = ref.watch(alarmViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        elevation: 0,
        leading: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            child: const Text('キャンセル', style: TextStyle(color: Colors.orange)),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.only(right: 20),
              alignment: Alignment.center,
              child: const Text('保存', style: TextStyle(color: Colors.orange)),
            ),
            onTap: () async {
              // 編集中の場合
              if (widget.index != null) {
                Alarm alarm = Alarm(
                    id: widget.alarmList[widget.index!].id,
                    alarmTime: Duration(
                        minutes: duration.inMinutes.remainder(60),
                        seconds: duration.inSeconds.remainder(60)));
                await alarmViewModel.updateAlarm(alarm);
              } else {
                // 追加の場合
                Alarm alarm = Alarm(
                    alarmTime: Duration(
                        minutes: duration.inMinutes.remainder(60),
                        seconds: duration.inSeconds.remainder(60)));
                await alarmViewModel.addAlarm(alarm.alarmTime);
              }
              Navigator.pop(context);
            },
          )
        ],
        title: widget.index != null ? Text("アラームを編集") : Text("アラームを追加"),
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 64, fontWeight: FontWeight.w200),
                  decoration: const InputDecoration(border: InputBorder.none),
                  readOnly: true,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return CupertinoTimerPicker(
                          initialTimerDuration: duration,
                          mode: CupertinoTimerPickerMode.ms,
                          onTimerDurationChanged: (Duration newDuration) {
                            String time = formatDuration(newDuration);
                            controller.text = time;
                            setState(() => duration = newDuration);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
