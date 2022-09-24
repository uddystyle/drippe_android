import 'package:drippe/core/localization/generated/l10n.dart';
import 'package:drippe/locator.dart';
import 'package:drippe/models/alarm.dart';
import 'package:drippe/viewModels/alarm_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final I10n _i10n = locator<I10n>();

class AddEditAlarmScreen extends StatefulWidget {
  final List<Alarm> alarmList;
  final int? index;
  AddEditAlarmScreen(this.alarmList, {this.index});

  @override
  State<AddEditAlarmScreen> createState() => _AddEditAlarmPageState();
}

class _AddEditAlarmPageState extends State<AddEditAlarmScreen> {
  TextEditingController controller = TextEditingController();

  Duration duration = const Duration(minutes: 10, seconds: 00);

  void initEditAlarm() {
    if (widget.index != null) {
      duration = widget.alarmList[widget.index!].alarmTime;
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
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        elevation: 0,
        leading: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            child: Text(_i10n.cancel,
                style: const TextStyle(color: Colors.orange)),
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
              child: Text(_i10n.save,
                  style: const TextStyle(color: Colors.orange)),
            ),
            onTap: () async {
              Alarm alarm = Alarm(
                  alarmTime: Duration(
                      minutes: duration.inMinutes.remainder(60),
                      seconds: duration.inSeconds.remainder(60)));
              // 編集中の場合
              if (widget.index != null) {
                alarm.id = widget.alarmList[widget.index!].id;
                await AlarmProvider.updateData(alarm);
              } else {
                // 追加の場合
                await AlarmProvider.insertData(alarm);
              }
              Navigator.pop(context);
            },
          )
        ],
        // backgroundColor: Colors.white,
        title:
            widget.index != null ? Text(_i10n.editAlarm) : Text(_i10n.addAlarm),
      ),
      body: Container(
        height: double.infinity,
        // color: Colors.white,
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
                            String time =
                                // "${newDuration.inMinutes.remainder(60).toString().padLeft(2, "0")}:${newDuration.inSeconds.remainder(60).toString().padLeft(2, "0")}";
                                formatDuration(newDuration);
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
